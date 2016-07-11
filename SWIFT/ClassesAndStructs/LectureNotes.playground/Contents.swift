//: # Classes and Structures
/*:
 _Classes_ and _sturctures_ are flexible constructs that become the building blocks of your program’s code. You define properties and methods to add functionality to your classes and structures by using exactly the same syntax as for constants, variables, and functions.
 
 In Swift, you define a class or a structure in a single file, and the external interface to that class or structure is automatically made available for other code to use.
 
 * **Define properties to store values**
 ```swift
 let name: String
 var favNumber: String
 ```
 
 * **Define methods to provide functionality**
 ```swift
 func greetPerson(_ person: String) {
 print("Hello \(person)!")
 }
 ```
 
 * **Define initializers to set up their initial state**
 ```swift
 init(name: String) {
 self.name = name
 }
 ```
 
 * **Be extended to expand their functionality beyond a default implementation**
 ```swift
 extension Person {
 
 func speakItalian() {
 print("Mi Chiamo Giacamo.")
 }
 
 }
 ```
 
 * **Conform to protocols to provide standard functionality of a certain kind.**
 ```swift
 protocol Garbage {
 func takeOutTheTrash()
 }
 
 extension Person: Garbage {
 
 func takeOutTheTrash() {
 print("Taking out the trash, look at me!")
 }
 
 }
 ```
 */
//: ### Definition Syntax
class SomeClass {
    
    // class definition goes here
    
}

struct SomeStructure {
    
    // structure definition goes here
    
}

//: Whenever you define a new _class_ or _structure_, you effectively define a brand new Swift type
struct Cat {
    
    let name: String
    var age: Int
    
    func celebrateBirthday() {
        print("Cat nip, lots of it.")
    }
    
}



//: We're defining a new structure called `Cat` which has two stored properties called `name` and `age`. **Stored properties** are constants or variables that are bundled up and stored as part of the class or structure.

//: ---

class Dog {
    
    let name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func celebrateBirthday() {
        print("Fetch!")
    }
    
}


//: We're defining a new class called `Dog` which has two stored properties called `name` and `age`.

//: ---
/*:
 The `Cat` structure definition and the `Dog` class definition only describe what a `Cat` or `Dog` will look like. They themselves do not describe a specific dog or cat. To do that, you need to create an instance of the structure or class.
 */

let hanna = Cat(name: "Hanna", age: 12)
let ralph = Dog(name: "Ralph", age: 8)


hanna.name
ralph.name

hanna.age
ralph.age

hanna.celebrateBirthday()

hanna.age

ralph.celebrateBirthday()


// Assign a new value to a property here (age)
//: ---
//: ### Properties
/*:
 Properties associate values with a particular class or structure. Stored properties store constant and variable values as part of an instance, whereas computed properties calculate (rather than store) a value. Computed properties are provided by classes and stuctures as well as stored properties.
 
 Stored and computed properties are usually associated with instances of a particular type. However, properties can also be associated with the type itself. Such properties are known as type properties.”
 */
//: ### Computed Properties
/*:
 In addition to stored properties, classes, and structures can define computed properties, which do not actually store a value. Instead, they provide a getter and an optional setter to retrieve and set other properties and values indirectly.
 */
struct Unicorn {
    
    let name: String
    var canFly: Bool
    var magicPowers: [String]
    
    var description: String {
        let flyDescription = canFly ? "I can fly!" : "I walk on all fours."
        
        let magicPowersDescrip = magicPowers.reduce("") { $0 + "\n" + $1 }
        
        return "\(name) is my name. \(flyDescription). Also, I have a lot of powers: \(magicPowersDescrip)"
        
    }
    
    var simpleDescription: String {
            return "Yo, my name is \(name)"
    
    }
    
}


let powers = [
    "Turn peanut butter into jelly",
    "Sing like Michael Jackson",
    "Teleport",
    "Live on Mars"
]

let harry = Unicorn(name: "Harry", canFly: true, magicPowers: powers)



harry.description


harry.simpleDescription



// un-comment this to show the error. It's a read-only computed property

// harry.description = "Hello"

struct Point {
    
    var x = 0.0, y = 0.0
    
}
struct Size {
    
    var width = 0.0, height = 0.0
    
}


struct Rect {
    
    var origin = Point()
    
    var size = Size()
    
    var center: Point {
        
        get {
            
            print("We are looking to GET the center.")
            
            let centerX = origin.x + (size.width / 2)
            
            let centerY = origin.y + (size.height / 2)
            
            return Point(x: centerX, y: centerY)
            
        }
        
        set {
            
            print("We are looking to SET the center.")
            
            origin.x = newValue.x - (size.width / 2)
            
            origin.y = newValue.y - (size.height / 2)
            
        }
        
    }
    
}


let origin = Point(x: 0.0, y: 0.0)
let size = Size(width: 50.0, height: 50.0)

var favRect = Rect(origin: origin, size: size)

favRect.center
// prints "We are looking to GET the center."



favRect.center = Point(x: 100.0, y: 100.0)
// prints "We are looking to SET the center."



favRect.center
// prints "We are looking to GET the center."




//: ### Property Observers
/*:
 Property observers observe and respond to changes in a property’s value. Property observers are called every time a property’s value is set, even if the new value is the same as the property’s current value.
 
 You have the option to define either or both of these observers on a property:
 
 * `willSet` is called just before the value is stored.
 * `didSet` is called immediately after the new value is stored.
 */
class StepCounter {
    
    var totalSteps: Int = 0 {
        
        willSet {
            
            print("About to set totalSteps to \(newValue)")
            
        }
        
        didSet {
        
            print("Old value is \(oldValue)")
            
//            if totalSteps > oldValue  {
//                
//                print("Added \(totalSteps - oldValue) steps")
//                
//            }
            
        }
        
    }
    
}


let stepCounter = StepCounter()

stepCounter.totalSteps = 200
// About to set totalSteps to 200
// Old value is 0


stepCounter.totalSteps = 360
//About to set totalSteps to 360
//Old value is 200

stepCounter.totalSteps = 896
//About to set totalSteps to 896
//Old value is 360


//: ---

class BirthdayParty {
    
    var attendees: Int = 0
    
    var name = "Birthday Party"
    
    func welcomePerson(name: String) {
        
        print("Welcome to the party \(name).")
        
        attendees += 1
        
        //        self.attendees += 1
        
    }
    
}

// What am I missing here?
let testParty = BirthdayParty()

let jimParty = BirthdayParty()
jimParty.name = "BLah"
jimParty.attendees = 5



jimParty.welcomePerson("Brian")
// prints "Welcome to the party Brian."

jimParty.attendees













// Struct
var classCat = Cat(name: "Hanna", age: 5)

// Class
let classDog = Dog(name: "Bert", age: 3)



func celebrateBirthday(cat: Cat) {
    

    
//    cat.age += 1
    
}


func celebrateBirthday(dog: Dog) {
    
    dog.age += 1
    
}


celebrateBirthday(classCat)

celebrateBirthday(classDog)


classDog.age

















