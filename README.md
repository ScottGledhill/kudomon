# kudomon

<!-- #Dir["./lib/*.rb"].each { |file| load file } -->

Imagine that all around us, in a virtual world, are virtual creatures (Kudomon) that you can catch and collect.

A Trainer (like you) can log onto their computer and be unaware that these Kudomon are all around them in geo-virtual space. Your task is to design and build an application through which one can interact with these Kudomon.

Part 1

Define classes to model this application.

There are many different species of Kudomon, each having a type. Examples:

species: Sourbulb, type: grass
species: Mancharred, type: fire
species: Chikapu, type: electric
Other types include water, rock and psychic. Feel free to invent your own species using these six types!

Both Trainers and Kudomon need to have a Position, so we can know which Kudomon are nearby.

Part 2

Gotta catch ‘em all!

In this part we’ll implement the means for a Trainer to catch a Kudomon and add it to their collection.

First, we need to know which Kudomon are nearby to a Trainer. Write code to calculate this. How you define “nearby” is completely up to you.

A Trainer can catch nearby Kudomon and add them to his/her collection. Write code to allow this.

Part 3

Multi-player

Now we’re going to introduce the idea that multiple people can try and catch Kudomon at the same time.

Scenario: I’m sat at my computer and I see a Kudomon I want to catch. I try to catch it. At the exact same time, my neighbour Freddy sees the same Kudomon and also tries to catch it. Freddy succeeds and adds the Kudomon to his collection before I’ve finished catching it. I now feel sad.

How can we avoid this situation?

Now imagine instead of just two people, it’s now 1000 people cramming into Central Park to catch the same Kudomon - would the same solution work then?

If applicable, amend your code to allow for these situations.

Part 4

Be the very best!

For some reason, Kudomon allow their Trainers to make them battle each other until one of them is knocked out. Add the concept of a Battle between two Kudomon to your code. Amend your code to take into account that Kudomon have health points and combat points.

Write code for a fight with the following mechanics:

A randomly chosen Kudomon goes first.
Until one of the Kudomon is knocked out (i.e. when health points <= 0), both battling Kudomon take it in turns to inflict damage on the other. The amount of damage is equivalent to their combat points.
The battle should return the winner.
To make it more interesting, certain types Kudomon fight far more effectively against other types. For example, a fire Kudomon will trounce a grass type, but a water type will extinguish a fire type.

Water > Fire > Grass > Rock > Electric > Water (Psychic is good against everything except other psychics.)

Amend your code to take this dynamic into account.
