
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Dr.-Ing. Juan J. Rojas"
#let locale-catalog-page-numbering-style = context { "Dr.-Ing. Juan J. Rojas - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated: 22/10/2025"
#let locale-catalog-language = "en"
#let design-page-size = "us-letter"
#let design-section-titles-font-size = 1.2em
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 0, 0)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 0, 0)
#let design-colors-connections = rgb(0, 0, 0)
#let design-colors-links = rgb(0, 0, 0)
#let design-section-titles-font-family = "XCharter"
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 0.5pt
#let design-section-titles-font-size = 1.2em
#let design-section-titles-type = "with-parial-line"
#let design-section-titles-vertical-space-above = 0.55cm
#let design-section-titles-vertical-space-below = 0.3cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = false
#let design-text-font-size = 10pt
#let design-text-leading = 0.6em
#let design-text-font-family = "XCharter"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = false
#let design-header-name-font-family = "XCharter"
#let design-header-name-font-size = 25pt
#let design-header-name-bold = false
#let design-header-connections-font-family = "XCharter"
#let design-header-vertical-space-between-name-and-connections = 0.7cm
#let design-header-vertical-space-between-connections-and-first-section = 0.7cm
#let design-header-use-icons-for-connections = false
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = "|"
#let design-header-alignment = center
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "•"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0cm
#let design-highlights-vertical-space-between-highlights = 0.19cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.3em
#let design-entries-vertical-space-between-entries = 0.4cm
#let design-entries-date-and-location-width = 4.15cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0cm
#let design-page-top-margin = 2cm
#let design-page-bottom-margin = 2cm
#let design-page-left-margin = 2cm
#let design-page-right-margin = 2cm
#let design-page-show-last-updated-date = true
#let design-page-show-page-numbering = false
#let design-links-underline = true
#let design-entry-types-education-entry-degree-column-width = 2.5cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)
#set enum(
  spacing: design-entries-vertical-space-between-entries,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-bullet,
  spacing: 0pt,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    font: design-header-name-font-family,
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #it.body
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    font: design-section-titles-font-family,
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-parial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  set text(fill: design-colors-connections, font: design-header-connections-font-family)
  set par(leading: design-text-leading*1.7, justify: false)
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

= Dr.-Ing. Juan J. Rojas

// Print connections:
#let connections-list = (
  [#box(original-link("mailto:juanjorojash@gmail.com")[juanjorojash\@gmail.com])],
  [#box(original-link("tel:+506-8858-1419")[+506 8858 1419])],
)
#connections(connections-list)



== Profile


#one-col-entry(
  content: [Engineer and researcher skilled in PCB design,         3D modeling and simulation, and system integration for cyber-physical systems and custom instrumentation.         Proficient in developing, testing and modeling small-scale energy storage systems, and in creating tailored solutions          for aerospace power systems. Experienced in translating complex system requirements into reliable prototypes and experimental platforms,          combining hardware design, multiphysics simulation, and hands-on implementation in cyber-physical systems for aerospace and IoT applications.]
)


== Personal Information


#one-col-entry(
  content: [#strong[ID:] 303910836]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[ORCID:] #link("https://orcid.org/0000-0002-3261-5005")[0000-0002-3261-5005]]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[LinkedIn:] #link("https://www.linkedin.com/in/juan-jos%C3%A9-rojas-hern%C3%A1ndez-257903b/")[juan-josé-rojas-hernández-257903b]]
)


== Education


// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #strong[Kyushu Institute of Technology], Doctor in Applied science for systems integration engineering
  ],
  right-content: [
    2020
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    
  ],
  inset: (
    left: design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #strong[Instituto Tecnológico de Costa Rica], Master in Electronics Engineering with emphasis on MEMS
  ],
  right-content: [
    2016
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    
  ],
  inset: (
    left: design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #strong[Instituto Tecnológico de Costa Rica], Bachelor in Electromechanical Engineering
  ],
  right-content: [
    2008
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    
  ],
  inset: (
    left: design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)



== Experience


#two-col-entry(
  left-content: [
    #strong[Researcher and Professor], Tecnológico de Costa Rica 
  ],
  right-content: [
    Feb 2014 – present
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Teaching subjects such as Electricity, Electrical Control, and Instrumentation, and conducting research in cyber-physical systems, satellite power systems, and instrumentation])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Maintenance Manager], Crowne Plaza Hotel 
  ],
  right-content: [
    Feb 2013 – June 2013
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Maintenance and investments management])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Project Engineer], Musmanni Corporation 
  ],
  right-content: [
    Apr 2012 – Dec 2012
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Facilities remodeling and permits coordination])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Electromechanical Instalations Engineer], Walmart 
  ],
  right-content: [
    Dec 2008 – Mar 2012
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Coordination of electromechanical installations in construction projects])], column-gutter: 0cm)
  ],
)



== Languages


#one-col-entry(
  content: [- Spanish: Native],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- English: TOEFL 100\/120 iBT],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Portuguese: Basic conversation],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Japanese: Beginner],
)


== Interests


#one-col-entry(
  content: [- Custom-made cyber-physical systems oriented to specific user or community needs],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Custom-made instrumentation systems],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Battery characterization and modeling],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Satellite power systems],
)


== Publications


#two-col-entry(
  left-content: [
    #strong[Design of an embedded system for the control and regulation of the dynamic charging and discharging process of electrochemical cells and its subsequent validation for CubeSat 1U satellites]

  ],
  right-content: [
    28\/06\/2024
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Kevin Gómez-Villagra, Juan José Rojas-Hernandez

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.18845/tm.v37i3.6833")[10.18845/tm.v37i3.6833] (Revista Tecnología en Marcha)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Development and testing of a system for remotely sensing wind speed]

  ],
  right-content: [
    01\/08\/2022
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Nestor Martínez-Soto, Juan J. Rojas, Gustavo Richmond-Navarro

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.18845/tm.v35i7.6331")[10.18845/tm.v35i7.6331] (Revista Tecnología en Marcha)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Vertical evolution of wind turbulence intensity in complex terrain with obstacles]

  ],
  right-content: [
    01\/08\/2022
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Gustavo Richmond-Navarro, Raziel Farid Sanabria-Sandí, Luis Enrique Castro-Rodríguez, Juan J. Rojas, Williams R. Calderón-Muñoz

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.18845/tm.v35i7.6332")[10.18845/tm.v35i7.6332] (Revista Tecnología en Marcha)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Integration of an energy storage system in a wind farm: Case study]

  ],
  right-content: [
    01\/08\/2022
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Jorge David Araya Rodríguez, Juan J. Rojas, Gustavo Richmond-Navarro

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.18845/tm.v35i7.6333")[10.18845/tm.v35i7.6333] (Revista Tecnología en Marcha)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Design and development of a microfluidic platform with interdigitated electrodes for electrical impedance spectroscopy]

  ],
  right-content: [
    15\/12\/2021
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);José Miguel Barboza-Retana, Cristopher Vega Sánchez, Juan J. Rojas, Steven Quiel Hidalgo, Sofía Madrigal Gamboa, Paola Vega Castillo, Renato Rimolo Donadio

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.18845/tm.v35i1.5389")[10.18845/tm.v35i1.5389] (Revista Tecnología en Marcha)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[A Lean Satellite Electrical Power System with Direct Energy Transfer and Bus Voltage Regulation Based on a Bi-Directional Buck Converter]

  ],
  right-content: [
    05\/07\/2020
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Juan J. Rojas, Yamauchi Takashi, Mengu Cho

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.3390/aerospace7070094")[10.3390/aerospace7070094] (Aerospace)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Design, Implementation, and Operation of a Small Satellite Mission to Explore the Space Weather Effects in LEO]

  ],
  right-content: [
    27\/09\/2019
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Isai Fajardo, Aleksander Lidtke, Sidi Bendoukha, Jesus Gonzalez-Llorente, Rafael Rodríguez, Rigoberto Morales, Dmytro Faizullin, Misuzu Matsuoka, Naoya Urakami, Ryo Kawauchi, Masayuki Miyazaki, Naofumi Yamagata, Ken Hatanaka, Farhan Abdullah, Juan Rojas, Mohamed Keshk, Kiruki Cosmas, Tuguldur Ulambayar, Premkumar Saganti, Doug Holland, Tsvetan Dachev, Sean Tuttle, Roger Dudziak, Kei-ichi Okuyama

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.3390/aerospace6100108")[10.3390/aerospace6100108] (Aerospace)])



== Certificates


#two-col-entry(
  left-content: [
    #strong[#link("https://badgr.com/public/assertions/3iLZtFBgS8O8gmH4Q3LmXg")[Test and Data Analysis for Quality and Reliability] on Arizona State University] 
  ],
  right-content: [
    04\/11\/2024
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[#link("https://badgr.com/public/assertions/mdNXPDuERpiCluMJ6hl5Ow")[Application of Electrical & Thermo-Mechanical Modeling] on Arizona State University] 
  ],
  right-content: [
    28\/10\/2024
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[#link("https://badgr.com/public/assertions/6PnNrE-BRDCxMhZX89I3Vg")[2D Packaging & Assembly] on Arizona State University] 
  ],
  right-content: [
    18\/10\/2024
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[#link("https://badgr.com/public/assertions/U6y8WNZyTJaHWdJnz2OR2g")[Materials Selection for Thermo-Mechanical and Electrical Performance] on Arizona State University] 
  ],
  right-content: [
    18\/10\/2024
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[#link("https://badgr.com/public/assertions/WemDIgl2SUallUU6XfLl8A")[Introduction to Packaging Materials, Manufacturing, Test, and Reliability] on Arizona State University] 
  ],
  right-content: [
    30\/09\/2024
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[#link("https://badgr.com/public/assertions/IvBteFUvQ8ugpXaeYOWj5Q")[Introduction to Thermal Management and Mechanical Properties of Packages] on Arizona State University] 
  ],
  right-content: [
    25\/09\/2024
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[#link("https://badgr.com/public/assertions/COMt3LooTQWtTr5PXILFTQ")[Introduction to Electrical Concepts in Semiconductor Packaging] on Arizona State University] 
  ],
  right-content: [
    16\/09\/2024
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[#link("https://badgr.com/public/assertions/3ehRS86MRYq4kstRwCyMcg")[Introduction to Semiconductor Packaging and Design] on Arizona State University] 
  ],
  right-content: [
    09\/09\/2024
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[#link("nan")[Data Mining and Business Inteligence] on Instituto Tecnológico de Costa Rica] 
  ],
  right-content: [
    01\/08\/2022
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[#link("nan")[Big Data] on Instituto Tecnológico de Costa Rica] 
  ],
  right-content: [
    17\/03\/2022
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[#link("nan")[Statistics for Data Science] on Instituto Tecnológico de Costa Rica] 
  ],
  right-content: [
    13\/01\/2022
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[#link("nan")[Machine Learning] on Instituto Tecnológico de Costa Rica] 
  ],
  right-content: [
    23\/09\/2021
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[#link("nan")[Mathematics for Data Science] on Instituto Tecnológico de Costa Rica] 
  ],
  right-content: [
    22\/07\/2021
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[#link("https://www.coursera.org/account/accomplishments/verify/F7Q3G8HRKMKB")[Introduction to battery-management systems] on Coursera] 
  ],
  right-content: [
    03\/09\/2020
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[#link("https://www.coursera.org/account/accomplishments/verify/2UMXLMB3TKXS")[Introduction to Embedded Systems Software and Development Environments] on Coursera] 
  ],
  right-content: [
    05\/09\/2019
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[#link("https://www.coursera.org/account/accomplishments/verify/RHTEU3M6VV9X")[Embedded Software and Hardware Architecture] on Coursera] 
  ],
  right-content: [
    20\/08\/2019
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[#link("https://www.coursera.org/account/accomplishments/records/QUQBQ3QHCKQL")[Converter Control] on Coursera] 
  ],
  right-content: [
    19\/03\/2017
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[#link("https://www.coursera.org/account/accomplishments/records/SV59N2YTCFD2")[Converter Circuits] on Coursera] 
  ],
  right-content: [
    14\/02\/2017
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[#link("https://www.coursera.org/account/accomplishments/verify/5CSXP3DNCMGU")[Introduction to Power Electronics] on Coursera] 
  ],
  right-content: [
    06\/12\/2016
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[#link("https://cv.virtualtester.com/qr/?b=SLDWRKS&i=C-85F639RSWE")[SolidWorks Associate - Mechanical Design] on SolidWorks] 
  ],
  right-content: [
    22\/03\/2014
  ],
)
#one-col-entry(
  content: [
    
  ],
)



== Research


#two-col-entry(
  left-content: [
    #strong[Development of a Monitoring and Alert System for the Detection of Heat Exposure in Agricultural Work: Application in Sugarcane Harvesting], Instituto Tecnológico de Costa Rica 
  ],
  right-content: [
    Jan 2025 – Dec 2027
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Design, integration, verification, and validation of the monitoring and alert system])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Development of a Scalable and Modular Technological Platform for the Registration of Physical and Chemical Variables Associated with the Quality and Abundance of Drinking Water], Instituto Tecnológico de Costa Rica 
  ],
  right-content: [
    Jan 2025 – Dec 2027
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Integration of chemical sensing systems into the monitoring system for rural aqueducts])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[ASADAS-IoT: Development and Transfer of a Scalable, Modular, and Open Technological Platform for the ASADA of Paso Ancho, Oreamuno, Cartago], Instituto Tecnológico de Costa Rica 
  ],
  right-content: [
    Jan 2025 – Dec 2026
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Design, integration, verification, validation, and implementation of the monitoring system for rural aqueducts])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Predictive Maintenance: Development of Diagnostic and Prognostic Systems], Instituto Tecnológico de Costa Rica 
  ],
  right-content: [
    Jan 2024 – Dec 2025
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Prediction of battery health using existing datasets])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Development of a Pilot Digitalization Plan in ASADAS: Towards Better Water Resource Utilization through IoT Systems], Instituto Tecnológico de Costa Rica 
  ],
  right-content: [
    May 2023 – Dec 2023
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Implementation of a pilot integrated monitoring system for rural aqueducts])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Development of an Integrated System for CubeSat Power System Testing], Instituto Tecnológico de Costa Rica 
  ],
  right-content: [
    Jan 2022 – June 2024
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Design, integration, verification, and validation of the testing system])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Diagnosis of the Potential for Digital Transformation of Rural Aqueduct Administrative Associations \(ASADAS\) in the Chorotega Region], Instituto Tecnológico de Costa Rica 
  ],
  right-content: [
    Jan 2022 – June 2023
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Interviews and analysis with stakeholders for digital transformation initiatives])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Development of a Charger\/Discharger System for Electrochemical Cell Screening and Testing], Kyushu Institute of Technology \(Center for Nanosatellite Testing\) 
  ],
  right-content: [
    Oct 2016 – Oct 2016
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Design, integration, verification, and validation of the testing system])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Ten-Koh Satellite], Kyushu Institute of Technology \(OkuyamaLAB\) 
  ],
  right-content: [
    Sept 2016 – Nov 2018
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Design, integration, and verification of the power subsystem])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[BATSU-CS1 CubeSat \(Irazú Project\)], Instituto Tecnológico de Costa Rica 
  ],
  right-content: [
    Feb 2016 – June 2018
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Definition and programming of flight segment operations, environmental testing, and system integration])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Design and implementation of an Electrical Impedance Spectroscopy System for Bioengineering Applications], Instituto Tecnológico de Costa Rica 
  ],
  right-content: [
    Jan 2016 – Dec 2019
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Fabrication and testing of multiple microfluidic devices])], column-gutter: 0cm)
  ],
)



