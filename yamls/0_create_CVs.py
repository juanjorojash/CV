import subprocess
import pandas as pd
datos = pd.read_csv("00_datos.csv")

# datos = pd.read_csv("datos.csv")

CVdir = "C:\\Repositories\\CV\\yamls\\"

#subprocess.run(f"rendercv render {CVdir}{name}.yml", shell=True, check=True)

for _, row in datos.iterrows():
    print(f"{row.nombre} ({row.codigo})")
    id = row["codigo"]
    subprocess.run(f"rendercv render {CVdir}{id}.yml", shell=True, check=True)

subprocess.run(["del", f"C:\\Repositories\\CV\\CVs\\*.typ"], shell=True, check=True)