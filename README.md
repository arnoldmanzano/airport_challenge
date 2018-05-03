Airport Challenge Author README
=================
Author: arnoldmanzano / arnold.manzano@gmail.com

![Travis CI status](https://travis-ci.org/arnoldmanzano/airport_challenge.svg?branch=master)

##### Installation and Usage Instructions #####
```sh
$ git clone <repo_address>
$ irb
2.2.3 :001 > require './lib/airport'
 => true
2.2.3 :002 > airport = Airport.new
 => #<Airport:0x007f9e81011180 @planes=[], @weather=#<Weather:0x007f9e81011158>, @capacity=10>
2.2.3 :003 > plane1 = Plane.new
 => #<Plane:0x007f9e812150f8 @landed=false>
2.2.3 :004 > plane2 = Plane.new
 => #<Plane:0x007f9e8120d3a8 @landed=false>
2.2.3 :005 > airport.land(plane1)
 => [#<Plane:0x007f9e812150f8 @landed=true>]
2.2.3 :006 > airport.planes
 => [#<Plane:0x007f9e812150f8 @landed=true>]
2.2.3 :007 > airport.land(plane2)
RuntimeError: Cannot land on a storm! Try again!
2.2.3 :008 > airport.take_off(plane1)
 => #<Plane:0x007f9e812150f8 @landed=false>
2.2.3 :009 > airport.planes
 => []
```

##### Design Approach #####

To model the user stories in OOP, the main nouns are implemented as classes and the verb interactions between them are the methods. Classes and methods are written using test-first TDD approach.

Airport is a class, and Plane is a class.
Interaction between Airport and Plane are the methods on airport, that takes plane as argument.
airport.land(plane)
airport.take_off(plane)
Airport maintains an array variable @planes to push/pop individual planes as they land/take_off.
Airport capacity is an attribute  that is set upon initialize of new airport.
Airport weather is an attribute (uses another class, more below) and is queried on implementing airport methods.

Plane contains method to set its own attribute as currently landed or not.

To maintain SRP, Weather is implemented as another class, and Airport interacts with it by querying the state of weather.
Weather randomness is implemented by using #sample method of array.
Weather testing uses srand to get fixed seed from .sample method.


Airport Challenge
=================

Instructions
---------

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Steps
-------

1. Fill out your learning plan self review for the week: https://github.com/makersacademy/learning_plan (edit week 1 - you can edit directly on your Github fork)
2. Fork this repo, and clone to your local machine
3. Run the command `gem install bundle` (if you don't have bundle already)
4. When the installation completes, run `bundle`
3. Complete the following task:

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.

Your code should defend against [edge cases](http://programmers.stackexchange.com/questions/125587/what-are-the-difference-between-an-edge-case-a-corner-case-a-base-case-and-a-b) such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot takes off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

For overriding random weather behaviour, please read the documentation to learn how to use test doubles: https://www.relishapp.com/rspec/rspec-mocks/docs . There’s an example of using a test double to test a die that’s relevant to testing random weather in the test.

Please create separate files for every class, module and test suite.

In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

**BONUS**

* Write an RSpec **feature** test that lands and takes off a number of planes

Note that is a practice 'tech test' of the kinds that employers use to screen developer applicants.  More detailed submission requirements/guidelines are in [CONTRIBUTING.md](CONTRIBUTING.md)

Finally, don’t overcomplicate things. This task isn’t as hard as it may seem at first.

* **Submit a pull request early.**  There are various checks that happen automatically when you send a pull request.  **Fix these issues if you can**.  Green is good.

* Finally, please submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am.
