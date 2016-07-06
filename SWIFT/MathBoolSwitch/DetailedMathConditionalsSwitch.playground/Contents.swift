


// Create a constant named favoriteColor of type String, but don't assign it a value.
// Can we use this constant which doesn't have a value?
// Can we then assign a value to this constant?



// Int, Double, Float

let age: Int = 2
let age1 = 2

let age2: Int
age2 = 2


// Un-comment, show the errors

// age2 += 5
// age2 = age2 + 5



// Double has a precision of at least 15 decimal digits, whereas the precision of Float can be as little as 6 decimal digits. In situations where either type would be approrpiate, Double is preferred.


let averageGrade = 55.2


averageGrade + 5


// Numeric Literals


let coolNumber = 5

// Un-comment to show the fun
//averageGrade + coolNumber





var isHungry = true

if isHungry {
    
    print("🍕")
    
} else {
    
    print("😴")
    
}




let blackBearIsBest = true
let bearsEatBeets = true
let bearsBeetsBattlestarGalactica = true

let identityTheftIsAJoke: Bool


if blackBearIsBest && bearsEatBeets && bearsBeetsBattlestarGalactica {
    
    // identityTheftIsAJoke = false
    
} else {
    
    // identityTheftIsAJoke = true
    
}





let myNumber = 5
let yourNumber = 10

5 == 10
5 > 10
5 < 10
5 != 10
5 >= 10
5 <= 10


myNumber == yourNumber
myNumber > yourNumber
myNumber < yourNumber
myNumber != yourNumber
myNumber >= yourNumber
myNumber <= yourNumber



if myNumber > yourNumber {
    
    print("I win!")
    
} else {
    
    print("I lose :(")
}




var colorOfHerDress = "Red"

switch colorOfHerDress {
    
    // the various cases go here.
    // it MUST be exhaustive!
    // what does that mean?
    
    
    
    
    
    
case "Blue":
    print("It's blue!")
default:
    print("Who knows what color it is?")
    
}




let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String

switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")
// Prints "There are dozens of moons orbiting Saturn.”










