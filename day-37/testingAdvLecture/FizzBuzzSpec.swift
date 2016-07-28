import Quick
import Nimble

@testable import testingAdvLecture

class FizzBuzzSpec: QuickSpec {
    override func spec() {
        describe("run") { 
            it("returns the correct ouput for 1 to 15") {
                let correctOutput = "BuzzFizzBuzzBuzzFizzBuzzFizzBuzz"
                let result = FizzBuzz.run(1,end: 15)

                expect(result).to(equal(correctOutput))

            }
            it("Switches ordering if incorrect") {
                let correctOutput = "BuzzFizzBuzzBuzzFizzBuzzFizzBuzz"
                let result = FizzBuzz.run(15,end: 1)

                expect(result).to(equal(correctOutput))
                
            }
        }


        describe("correctMessage") { 
            it("returns Buzz for three") {
                let result = FizzBuzz.correctMessage(3)

                expect(result).to(equal("Buzz"))
            }
            it("returns Fizz for Five") {
                let result = FizzBuzz.correctMessage(5)

                expect(result).to(equal("Fizz"))
            }
            it("returns FizzBuzz for Fifteen") {
                let result = FizzBuzz.correctMessage(15)
                
                expect(result).to(equal("FizzBuzz"))
            }
            it("returns nothing for not a divisible number") {
                let result = FizzBuzz.correctMessage(2)

                expect(result).to(equal(""))
            }


        }
    }
}
