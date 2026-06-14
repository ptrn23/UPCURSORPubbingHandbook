// ==========================================
// THEME VARIABLES
// ==========================================

// Fonts & Sizes
#let font-heading = "Inter"
#let font-body = "Linux Libertine"
#let size-body = 12pt
#let size-h1 = 2em
#let size-h2 = 1.3em
#let size-h3 = 1.15em
#let size-small = 8pt

// Text Colors
#let color-text = rgb("#161616")
#let color-muted = rgb("#52525B")
#let color-footer = rgb("#3F3F46")

// Heading Colors
#let color-h1 = rgb("#10743C")
#let color-h2 = rgb("#273444")
#let color-h3 = rgb("#E05A47")

// Callout Box Colors
#let color-chap-bg = color-h1
#let color-chap-img-bg = rgb("#3C4858")
#let color-research-border = color-h1
#let color-research-bg = rgb("#F2F9F4")

#let color-author-border = rgb("#2E86AB")
#let color-author-bg = rgb("#F4FAFD")

#let color-member-bg = rgb("#F8F9FA")
#let color-member-border = rgb("#E5E7EB")
#let color-member-accent = rgb("#F2A900")

#let color-caption-heading = color-h1
#let color-caption-text = color-muted


// ==========================================
// MAIN TEMPLATE FUNCTION
// ==========================================

#let project(title: "", body) = {
  set heading(numbering: "1.1")

  set page(
    paper: "a4",
    margin: (left: 1in, right: 1in, top: 1in, bottom: 1in),
    
    header: context {
      let page-num = counter(page).get().first()
      let is-odd = calc.odd(page-num)
      
      align(if is-odd { right } else { left })[
        #text(font: font-heading, size: size-small, fill: color-muted, tracking: 1pt)[PROPERTY OF UP CURSOR]
      ]
    },
    
    footer: context {
      let headings = query(selector(heading.where(level: 1)).before(here()))
      let page-num-val = counter(page).get().first()
      let page-num-str = str(page-num-val)
      let is-odd = calc.odd(page-num-val)
      
      if headings.len() > 0 {
        let current-heading = headings.last()
        let chap-num = counter(heading).at(current-heading.location()).first()
        let chap-title = upper(current-heading.body)
        
        set text(size-small, font: font-heading, fill: color-footer)
        
        if is-odd {
          align(right)[
            #text(weight: "extrabold")[CHAPTER #chap-num] 
            #h(1em) 
            #text()[#chap-title] 
            #h(2em) 
            #text(weight: "extrabold")[#page-num-str]
          ]
        } else {
          align(left)[
            #text(weight: "extrabold")[#page-num-str]
            #h(2em)
            #text()[PUBBING HANDBOOK 101]    
          ]
        }
      } else {
        align(if is-odd { right } else { left })[
          #set text(10pt, font: font-heading, fill: black, weight: "bold")
          #page-num-str
        ]
      }
    },
    numbering: "1",
  )
  
  set text(font: font-body, size: size-body, fill: color-text)
  
  show heading: it => {
    set text(font: font-heading, weight: "bold")
    set block(above: 1.5em, below: 1em)
    set par(leading: 0.3em)
    
    if it.level == 2 {
      let num = counter(heading).display()
      v(1.5em)
      text(size: size-small, fill: color-h1, weight: "bold", tracking: 2pt)[
        SECTION #num
      ]
      linebreak()
      v(-0.75em)
      
      text(size: size-h2, fill: color-h2, weight: "bold", tracking: 1pt)[
        #upper(it.body)
      ]
      
    } else if it.level == 3 {
      text(size: size-h3, fill: color-h3)[#it.body]
    } else {
      it
    }
  }

  show figure.caption: it => {}

  show ref: it => {
    set text(font: font-heading, size: 9pt, weight: "bold", fill: color-caption-heading)
    it
  }
  
  body
}

// ==========================================
// CUSTOM COMPONENTS
// ==========================================

#let chapter-cover(title: "", title-height: 2in, img: none) = {
  pagebreak(weak: true)
  
  place(hide(heading(level: 1)[#title]))

  context {
    let chap-num = counter(heading).display()
    
    pad(
      top: -1in,
      left: -1in,
      right: -1in,
      bottom: 0.5in,
      
      block(width: 100%)[
        #block(width: 100%, height: 3in, fill: color-chap-img-bg)[
          #if img != none {
            set image(width: 100%, height: 100%, fit: "cover")
            img
          }
        ]
        #v(-0.2in)
        #block(
          width: 100%,
          height: title-height,
          fill: color-chap-bg, 
          inset: (top: 0.5in, bottom: 0in, left: 1in, right: 1in) 
        )[
          #place(
            top + left,
            dy: -0.75in,
            block(
              fill: white,
              stroke: (bottom: 3pt + color-text, rest: 1pt + color-text),
              inset: (x: 1.5em, y: 0.8em),
              [
                #text(font: font-heading, weight: "bold", size: 1.1em, tracking: 2pt)[
                  CHAPTER #chap-num
                ]
              ]
            )
          )
          
          #text(font: font-heading, weight: "bold", size: 3em, fill: white)[
            #set par(leading: 0.3em)
            #upper(title)
          ]
        ]
      ]
    )
  }
}

#let flex-figure(img, caption: none, cols: (2fr, 1fr), side: true) = {
  
  let caption-block-bottom = context {
    set par(leading: 0.4em)
    let num = counter(figure).display()
    [
      #text(font: font-heading, weight: "bold", fill: color-caption-heading, size: size-small)[
        FIGURE #num
      ]
      #text(font: font-heading, fill: color-text, size: size-small)[
         #caption
      ]
    ]
  }

  let caption-block-side = context {
    set par(leading: 0.4em)
    let num = counter(figure).display()
    align(left)[
      #text(font: font-heading, weight: "bold", fill: color-caption-heading, size: size-small)[
        FIGURE #num
      ] \
      #text(font: font-heading, fill: color-text, size: size-small)[
        #caption
      ]
    ]
  }
  
  let fig-body = if side and caption != none {
    table(
      columns: cols,
      align: (center, top),
      stroke: none,
      block(width: 100%)[#set image(width: 100%); #img],
      caption-block-side
    )
  } else {
    block(width: 100%)[
      #set image(width: 100%); #img
      #if caption != none [
        #align(center)[#caption-block-bottom]
      ]
    ]
  }
  
  figure(
    caption: caption,
    supplement: "FIGURE",
    fig-body
  )
}

#let research-box(title: "RESEARCH NOTE", source: none, body) = {
  block(
    width: 100%,
    stroke: (bottom: 4pt + color-research-border, rest: 1pt + color-research-border),
    fill: color-research-bg, 
    inset: 1.5em,
    radius: 0pt,
    [
      #text(font: font-heading, fill: color-research-border, weight: "bold", size: 1.1em)[#title]
      #v(-0.5em)
      #text(size: 11pt, font: font-body, fill: color-text)[#body]
      
      #if source != none [
        #align(right)[
          #text(size: 9pt, font: font-heading, fill: color-research-border)[
            #source
          ]
        ]
      ]
    ]
  )
}

#let authors-note(body) = {
  block(
    width: 100%,
    stroke: (left: 3pt + color-author-border),
    fill: color-author-bg,
    inset: 1em,
    radius: 0pt,
    [
      #text(font: font-heading, fill: color-author-border, weight: "bold", size: 10pt)[AUTHOR'S NOTE]
      #text(size: 11pt, font: font-body, style: "italic", fill: color-text)[#body]
    ]
  )
}

#let member-quote(name: "Member Name", contact: "", role: "Pubbing Team", body) = {
  block(
    width: 100%,
    stroke: 1pt + color-member-border,
    fill: color-member-bg,
    inset: 1em,
    radius: 6pt,
    [
      #text(font: font-heading, size: 3em, fill: color-member-accent, weight: "bold", baseline: -0.1em)[\u{201C}]
      #v(-4em)
      
      #text(size: size-body, font: font-body, style: "italic", fill: color-text)[#body]
      
      #v(-0.5em)
      #align(right)[
        #set text(font: font-heading)
        #if contact != "" [
          #link(contact)[#text(size: size-small, weight: "bold", fill: color-h1)[#name]]
        ] else [
          #text(size: size-small, weight: "bold", fill: color-h1)[#name]
        ]
        #h(0.25em)
        #text(size: size-small, fill: color-muted)[#role]
      ]
    ]
  )
}