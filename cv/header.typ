#import "@preview/cades:0.3.1": qr-code

// - - - - - - - - - - - - - - - - - - - - - - - - -

#let logo-qr-code(content, logo-path, size: 4cm, logo-width: 20%) = {
  box(width: size, height: size)[
    // 1. Генерируем сам QR-код с максимальной коррекцией ошибок
    #qr-code(content, width: size, height: size, error-correction: "H")
    
    // 2. Накладываем логотип ровно по центру
    #place(center + horizon)[
      // Белая подложка, чтобы элементы кода не просвечивали сквозь логотип
      #block(
        fill: white,
        inset: 3pt,
        radius: 3pt,
        image(logo-path, width: size * logo-width)
      )
    ]
  ]
}

// - - - - - - - - - - - - - - - - - - - - - - - - -

#let header(data) = block(
  width: 100%,
)[
  #let size = 35mm;
  #let gap = 5mm;

  #let linkedin = data.at("linkedin", default: none)

  #grid(
    columns: (size, 1fr, size - gap),
    rows: auto,
    gutter: gap,
    [#box(
      radius: 1mm,
      clip: true,
      image("photo.png", width: size)
    )],
    box(inset: (top: 1.5mm))[
      = #data.name, #text(blue, [#data.role])

      #box(inset: (top: 1mm, bottom: 0.5mm))[
        #for item in data.links {
          link(item.href)[#underline[#item.label]]
          linebreak()
        }
      ]

      #data.language

      #data.country
    ],
    [
      #if linkedin != none [
        #place(center)[
          #box(
            radius: 1mm,
            clip: true,
            logo-qr-code(
              linkedin,
              "linkedin.png",
              size: size - gap,
              logo-width: 0.2,
            )
          )
          // #image("linkedin.jpg", width: 10mm)
          #link("https://linkedin.com/in/margolin96/")[#underline[Linked in]]
        ]
      ]
    ],
  )
]