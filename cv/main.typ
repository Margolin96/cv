/* TODO
 * 
 * Add Quantori part (mol*, ...)
 * Add charit part (stripe, svelte, redis, postgres, graphile)
 * Add karta part
 * Add previous parts (certificates, ase, ...)
 */

// - - - - - - - - - - - - - - - - - - - - - - - - -

#import "header.typ": header
#import "experience.typ": row

#let data = json("data.json")

// - - - - - - - - - - - - - - - - - - - - - - - - -
// Page common styles

#set text(font: "DM Sans", size: 10.5pt)
#set text(lang: "en")
#set page("a4")
#set page(margin: (
  y: 0.8cm,
  x: 0.8cm,
  bottom: 1.5cm
))
#set page(numbering: "1 of 1")

#set page(footer: context {
  let is-even = calc.even(here().page())
  set align(if is-even { left } else { right })
  counter(page).display(page.numbering, both: true)
})

// - - - - - - - - - - - - - - - - - - - - - - - - -
// Page rendering

#header(data)

#block(
  width: 100%,
  fill: rgb(0,0,0,20),
  inset: 0.5em,
  radius: 0.25em,
)[
  #text(
    fill: rgb(0, 0, 0, 150),
    size: 1em,
    weight: "bold"
  )[#data.stack]
]

#grid(
  columns: 1,
  rows: auto,
  gutter: 1em,
  ..data.experience.map(row),
)