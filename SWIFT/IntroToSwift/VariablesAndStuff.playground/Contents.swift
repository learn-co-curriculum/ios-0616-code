

// Values


// String
"Bran"

// Int
5

// Bool
true

// Array
["Eggs", "Bread", "Milk"]

// Dictionary
["Earth": 1, "Mars": 2, "Jupiter": 67]



func sayHi() {
    
    print("Hello")
}


sayHi()


class Person {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func jump() {
        print("JUMP!")
    }
    
}

let jim = Person(name: "BLAHHH" )
jim.jump()





// Variables / Type Inference

var starkChild = "Bran"

var favNumber = 5

var isHungry = true

var shoppingList = ["Eggs", "Bread", "Milk"]

var shoppingList2: [String]

var planetMoons = ["Earth": 5, "Mars": 2, "Jupiter": 67]








// Explicit Types

var momsFavSon: String



momsFavSon = "Jim"

print(momsFavSon)
// prints "Jim"


momsFavSon = "Michael"

print(momsFavSon)
// prints "Michael"


// momsFavSon = 22


let mommasFavSon = "Jimmy"

//mommasFavSon = "Michael"



let fullName = "Jim Campagno"
var lovesBeets = false
var address = "The Moon"
var height = 100
let rainbow = ["Red", "Orange", "Yellow", "Green", "Blue", "Indigo", "Violet"]
var moonsAndStuff = ["Earth": 1, "Mars": 2, "Jupiter": 67]



func sayHelloToTheClass() {
    
    print("Hello iOS people.")
    
}

sayHelloToTheClass()
// prints "Hello iOS people."





func greetPerson(person: String) {
    
    let greeting = "Hello " + person + "!"
    print(greeting)
}

greetPerson("Maryann")
// prints "Hello Maryann!"


func goAway(person: String) -> String {
    
    let unGreet = "Go away \(person)!!"
    return unGreet
    
}

let badPerson = "Martha"

let greetingForBadPerson = goAway(badPerson)

print(greetingForBadPerson)
// prints "Go away Martha!!"



func greet(mom mom: String, dad: String) -> String {
    
    return "Hi \(mom) 💜, hi \(dad) 🕵."
    
}

let momDadGreeting = greet(mom: "Maryann", dad: "James")

print(momDadGreeting)
// prints "Hi Maryann 💜, hi James 🕵."





let favoriteWord = "Bloop Blap Blam"


favoriteWord.hasPrefix("Bloop")  // true
favoriteWord.hasSuffix("Blam")   // true
favoriteWord.isEmpty             // false




























