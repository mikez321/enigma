# Final Project: Enigma #

### Self Assessment of Enigma project: Self-score 3.2 ###

**Functionality:  3 Meets Expectations**

_Enigma Class with encrypt and decrypt methods successfully implemented. Encrypt/decrypt command line interfaces successfully implemented_

All three pieces of functionality work according to their specs in the requirements.  Cracking was not attempted in lieu of creating a validation class which ended up taking hours to integrate into the program.


**Object Oriented Programming: 3.5 Exceeds(ish) Expectations**

_Students have implemented either inheritance or at least one module in a logical manner. Students can speak as to how/why inheritance and modules made sense for the given implementations, why they improve the organization of the code, and the distinction between the two._

When approaching the project, I thought of a machine and how it would be organized and what pieces it would need.  This program uses a class to create the shifts called Shifter.  It's scalable and will output a hash with each shift's "names" and their values.

That shift is passed into a class called Compiler.  The complier's job is to take the given shift and translate it across the alphabet to scramble the message.  It is also the compiler's job to break down the message and put it back together.

The Validator class makes sure the shifter and compiler get information they can use.  Its job is to allow accepted keys and dates, or create useable ones if the provided ones are either missing or incorrectly formatted.

The sole responsibility of the Enigma class is to use information passed in to output an encrypted or decrypted message.  While it does have some duplicate code it is fully functional.

Not only do I feel all of my classes make sense, but I also used a module called "referenceable" which has an alphabet as well as an array of numbers.  It is used in compiler, shifter, and validator classes which all use it to reference something for accuracy or create a shift or return a letter or index.

Had I to cut down on redundant code in enigma and other classes I think it would be better.  I also don't love that there are a few instance variables I feel are unnecessary and a lot of uses of `nil` as default values.  For these reasons I don't feel like this is a 4.

**Ruby Conventions and Mechanics: 3 Meets Expectations**

_Code is mostly properly indented, spaced, and lines are not excessively long. Class, method, variable, and file names follow convention. Some enumerables/data structures chosen are the most efficient tool for a given job, and students can speak as to why those enumerables/data structures were chosen. At least one hash is implemented in a way that makes logical sense._

Spacing, line lengths, indentations are in check.  Every time I thought "I don't love it" I made efforts to improve readability and style of the code.  I feel like most all of the methods are well thought out and used appropriately.  Even `each_with_index` was refactored to a `each_with_index.map` to push a little further into the world of learning.  New methods `slice_each()` and `zip` were both used in the project.  I struggled with names for variables quite a bit.  Things are better than they were, but still need improvement.

**Test Driven Development: 3 Meets Expectations**

_Every method is tested at both the unit and integration level, and completely verify expected behavior (i.e., if a single method does 3 things, all 3 things are explicitly tested). Obvious edge cases are addressed. git history demonstrates students are writing tests before implementation code. Test coverage metrics show coverage at 99% or greater._

Simplecov at 100%.  Rake passes all tests.  An entire class is dedicated to edge cases.  Stubs are used.  Because of the quality of my testing, when I decided to pull all validation and initialize out of Enigma (it had defaults so all interactions worked properly) I was able to step-by-step piece my whole program back together.  It's a lesson I learned in Futbol to have good  testing so you can change things and know _what_ broke, unlike battleship where we relied heavily on playing the game because testing wasn't as good.

If it were being graded by someone else it looks like a solid 4, but at times there was definitely some "cowboy codin'" going on, lots of PRY to figure out where issues were and then figuring out where to test based on that.  I'd say 90% or more tests were pre-written, but I'd be happy with a solid 3 here and reinforcing the importance of testing for further refactoring/improving the program.

**Version Control 3.5 Exceed(ish) Expectations**

_At least 30 commits. Most pull requests include related and logical chunks of functionality, and are named and documented to clearly communicate the purpose of the pull request. No more than 3 commits include multiple pieces of functionality._

Over 160 commits and 7 merged branches.  All PRs include some kind of inline comments and/or summary messages.  When reviewing changes have been requested and followed up with.  All PR messages have descriptions of what has been done.  Keeping it out of 4 range is naming of branches doesn't always match what was going on.  "Polish" started as a branch for refactoring and cleaning up code.  It ended up being a complete overhaul of Enigma, Creation of Validation (and tests for both) as well as lots of tweaks here and there.  Work often leads to other work which lead to commits including more than one piece of functionality.  It is fantastic to see so many commits and I'm not afraid of saving my work, but a more methodical approach would land me a 4.
