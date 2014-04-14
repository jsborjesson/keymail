# Diary

I'll write a little every week on how the project is progressing, sort
of like a sprint retrospective.

## Week 1

First I started building a simple proof of concept in a normal Rails app,
hacking together a working example was as easy as I could have hoped for.

I immediately flushed out some of the use cases I didn't think of before.

## Week 2

I made a `keymail-example` app, (a message board) to have something real to
install the gem in, at this moment completely lacking login functionality -
this will be part of the gem.

After that I started working on the README for the main project
([RDD](http://tom.preston-werner.com/2010/08/23/readme-driven-development.html)-style),
I also sketched on a couple of sequence diagrams and class diagrams.

I'm trying to use Github Issues for project management, so I've been fiddling
with labels and milestones a bit in both projects - seems to be a very pleasant
way of doing things.

I'll try to have a milestone on each Friday just to see that the project is
going in the right direction.

## Week 3

Starting to slowly TDD my way into the main use case in the gem. I'm not super comfortable
with TDD yet so progress is very slow but steady.

Since I'm in the beginning of the project I'm more worried about the structure of
migrations and have **no** client applications I need to be nice to, so I'm
keeping them in a single migration and running it with `rake db:migrate:redo`.
This keeps things tidy in the unstable startup phase, but I obviously have to
make real migrations as soon as a stable release is out.
