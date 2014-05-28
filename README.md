# Finding Elizabeth: Pathfinding and Alternative Realism #

## Overview ##

One of the more established trends in the video-game industry is the strive
towards *realism* in video games. This goal has benefitted immensely from
advancements in the field of computer graphics; visual design is, after all, one
of the more immediately-noticed apparent aspects of any video game, and
oftentimes weighs heavily into consumers' first impression of the game. As a
result of the current state of the field of computer graphics, modern-day
triple-A game titles are almost consistently visually stunning, with highly
detailed landscape and character models lending credibility to the in-game world
and narrative.

However, there are inherent difficulties associated with the use of computer
graphics to achieve realism in an interactive medium such as video
games. Firstly, graphical realism is handicapped by *diminishing returns*. While
the difference between a 2000-polygon character model and a 20,000-polygon model
is stark and immediately apparent, that between a 20,000- and 20,000-polygon
model is less so; and the trend propagates forward. Second is the infamous
[Uncanny Valley](http://en.wikipedia.org/wiki/Uncanny_valley) -- a problem with
serious implications regarding the extent to which computer graphics can emulate
and depict human characters.

These, among other, problems seriously impede future advances in conveying
realism in video games by graphical means; as such, game designers have begun to
find it necessary to explore alternative means of conveying realism.

### Bioshock Infinite ###

The recently-released
[Bioshock Infinite](http://en.wikipedia.org/wiki/BioShock_Infinite) is one
instance of the aforementioned trend. The designers developed a unique
pathfinding algorithm for the NPC
[Elizabeth](http://bioshock.wikia.com/wiki/Elizabeth) -- one specifically
tailored to as closely emulate human curiosity, autonomy, and exploratory
behavior as mathematically possible.

## The Algorithm ##

Elizabeth's pathfinding AI consists of several key points.

Firstly is the notion of Elizabeth being both **follower** and **leader**. The
distance between her and the player-character (PC) must be managed and balanced
so that she never appears to be explicitly in-tow to the PC. Similarly, while
Elizabeth is given "free reign" to explore the level map, her nature as a
"companion" character means that her movement must nevertheless be tied to that
of the PC.

Elizabeth's pathfinding AI essentially boils down to an augmented version of a
leader-follower model of NPC pathfinding, whereby Elizabeth can move freely
between the PC's current location and the next level-specific goal location.

Similarly, to create a sense of curiosity in her character, the designers chose
to give Elizabeth the ability to freely **interact** with various objects in the
game level (what I call, in this project, "Points of Interest",
or"POIs"). Examples of such interactions include using an item, providing
commentary, or setting a new objective for the player.
 
## The Implementation and Demo ##

For the sake of this course project and presentation, I've chosen to implement
the aforementioned algorithm in ActionScript 3 using the
[Flixel](http://flixel.org/) game-making library.

The implementation consists of the following main classes:
* **Leader**, defined in `demo/src/com/jjin/Leader.as`;
* **Follower**, defined in `demo/src/com/jjin/Follower.as`; and
* **Map**, defined in `demo/src/com/jjin/state/PlayState.as`.

### Build Instructions ###

Building the demo requires the
[Flex SDK](http://www.adobe.com/devnet/flex.html). With it installed, one can
build with:
```
mxmlc -static-link-runtime-shared-libraries src/Elizabeth.as -output ./demo.swf
```
There is also a Makefile; `make` will run the above.

Alternatively, this project and presentation is also hosted
[here](http://jinnovation.github.io/cs238-indiv/); the demo is on the last
slide.
