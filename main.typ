#import "template.typ": *

#show: project.with(title: "The Pubbing Manifesto")

// ==========================================
// CHAPTER 1: THE PSYCHOLOGY OF PUBBING
// ==========================================
#chapter-cover(
  title: "The Psychology of Pubbing",
  title-height: 1.9in,
  img: image("figures/chapter1-bg.jpg")
)

The first step in any design thinking process is to empathize... to imagine ourselves standing in the users' shoes, looking through their eyes, and feeling what they feel. When we create publicity materials ("pubs"), we aren't just making things look pretty.

To accomplish this, we need to understand the information we are placing on our audience. We can conduct lots of types of research, but one of the most common types is to observe how users interact.

== Analyze the Viewing Habits
Once you've posted a pub, the analytics provide a data set. Platforms like Facebook and Instagram provide insights that you can use to form opinions about your target audience's viewing habits.

#authors-note[
  I always tell new members to look at the "drop-off" rate on carousel posts. If people are swiping past the first image but not making it to the third, it usually means our initial visual hook wasn't strong enough.
]

=== Survey Question Types
If you are doing active research on your org's branding, you can survey your audience. Broadly speaking, a survey can have two types of questions: closed-response and open-response.

#research-box(title: "F-PATTERN AND Z-PATTERN READING BEHAVIOR", source: [@norman2013])[
  In digital products, there are common layouts that help users read text on a page. Two of the most popular are the F-pattern and Z-pattern.
  
  An F-pattern causes users to scan for information on the page in the shape of a letter F, reading the top first, then a little bit of the next section, then finally looking down the left side. Always place your most critical event details along these sightlines.
]

#flex-figure(
  image("figures/eye-tracking.jpg"), 
  caption: [Eye-tracking heatmaps demonstrating the F-Pattern. Notice how the bottom right corner is almost completely ignored. Keep vital info out of dead zones.],
  side: false
)

#pagebreak()

// ==========================================
// CHAPTER 2: THE ARCHITECTURE OF TYPOGRAPHY
// ==========================================
#chapter-cover(
  title: "The Architecture of Typography",
  title-height: 2in,
  img: image("figures/typography.jpg")
)

Typography is the absolute backbone of visual communication. Before we even look at color or grids, we have to understand how the words themselves shape the reader's experience. Good typography is meant to go unnoticed; bad typography distracts from the message.

== The Hierarchy of Three
This is where beginners usually struggle. Use a "Hierarchy of Three" rule to keep it digestible. Your eye should naturally know exactly what to read first, second, and third.

#authors-note[
  When I first started pubbing, I used to make everything bold because I thought everything was important. It took me a long time to realize that if everything is bold, nothing is bold.
]

#member-quote(
  name: "Jane Doe", 
  contact: "mailto:jane.doe@example.com", 
  role: "Lead Typographer, '25"
)[
  Always zoom out to 10% before you export. If you can't tell what the pub is about from that far away, your visual hierarchy is broken! Contrast is your best friend.
]

#flex-figure(
  image("figures/type-scale.jpg"), 
  caption: [A standard 3-level typographic scale. The Title grabs attention, the Subtitle provides context, and the Body delivers the details.],
  cols: (2fr, 1fr)
) 

As Ellen Lupton argues in her foundational text, typography is what allows language to be seen as well as heard @lupton2010. 

== Whitespace as a Design Element
Whitespace (or negative space) is not empty space; it is the active breathing room that gives your typography structure. 

#flex-figure(
  image("figures/whitespace-demo.png"), 
  caption: [By increasing the margins around the text block, the content immediately feels more premium and easier to read.],
  cols: (3fr, 1fr)
) <whitespace-fig>

As demonstrated in @whitespace-fig, giving your elements room to breathe completely changes the tone of the publication. Cramming text edge-to-edge makes the pub feel chaotic and cheap.

#pagebreak()

// ==========================================
// CHAPTER 3: COMPOSITION & UX LAWS
// ==========================================
#chapter-cover(
  title: "Composition & UX Laws",
  title-height: 1.9in,
  img: image("figures/composition.jpg")
)

To make our pubs effective, we need to understand how the human brain processes visual information. We rely on established psychological principles to guide our layout decisions.

#research-box(
  title: "HICK'S LAW", 
  source: [@hick1952]
)[
  The time it takes to make a decision increases with the number and complexity of choices. When designing a pub, giving the viewer too many things to look at or click on will cause "analysis paralysis." Keep the Call to Action (CTA) singular and obvious.
]

== Visual Grouping
The brain naturally groups items that look similar or are placed near each other. This is the foundation of Gestalt psychology, which dictates that the whole is other than the sum of its parts @koffka1935.

#authors-note[
  If your date, time, and venue are scattered across four different corners of the poster, you are making the reader work too hard. Group them together in a single "Event Details" block.
]

#flex-figure(
  image("figures/gestalt-grouping.jpg"), 
  caption: [An example of the Law of Proximity. Elements placed close together are perceived as a related group.],
  cols: (1fr, 1fr) // Equal split layout
) <gestalt-fig>

When you look at @gestalt-fig, you instantly understand the relationship between the shapes without needing a textual explanation. This is the power of strong composition.

#member-quote(
  name: "Alex Rivera", 
  role: "Creative Director, '24"
)[
  You have exactly 3 seconds to convince someone scrolling on their phone to stop and read your pub. If your composition doesn't immediately tell them *why* they should care, they will scroll past.
]

#pagebreak()

// ==========================================
// BIBLIOGRAPHY SECTION
// ==========================================

#heading(numbering: none)[References]

#bibliography("refs.bib", title: none, style: "apa")