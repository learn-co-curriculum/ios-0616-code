//: # Optionals
/*:
 
 You use optionals in situations where a value may be absent. An optional represents two possiblities. Either there **is** a value, and you can unwrap the optional to access that value, or there **isn't** a value at all.
 */
let otherNumber = Int("bloop")





// Swifts Int type has an initalizer that can convert a String value into an Int value.




// Show them both, one is a '245', the other is 'Pokemon'











//: An optional Int is written as `Int?`, **not** `Int`. The question mark indicates that the value it contains is optional, meaning that it might contain __some__ `Int` value, or it might contain no value at all.
// create a variable named surveyAnswer of type String?, assign it the value "Salad"
// print this variable, what do you expect to see?

var surveyAnswer: String? = "Salad"





if surveyAnswer != nil {
    
//    print(surveyAnswer!)
    
    
}




//: How do we get that underlying value from the Optional?
// show if statements and forced unwrapping
// comparing the value against nil

let possibleNumber = Int("123")


if var actualNumber = possibleNumber {
    
    print(actualNumber)
    
    
}










//: ## Optional Binding
/*:
 You use _optional binding_ to find out whether an optional contains a value, and if so, to make that value available as a temporary constant or variable. Optional binding can be used with `if` and `while` statement to check for a value inside an optional, and to extract that value into a constant or variable, as part of a single action.
 */
// if let on creating an Int with a String


// if var on creating an Int with a String










//: ## Implicitly Unwrapped Optionals
/*:
 Sometimes it is clear from a program's structure that an optional will _always_ have a value, after that value is first set. These kinds of optionals are defined as _implicityly unwrapped optionals_. You write an implicitly unwrapped optional by placing an exlamation mark (`String!`) rather than a question mark (`String?`) after the type that you want to make optional.
 */
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // requires an exclamation mark

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // no need for an exclamation mark”









//: ## Dictionaries & Optionals
let planets = ["Earth": 1, "Jupiter": 55, "Moon:": 221]


if let numberOfMoonsOnEarth = planets["alksjdflksdajflsdkjf"] {
    
    print("There are \(numberOfMoonsOnEarth) number of moons on Earth")
    
} else {
    
    print("YO!!")

}

















//: ## Optional Chaining













//: ## nil-Coalescing Operator
let name: String? = nil

let nameToDisplay = name ?? "No Name"











let stringteger = "1"
let i = Int(stringteger) ?? 0













func dancesWithWolves(wolves: [String: Int]) -> Int? {

    guard var ghostLives = wolves["Ghost"] else { return nil }
    
    return ghostLives + 1
    
}





var wolfPack = ["Ghost": 5, "Nymeria": 2, "Lady": 9]

class Person {
    
    
    var name: String
    var lastName: String
    
    init(name: String, lastName: String) {
        
        self.name = name
        self.lastName = lastName
    
    }
    
    
    init?(fullName: String) {
        
        if fullName.hasSuffix("Jim") { return nil }
        
    
        
    }
    
    
    
    
}


for (key, value) in wolfPack {
    
    wolfPack[key] = value + 1
}

print(wolfPack)



//wolfPack["Ghost"] = dancesWithWolves(wolfPack)



let isHungry = true


let foodToEat = isHungry ? "Steak" : "No food"




print(wolfPack)



























let errorCode = (errorNumber: 404, errorMesage: "No image at location", 5, 2, 1, "lkajslfkjs")


print(errorCode.errorMesage)


func fizzBuzz(number: Int) -> String {
    
    switch (number % 3 == 0, number % 5 == 0) {
    case (true, true): return "FizzBuzz"
    case (true, false): return "Fizz"
    case (false, true): return "Buzz"
    case (false, false):  return String(number)
    }
    
}
















//if let validIndex = words.indexOf("Yellow") {
//    
//    words.removeAtIndex(validIndex)
//    
//    
//} else {
//    
//    print("Didnd't do anytthing")
//}
//
//
//words



















