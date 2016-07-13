import Foundation

//: # Protocols
/*:
 A protocol defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality. The protocol can then be adopted by a class, structure, or enumeration to provide an actual implementation of those requirements. Any type that satisfies the requirements of a protocol is said to conform to that protocol.
 
 In addition to specifying requirements that conforming types must implement, you can extend a protocol to implement some of these requirements or to implement additional functionality that conforming types can take advantage of.
 */
protocol SomeProtocol {
    
    // protocol definition goes here
    
}


struct Cat: SomeProtocol {
    
    var name: String
    
}

class Dog: SomeProtocol {
    
    var name: String
    
    init(name: String) {
        
        self.name = name
        
    }
}

/*:
 * A protocol can require any conforming type to provide an instance property or type property with a particular name and type. The protocol doesn’t specify whether the property should be a stored property or a computed property—it only specifies the required property name and type. The protocol also specifies whether each property must be gettable or gettable and settable.
 
 * If a protocol requires a property to be gettable and settable, that property requirement cannot be fulfilled by a constant stored property or a read-only computed property. If the protocol only requires a property to be gettable, the requirement can be satisfied by any kind of property, and it is valid for the property to be also settable if this is useful for your own code.
 
 * Property requirements are always declared as variable properties, prefixed with the var keyword. Gettable and settable properties are indicated by writing { get set } after their type declaration, and gettable properties are indicated by writing { get }.
 */
protocol AnotherProtocol {
    
    var mustBeSettable: Int { get set }
    
    var doesNotNeedToBeSettable: Int { get }
    
}

//: ---
protocol FullyNamed {
    
    var fullName: String { get }
    
}


struct Person: FullyNamed {
    
    var fullName: String
    
}


let beth = Person(fullName: "Beth Avenue")

beth.fullName


/*:
 Each instance of Person has a single stored property called fullName, which is of type String. This matches the single requirement of the FullyNamed protocol, and means that Person has correctly conformed to the protocol. (Swift reports an error at compile-time if a protocol requirement is not fulfilled.)
 */
//: ---
//: # Unicorns
//: ![Unicorn](/Unicorn.jpg)

struct Unicorn: FullyNamed {
    
    let firstName: String
    let lastName: String
    var isMarried: Bool
    var age: Int
    
    var fullName: String {
        
        var completeName = "\(firstName) \(lastName) (\(age)) "
        
        switch isMarried {
            
        case true: completeName += "💍"
            
        case false: completeName += "💔"
            
        }
        
        return completeName
        
    }
    
}



let queen = Unicorn(firstName: "Amanda", lastName: "Flyiest", isMarried: false, age: 23)

queen.fullName

//: ---
//: ## What about adding functions to protocols?
//: ![cuteDino](/CuteDino.png)


protocol EmojiFun {
    
    func randomEmoji() -> String
    
}


struct Dinosaur: EmojiFun {
    
    let name: String
    var age: Int
    var eatsMeat: Bool
    
    func randomEmoji() -> String {
        
        let emojis = ["😎", "🤗", "🐷", "🐚", "🔥", "🍭", "🎬", "🌈", "🔴"]
        
        let randomIndex = Int(arc4random_uniform(UInt32(emojis.count)))
        
        return emojis[randomIndex]
        
    }
    
}

let littleFoot = Dinosaur(name: "Little Foot", age: 12, eatsMeat: false)

littleFoot.randomEmoji()

littleFoot.randomEmoji()

littleFoot.randomEmoji()

//: ---
//: ## Protocols as Types
/*:
 Protocols do not actually implement any functionality themselves. Nonetheless, any protocol you create will become a fully-fledged type for use in your code.
 
 Because it is a type, you can use a protocol in many places where other types are allowed, including:
 
 * As a parameter type or return type in a function, method, or initializer
 * As the type of a constant, variable, or property
 * As the type of items in an array, dictionary, or other container
  */
struct Printer {
    
    var blackInk: Double
    
    var colorInk: Double
    
    var emojiProducer: EmojiFun
    
}

let officeJet = Printer(blackInk: 20.0, colorInk: 19.2, emojiProducer: littleFoot)


officeJet.emojiProducer.randomEmoji()

//: ---
//: ## Delegation
/*: 
 “Delegation is a design pattern that enables a class or structure to hand off (or delegate) some of its responsibilities to an instance of another type. This design pattern is implemented by defining a protocol that encapsulates the delegated responsibilities, such that a conforming type (known as a delegate) is guaranteed to provide the functionality that has been delegated. Delegation can be used to respond to a particular action, or to retrieve data from an external source without needing to know the underlying type of that source.
   */
protocol ParentDuties {
    
    func babyDidCry(baby: Baby)
    
    func babyHasToPeeOrPoo(baby: Baby)
    
    func babyNeedsToSleep(baby: Baby)
    
}


struct Baby {
    
    let name: String
    
    var parent: ParentDuties?
    
    var isHungry: Bool {
        
        didSet {
            
            parent?.babyDidCry(self)
            
        }
        
    }
    
    var hasToGoPotty: Bool {
        
        didSet {
            
            parent?.babyHasToPeeOrPoo(self)
            
        }
        
    }
    
    var isTired: Bool {
        
        didSet {
            
            parent?.babyNeedsToSleep(self)
        }
    }
    
    
    
}


struct Mom: ParentDuties {
    
    let name: String
    
    func babyDidCry(baby: Baby) {
        
        if baby.isHungry { print("My poor \(baby.name), here's some food.") }
        
        print("I will sing you a lullaby.")
        
    }
    
    func babyHasToPeeOrPoo(baby: Baby) {
        
        if baby.hasToGoPotty {
            
            print("You poor thing! After you go #1 or #2, we will get you into your PJ's.")
            
        } else {
            
            print("Thanks for letting me know!")
        }
        
    }
    
    func babyNeedsToSleep(baby: Baby) {
        
        if baby.isTired {
            
            print("Go to sleep my little baby... 😴")
            
        } else {
            
            print("Party time! 🎉")
            
        }
        
    }
    
}


struct Aunt: ParentDuties {
    
    let name: String
    
    func babyDidCry(baby: Baby) {
        
        print("Oh quit crying \(baby.name)!")
        
    }
    
    func babyHasToPeeOrPoo(baby: Baby) {
        
        if baby.hasToGoPotty {
            
            print("Again?!")
            
        } else {
            
            print("Why do you keep letting me know this!")
        }
    }
    
    func babyNeedsToSleep(baby: Baby) {
        
        if baby.isTired {
            
            print("It's about time! 💤")

        } else {
            
            print("Ugh... lets go for a walk.")
            
        }
        
        
    }
    
}



var babyJimmy = Baby(name: "Jimmy", parent: nil, isHungry: false, hasToGoPotty: false, isTired: false)

let momma = Mom(name: "Maryann")

let auntPat = Aunt(name: "Patty")



babyJimmy.parent = momma

babyJimmy.isTired = true
// prints "Go to sleep my little baby... 😴"

babyJimmy.isTired = false
// prints "Party time! 🎉"

babyJimmy.isHungry = true
// My poor Jimmy, here's some food.
// I will sing you a lullaby.

babyJimmy.hasToGoPotty = true
// prints "You poor thing! After you go #1 or #2, we will get you into your PJ's."



babyJimmy.parent = auntPat

babyJimmy.isTired = true
// prints "It's about time! 💤"

babyJimmy.isTired = false
// prints "Ugh... lets go for a walk."

babyJimmy.isHungry = true
// prints "Oh quit crying Jimmy!"

babyJimmy.hasToGoPotty = true
// prints "Again?!"















