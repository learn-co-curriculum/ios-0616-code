


// Int, Double

var age = 52
var momsAge = 80.6


let dads: Double = momsAge + Double(age)






let grades = 55.2 + 2





Double(age) + momsAge












func sayHello(person: String) {
    
    print("Hello!! \(person)")
}



let bloop = "BLOOP!!"

sayHello(bloop)

sayHello("Mom")





var isHungry = true


if !isHungry {
    
    print("Lets get food!")
    
} else {
    
    print("Lets go to sleep!")
    
}



switch isHungry {
    
case true:
    print("I love food.")
case false:
    print("I'm tired.")
    
}




let artists = [
    "Taylor Swift",
    "Madonna",
    "Michael Jackson",
    "Lady Gaga"
]

switch artists.first! {
    
case "Taylor Swift": print("YOLO")
default: print("HI")
    
    
}






for artist in artists {
    
    
    
    
    
    print(artist)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    switch artist {
        
    case "Taylor Swift":
        print("YAYY!!!!!!! I'M HAPPY!")
    case "Lady Gaga":
        print("I'm a monster!!")
    default:
        print("Hi \(artist)")
    
    }
    

}








let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String


switch approximateCount {
case 0:
    naturalCount = "no"
case 1...5:
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






let blooppp = 77

switch blooppp {
    
case 0, 5, 20 , 21, 77:
    print("Cool number")
default:
    print("Blah")
    
}


let story = "Whatever"


for i in story.characters {
    
    
    
    
    
}
























