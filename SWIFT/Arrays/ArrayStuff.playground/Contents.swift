//: # Array Time
/*:
 Swift provides three primary _collection types_, known as arrays, sets, and dictionaries, for storing collections of values. Arrays are **ordered** collections of values. Sets are unordered collections of **unique** values. Dictionaries are **unordered** collections of key-value associations.
 
 */
//: ![image](CollectionTypes_intro_2x.png)
/*:
 ## Mutability
 */
//: ![cats](cats.png)
let cats = ["Persian cat", "British Shorthair", "Turkish Angora", "Bengal cat"]







//: ![dogs](dogs.png)
var dogs = [
    "Labrador Retriever",
    "Bulldog",
    "German Shepherd",
    "Beagle"
]




//: ---
//: ## Creating an Empty Array
var dogsAndCats: [String] = []


var dogsAndCats2 = [String]()




var dogsAndCats3: Array<String> = []



//: ---
//: ## Using an Array
// append something to dogsAndCats

dogsAndCats.append("Fido")




// show the count of dogsAndCats

dogsAndCats.count





// show the error of trying to access/change an element at a specific index.



// show the insert function, passing in something atIndex 0 twice then attempting to insert something atIndex 4

dogsAndCats[0] = "Brian"


// show isEmpty

if dogsAndCats.isEmpty {
    
    
}



// (String) -> Int



// show them sort


var shoppingThing = ["Apple", "apple", "beets"]



//      <


// show them removeAtIndex


shoppingThing.removeAtIndex(0)


struct Person {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

let jimbo = Person(name: "Jimbo")
jimbo.name = "jlkadsjflkdsjf"

func test(a: Person) {
    
    var b = a
    b.name = "Jimbo"
    
//    a.name = "Bilbo Bagins"
    
}

test(jimbo)

print(jimbo.name)


// Scroll through to show them how they can find methods on arrays





//: ## Iterating over an Array
// Create a new array that contains Six Eggs, Milk, Flour, Baking Powder, Bananas
let shoppingList = ["Eggs", "Milk", "Flour", "Baking Powder", "Bananas"]

// Want to iterate over the collection?
for x in shoppingList {
    
}

// Iterate over all but the first element of a collection?

let test = dogsAndCats.removeFirst()

for x in shoppingList.dropFirst() {
    
    
}


// Iterate over all but the last 2 of a collection?
for x in shoppingList.dropLast(2) {
    
    
}

// Iterate over all the indicies of a collection?
for idx in shoppingList.indices {
    
    
}





// Want to number all the elements in a collection?
for (index, item) in shoppingList.enumerate() {
    
    let number = index + 1
    print("\(number). - \(item)")
    
}










