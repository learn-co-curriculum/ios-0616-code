//: # Classes
// lets do this! 🌷



var favNumber: Int = 5




func helloWorld(name: String, phoneNumber: Double) {
    
    name
    phoneNumber
    
}





class Person {
    
    var name: String
    let socialSecurityNumber: String
    var friends: [Person] = []

    init(name: String, socialSecurityNumber: String) {
        self.name = name
        self.socialSecurityNumber = socialSecurityNumber
    }
    
    func eat() {
        print("\(name) has eaten a lot of food.")
    }
    
    
    func addFriend(friend: Person) {
        friends.append(friend)
    }
    
    
    
    
}


let jim = Person(name: "Jimmy", socialSecurityNumber: "123-424-2522")

let michael = Person(name: "Michael", socialSecurityNumber: "123-522-2522")


jim.addFriend(michael)



for friend in jim.friends {
    
    print(friend.name)
}














