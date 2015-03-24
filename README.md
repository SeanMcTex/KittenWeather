# KittenWeather
Demo Project for CocoaConf 2015 Presentation: "The Best Automated Tests You Don’t Have to Write"

# The Best Automated Tests You Don't Have to Write
- Premise for talk
  - Tests == Good
  - Writing Tests == PITA
  - How to use some tools to maximize benefit:effort ratio
- Introduce KittenWeather: "Because Kittens Make Everything Better"
  - Show app
  - Demonstrate features


## UIAutoMonkey
- https://github.com/jonathanpenn/ui-auto-monkey
- written by Jonathan Penn, inspired by Netflix' [Chaos Monkey](https://github.com/Netflix/SimianArmy/wiki/Chaos-Monkey)
  - Chaos Monkey is a project from Netflix that randomly kills off systems in a cloud cluster
  - Only does it during business hours so folks are available to respond to and learn from the failures
  - Has helped make Netflix' infrastructure much more resiliant than it otherwise would have been
- double-tap "About" button 
- because of randomness, tests aren't repeatable. Don't necessarily make this part of your unit test suite, but bring it to bear often.

## Making Sure Your UI Works
* Lots based on https://github.com/facebook/ios-snapshot-test-case
* https://github.com/ashfurrow/Nimble-Snapshots
* http://www.objc.io/issue-15/snapshot-testing.html
* https://github.com/orta/snapshots


## QuickCheck and Friends
- About
	* QuickCheck originated in Haskell and has been ported to lots of other languages
	* https://maniacdev.com/2014/12/a-library-for-automatic-testing-of-objective-c-and-swift-programs-based-on-haskells-quickcheck
	* http://fox-testing.readthedocs.org/en/latest/tutorial.html (obc-c & swift, looks pretty mature)
- Using
	* Test temperature class to be sure K is never < 0
	
