//: # Extensions
/*:
 Extensions add new functionality to an existing class, structure, enumeration, or protocol type. This includes the ability to extend types for which you do not have access to the original source code (known as retroactive modeling). Extensions are similar to categories in Objective-C. (Unlike Objective-C categories, Swift extensions do not have names.)
 
 Extensions in Swift can:
 
 * Add computed instance properties and computed type properties
 * Define instance methods and type methods
 * Provide new initializers
 * Define subscripts
 * Define and use new nested types
 * Make an existing type conform to a protocol
 
 ### What's missing?  
 We can't add stored properties in an extension.
 */
struct Person {
    
    let name: String
    
    var numberOfFriends: Int
    
}

extension Person {
    
    var description: String {
        
        return "\(name) is my name. I have \(numberOfFriends) friends."
        
    }
    
}


let jim = Person(name: "Jim", numberOfFriends: 99)

jim.description
//: ---
extension Person {
    
    func putARingOnIt() -> String {
        
        return name + "💍"
        
    }
    
}

jim.putARingOnIt()
//: ## That was extending a custom type we made called Person. What about the built in types?
extension String {
    
    func isLongerThanWord(word: String) -> Bool {
        
        return self.characters.count > word.characters.count
        
    }
    
}

let name = "Rebecca"
let otherName = "Jess"

name.isLongerThanWord(otherName)

//: ---

extension String {
    
    func poo() -> String {
        
        return "💩"
        
    }
    
}


name.poo()

otherName.poo()

//: ---

extension Double {
    
    var km: Double { return self * 1_000.0 }
    
    var m: Double { return self }
    
    var cm: Double { return self / 100.0 }
    
    var mm: Double { return self / 1_000.0 }
    
    var ft: Double { return self / 3.28084 }
    
}

let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")


let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")
//: ---
extension String {
    
    var isTheCoolest: Bool {
        
        switch self {
            
        case "Jim", "Jimmy", "Jimbo", "James": return true
            
        default: return false
            
        }
        
    }
    
}


let dude = "Jimmy"

let anotherDude = "Joel"

dude.isTheCoolest


anotherDude.isTheCoolest



