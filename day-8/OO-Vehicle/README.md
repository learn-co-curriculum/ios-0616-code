---
  tags: oop, beginner, methods, inheritance, todo
  languages: objc
---

OO-Vehicle
======

##Objectives

1. Get more familiar with classes and objects
2. Gain a working understanding of inheritance

###Inheritance

A class can inherit properties and methods (data and behaviors) of another class. A class that inherits is called a '**subclass**' (or child class), and the class that is inherited *from* is called the '**superclass**'. Say it aloud: a subclass inherits from its superclass. 

A subclass can have its own properties and methods in addition to the inherited ones. This is basically the point of inheritance — we have a class that works, but needs to be specialized for certain tasks. So we *subclass* that object, giving it a new name and modifying/adding to it to suit our needs. 

For example, `NSMutableArray` is a subclass of `NSArray`. Arrays already worked fine, but a different, more specific version of them was needed as well (reason: mutability is useful). So, it was subclassed, and methods like `addObject` and `removeObject` were added. 


##Instructions

Let's make some classes to represent different vehicles. We'll start by making a generic `FISVehicle` class, then *subclass* it to specify different *kinds of* vehicles. This is a common practice for when you want to create a slew of objects that have many of the same properties/methods.

   **Note: use `CGFloat` for all number-based properties in this lab.**
   
  1. Start with the `FISVehicle` class. Make it a subclass of `NSObject`, and have it include what all vehicles have in common:
    - Weight
    - Top Speed
    - Current Speed
    - Current Direction (north would be 0, east = 90, south = 180, west = 270)
  2. Now give it methods that all vehicles would have:
    - `increaseSpeed` (changes the vehicle's `currentSpeed` to its top speed)
    - `brake` (changes the vehicle's `currentSpeed` to 0)
    - `turnLeft` (turns the vehicle -90 degrees, i.e. one quarter turn)
    - `turnRight` (turns the vehicle +90 degrees)
    - give it a designated initializer, `initWithWeight:topSpeed:`. Set both `currentSpeed` and `currentDirection` to 0 by default.

   **See what we're doing?** We're defining the basic functionality that *all vehicles share*. This saves us from having to re-define these properties/methods in each subclass, and gives us a great jumping off point for making more specialized vehicle objects.
  3. There are special vehicles called cars that move around in their own way (in case you haven't heard). Time to make the `FISCar` class.
    - Make your car class a subclass of `FISVehicle`. 
       - *You can choose this when making your new "Cocoa Touch Class" in XCode (see "Subclass of:" below "Class:").*
    - Now a car already has all the properties of a vehicle! It also needs:
       - `isAutomatic` - a `BOOL` property for telling whether a car is automatic (`YES`) or stick (`NO`).
       - `milesPerGallon` (*yes most vehicles technically have this IRL, but it's of particular interest for cars*)
       - `cylinders` - valid values are `4`, `6` and `8`.
    - A new car object starts with these property values:
      - `weight`: 1270
      - `topSpeed`: 88
      - `currentSpeed`: 0
      - `currentDirection`: 0 (north)
      - `cylinders`: 4
      - `isAutomatic`: `YES`
      - *hint: "starts with" is normal-speak for "is initialized with"*
      - *double hint: your superclass should have a designated initializer to help with this!*
  4. Planes add an additional element of altitude. These instructions are gonna be a little thinner than the last. Make `FISPlane`:
    - Make it a subclass of `FISVehicle`
    - Give it `topAltitude` and `currentAltitude` properties.            
    - Give it `increaseAltitude` and `decreaseAltitude` methods. 
       - Implement them like we did speed (`increase` brings current to top, `decrease` reduces current to 0).
    - A new plane object starts with these property values:
      - `currentAltitude`: 0
      - `topAltitude`: 30,000
      - `weight`: 255,000
      - `topSpeed`: 614
      - `currentSpeed`: 0
      - `currentDirection`: 0
     
  5. Here's an interesting one: `FISRaceCar`. Race cars are obviously vehicles, but they're also cars, which we already have a class for. So you may ask: *can I subclass a subclass?* The answer is: absolutely! 
    - Make `FISRaceCar` a subclass of `FISCar`.
    - Race cars need a list of `sponsors`. Make an `NSArray` property.
    - Make your race cars start with:
       - Weight: 1270
       - Top speed: 615
       - Manual transmission (*aka not automatic*) 
       - 8 cylinders
       - 3 sponsors: `@"KFC"`, `@"Taco Bell"`, and `@"Pizza Hut"`
       - *hint: you may need to create a new initializer for your car class to make this process go smoothly!*
  6. Play around with your new classes and their methods in the `didFinishLaunchingWithOptions` method of your app delegate. Treat it like an informal test of what you just created— you're looking to see that they behave the way you expect them to.

**Don't forget to run the provided tests!**
<p data-visibility='hidden'>View <a href='https://learn.co/lessons/OO-Vehicle' title='OO-Vehicle'>OO-Vehicle</a> on Learn.co and start learning to code for free.</p>
