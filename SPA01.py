import pandas as pd
import yaml
import os
from datetime import date, datetime
import rendercv.data.generator as gen

model = gen.create_a_sample_data_model(name="juanjospa", theme="engineeringresumes")

# Convert to plain dict using Pydantic (no __dict__, no !!python/object, etc.)
clean_dict = model.model_dump()  # Use .dict() if you're using older pydantic

# Dump as normal YAML
with open("examplespa.yaml", 'w', encoding='utf-8') as f:
    yaml.dump(clean_dict, f, allow_unicode=True, sort_keys=False)

today = date.today()

# === Cargar los csv con los datos de los profes ===
datos = pd.read_csv("00_datos.csv")
grados = pd.read_csv("01_grados.csv")
grados = grados.sort_values(by="año",ascending=False)
experi = pd.read_csv("02_experiencia.csv")
experi.fillna("",inplace=True)
idiomas = pd.read_csv("03_idiomas.csv")
areas = pd.read_csv("04_areas_interes.csv")
cursos = pd.read_csv("05_cursos.csv")
publicaciones = pd.read_csv("06_publicaciones.csv")
publicaciones.fillna("0",inplace=True)
certificados = pd.read_csv("07_certificados.csv")
certificados["fecha"] = pd.to_datetime(certificados["fecha"], format="%d/%m/%Y")
certificados = certificados.sort_values(by="fecha",ascending=False)
certificados["fecha"] = certificados["fecha"].dt.strftime("%d/%m/%Y") #conver back to string
investigacion = pd.read_csv("08_investigacion.csv")
investigacion["inicio"] = pd.to_datetime(investigacion["inicio"], format="%d/%m/%Y")
investigacion = investigacion.sort_values(by="inicio",ascending=False)
investigacion["inicio"] = investigacion["inicio"].dt.strftime("%d/%m/%Y")
habilil = pd.read_csv("09_habilidades.csv")
membres = pd.read_csv("10_membresias.csv")
                

# === Step 2: Create output folder ===
output_dir = "yamls"
os.makedirs(output_dir, exist_ok=True)

def convert_cr_to_iso(date_cr):
    if date_cr != "present":
        return datetime.strptime(date_cr, "%d/%m/%Y").strftime("%Y-%m-%d")
    else:
        return date_cr

def make_education_entries(grados):
    education_entries = []
    for _, row in grados.iterrows():
        entry = {
            "institution": row["institucion"],
            "area": row["campo"],
            "degree": row["grado"],
            "location": row["pais"],
            "end_date": f"{int(row['año'])}",
        }
        education_entries.append(entry)
    return education_entries

def make_career_entries(carrera):
    career_entries = []
    for _, row in carrera.iterrows():
        entry = {
            "name": row["categoria"],
            "date": row["fecha"],
        }
        career_entries.append(entry)
    return career_entries

def make_publication_entries(publicaciones):
    publication_entries = []
    for _, row in publicaciones.iterrows():
        autoresd = row.get("autores","").split(";")
        autores = [x.strip() for x in autoresd]
        date = f"{int(row["dia"]):02d}/{int(row["mes"]):02d}/{int(row["año"])}"
        if row["dia"] == "0": 
            date = f"{int(row["mes"])}/{int(row["año"])}"
        if row["mes"] == "0":
            date = f"{int(row["año"])}"
        entry = {
            "title": row["titulo"],
            "journal": row["revista"],
            "authors": autores,
            "date": date,
            "doi": row["doi"]
        }
        publication_entries.append(entry)
    return publication_entries

def make_certificates_entries(certificados):
    certificate_entries = []
    for _, row in certificados.iterrows():
        entry = {
            "name": f"[{row["certificado"]}]({row["link"]}) on {row["institucion"]}",
            "date": row["fecha"],
        }
        certificate_entries.append(entry)
    return certificate_entries

def make_research_entries(investigacion):
    research_entries = []
    for _, row in investigacion.iterrows():
        entry = {
            "position": row["investigacion"],
            "start_date": convert_cr_to_iso(row["inicio"]),
            "end_date": convert_cr_to_iso(row["fin"]), 
            "company": row["institution"],
            "summary": row["detalles"]   
        }
        research_entries.append(entry)
    return research_entries

def make_experience_entries(experi):
    experi_entries = []
    for _, row in experi.iterrows():
        entry = {
            "company": row["empresa"],
            "position": row["puesto"],
            "start_date": convert_cr_to_iso(row["inicio"]),
            "end_date": convert_cr_to_iso(row["fin"]),
            "summary": row["descripcion"]
        }
        experi_entries.append(entry)
    return experi_entries  

def make_language_entries(idiomas):
    idiom_entries = []
    for _, row in idiomas.iterrows():
        entry = {
            "bullet": f"{row["idioma"]}: {row["detalle"]}"
        }
        idiom_entries.append(entry)
    return idiom_entries  

def make_interest_entries(areas):
    area_entries = []
    for _, row in areas.iterrows():
        entry = {
            "bullet": f"{row["area"]}"
        }
        area_entries.append(entry)
    return area_entries 

def make_rendercv_yaml(id,datos,grados):
    print(datos.nombre)
    match datos.titulo:
            case "M.Sc." | "Lic." | "Ing." | "Máster" | "Dr.-Ing." | "Mag." | "D.Eng.":
                nombre =  f"{datos.titulo} {datos.nombre}"
            case "Ph.D.":
                nombre = f"{datos.nombre}, {datos.titulo}"
    education = make_education_entries(grados[grados["codigo"]==id])
    public = make_publication_entries(publicaciones[publicaciones["codigo"]==id])
    research = make_research_entries(investigacion[investigacion["codigo"]==id])
    experie = make_experience_entries(experi[experi["codigo"]==id])
    languag = make_language_entries(idiomas[idiomas["codigo"]==id])
    interes = make_interest_entries(areas[areas["codigo"]==id])
    certifi = make_certificates_entries(certificados[certificados["codigo"]==id])
    sections = {
    "Perfil": [
        "Ingeniero e investigador especializado en automatización, diseño de PCB, modelado y simulación 3D, e integración de sistemas\
        para sistemas ciberfísicos e instrumentación a la medida. Experto en el desarrollo, prueba y modelado de sistemas de almacenamiento\
        de energía a pequeña escala, así como en el diseño y desarrollo de sistemas de potencia y bancos de prueba automatizados aplicados\
        al ámbito aeroespacial. Con experiencia en traducir requisitos complejos de sistema en prototipos y plataformas experimentales confiables,\
        combinando diseño de hardware, control automático, simulación multifísica e integración de sistemas para la implementación\
        de soluciones ciberfísicas en aplicaciones comerciales e industriales."
    ],
    "Información personal": [
        {"label": "Cédula", "details": str(datos["cedula"])},
        {"label": "ORCID", "details": datos["orcid"] if datos["orcid"] != "00" else "N/A"},
        {"label": "LinkedIn", "details": "[juan-josé-rojas-hernández-257903b](https://www.linkedin.com/in/juan-jos%C3%A9-rojas-hern%C3%A1ndez-257903b/)"},
    ]
    }
    sections["Educación"] = education
    if experie:
        sections["Experiencia"] = experie
    if languag:
        sections["Lenguajes"] = languag
    if interes:
        sections["Intereses"] = interes
    if public:
        sections["Publicaciones"] = public
    if certifi:
        sections["Certificados"] = certifi
    if research:
        sections["Investigacion y desarrollo"] = research

    yaml_dict = {
        "cv": {
            "name": nombre,
            "email": datos["correo"],
            "phone": f"+506-{datos["telefono"]}",
            "sections": sections,         
        },
        "locale": {
            "phone_number_format": "international",
            "last_updated_date_template": f"Última actualización: {today.strftime("%d/%m/%Y")}",
            "date_template": "MONTH_ABBREVIATION YEAR",
        },
        "rendercv_settings": {
            "date": "2025-06-08",
            "render_command": {
                "output_folder_name": "CVs",
                "dont_generate_html": True,
                "dont_generate_markdown": True,
                "dont_generate_png": True
            }
        },
        "design": {
            "theme": "engineeringresumes", 
            "entry_types": {
                "education_entry": {
                    "main_column_first_row_template": '**INSTITUTION**, DEGREE en AREA',
                    "degree_column_width": "2.5cm"
                },
                "experience_entry": {
                    "date_and_location_column_template": "DATE"
                }
            }
        }
    }
    return yaml_dict, f"{id}.yml"

# === Step 4: Generate YAML files
def generate_CV(id):
    row = datos[datos["codigo"]==id].iloc[0]
    yaml_dict, filename = make_rendercv_yaml(id,row,grados)
    filepath = os.path.join(output_dir, filename)
    with open(filepath, 'w', encoding='utf-8') as f:
        yaml.dump(yaml_dict, f, allow_unicode=True, sort_keys=False)



generate_CV("SPA01")