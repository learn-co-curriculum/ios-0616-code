//: Playground - noun: a place where people can play




var name = "Jim"

var otherName = name

name = "Michael"

print(otherName)

otherName += " Love"

otherName = otherName + " Blah Bloop"




func findEvenNumbers(blopBloop numbers: [Int]) -> [Int] {
    
    return numbers.filter { $0 % 2 == 0 }
    
    var evenNumbers: [Int] = []
    
    for i in numbers where i % 2 == 0 {
        
        evenNumbers += [i]
        
    }
    
    return evenNumbers
    
}






