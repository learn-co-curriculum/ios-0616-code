//: # Dictionary Lecture
/*:
 A _dictionary_ stores associations between keys of the same type and values of the same type in a collection with no defined ordering. Each value is associated with a unique _key_, which acts as an identifier for that value within the dictionary. There is *no* specificied order.
 */
//: ### Creating a Dictionary
var namesOfIntegers: [Int: String] = [:]

var namesOfIntegers2 = [Int: String]()

var namesOfIntegers3 = [
    0: "Zero",
    1: "One",
    2: "Two",
    3: "Three",
    4: "Four"
]


let sortedKeys = namesOfIntegers3.keys.sort()

for key in sortedKeys {
    
    print(key)
}









/*:
 Want to remove the key-value pairs from `namesOfIntegers3`?
*/
namesOfIntegers3 = [:]

namesOfIntegers3.removeAll()





//: ### Accessing and Modifying a Dictionary
var ages = [
    "Jess": 44,
    "Brian": 20,
    "Bloop": 100
]

//: ---

ages.count

print("The ages dictionary contains \(ages.count) people.")
// prints "The ages dictionary contains 3 people."


//: ---


if ages.isEmpty {
    
    print("The ages dictionary is empty")
    
} else {
    
    print("\(ages.count) number of people in the ages dictionary")
}

// prints "3 number of people in the ages dictionary"


//: ---
 ages["Biscuit"] = 22

print(ages)
// prints "["Brian": 20, "Bloop": 100, "Jess": 44, "Biscuit": 22]"




ages["Brian"] = 99

print(ages)
// prints "["Brian": 99, "Bloop": 100, "Jess": 44, "Biscuit": 22]




if let oldValue = ages.updateValue(1234, forKey: "Brian") {
    
    print("Old value is \(oldValue), newValue is 1234... diff is \(1234 - oldValue)")
    
    print("The old value for 'Brian' was \(oldValue)")

}
// prints "The old value for 'Brian' was 20"


print(ages)
// prints "["Brian": 1234, "Bloop": 100, "Jess": 44, "Biscuit": 22]"



//: ---
if let ageOfPerson = ages["Brian"] {
    
    print("The age of Brian is \(ageOfPerson).")
    
} else {
    
    print("There is no age set for a person with the name 'Maryann'")
}

// prints "There is no age set for a person with the name 'Maryann'"


//: ---
ages["Brian"] = nil

print(ages)
// prints "["Bloop": 100, "Jess": 44, "Biscuit": 22]"

let magic = ["Bla", "sldkfjsdlkj", "222"]



if let removedValue = ages.removeValueForKey("Bloop") {
    
    print("The removed person's age is \(removedValue).")
    
} else {
    
    print("The ages dictionary doesn't contain a value for 'Bloop'.")
    
}

// prints "The removed person's age is 100."




//: ### Iterating over a dictionary
/*:
 You can iterate over the key-value pairs in a dictionary with a `for-in` loop. Each item in the dictionary is returned as a `(key, value)` tuple, and you can decompose the tuple's members into temporary constants or variables as part of the iteration:
 */
var favoriteWords = [
    "rigmarole": "a lengthy and complicated procedure",
    "gobbledygook": "language that is meaningless; nonsense",
    "lollygag": "spend time aimlessly",
    "wabbit": "weary, exhausted",
]

for (key, definition) in favoriteWords {
    
    print("\(key): \(definition)")
    
}



// wabbit: weary, exhausted
// rigmarole: a lengthy and complicated procedure
// lollygag: spend time aimlessly
// gobbledygook: language that is meaningless; nonsense






for word in favoriteWords.keys {
    
    print("Word: \(word)")
    
}

// Word: wabbit
// Word: rigmarole
// Word: lollygag
// Word: gobbledygook






for definition in favoriteWords.values {
    
    print("Definition: \(definition)")
    
}

// Definition: weary, exhausted
// Definition: a lengthy and complicated procedure
// Definition: spend time aimlessly
// Definition: language that is meaningless; nonsense





//: ---

let fastAndFuriousFilms = [
    "The Fast and the Furious",
    "2 Fast 2 Furious",
    "Turbo-Charged Prelud",
    "Tokyo Drift",
    "Fast & Furious",
    "Los Bandoleros",
    "Fast Five",
    "Fast & Furious 6",
    "Furious 7",
    "Fast 8"
]

let godfatherFilms = [
    "First one",
    "Second one",
    "Third one"
]

let theBestMoviesEver = [
    "Fast & Furious": fastAndFuriousFilms,
    "Godfather": godfatherFilms
]

let nameOfPet: String? = "Hello"

if let newName = nameOfPet {
    
    
    
}


for (key, film) in theBestMoviesEver {
    
    for individualFilm in film {
        
        print("I love \(individualFilm)")
    }
    
    
    print("There are \(film.count) number of films in the movie \(key)")
    
    
}

// There are 10 number of films in the movie Fast & Furious
// There are 3 number of films in the movie Godfather



