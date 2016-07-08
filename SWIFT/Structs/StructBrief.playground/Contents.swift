


// Reference Semantics
class Person {
    
    var name: String
    
    init(name: String) {
        
        self.name = name
        
    }
    
    func eat() {
        
        print("I'm eating food.")
    }
}


let jim = Person(name: "JJimmm")

jim.name = "Brian"

jim.eat()


print(jim.name)






// Value semantics
struct Animal {
    
    var name: String
    
    
    mutating func changeNameToBloop() {
        
        name = "BLOOP!"
    }
    
}


let lion = Animal(name: "THe BIg Lion")

lion.changeNameToBloop()

lion.name



lion.name = "BSfkdlfsklj"















let tiger = Animal(name: "Leo")

let joe = Person(name: "Joe")




func changeTheNameToBloop(animal: Animal) {
    
    print(animal.name)
    
}


changeTheNameToBloop(tiger)



func changeTheNameToBloop(person: Person) {
    
    person.name = "Bloop"

}

changeTheNameToBloop(joe)

print(joe.name)















func addOne(number: Int) -> Int {
    
    
    return number + 1
}

















