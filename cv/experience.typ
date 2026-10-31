#let subrow(data) = block(width: 100%)[
  #let desc = data.at("desc", default: none)
  #let stack = data.at("stack", default: none)

  #if desc == none {
    return
  }

  #if stack != none {
    grid(
      gutter: 0.6em,
      [#block(
        fill: rgb(0,0,0,20),
        inset: (y: 0.3em, x: 0.2em),
        radius: 0.2em,
      )[
        #text(
          fill: rgb(0, 0, 0, 150),
          size: 0.9em,
          weight: "bold"
        )[#stack]
      ]],
      [#eval(data.desc, mode: "markup")]
    )
  } else {
    [#eval(data.desc, mode: "markup")]
  }
]

#let row(data) = block(width: 100%)[
  #let company = data.at("company", default: none)
  #let position;
  
  #if company != none {
    position = [#text(blue)[#data.role], #company]
  } else {
    position = [#text(blue)[#data.role]]
  }

  #box()[
    #grid(
      columns: (15mm, auto),
      gutter: 3mm,
      grid.cell(rowspan: 3)[#box(
        inset: (top: 0.5mm)
      )[
        #text(size: 0.9em)[
          *#data.from*\
          *#data.to*]
        ]
      ],
      [== #text[#position]],
      [#data.list.map(subrow).join()]
    )
  ]
]