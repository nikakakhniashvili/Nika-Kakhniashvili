import UIKit


//Task 1
func reverseWord(word: String) -> Bool {
    return word == String(word.reversed())
}
print(reverseWord(word: "აირევი ივერია"))


//Task 2
func squareNumber(array: [Int]) -> [Int] {
    var squareArray: [Int] = []
    for number in array {
        let square = number * number
        squareArray.append(square)
    }
    return squareArray
}
print(squareNumber(array: [1, 2, 3]))


//Task 3
let closure: (Int) -> Bool = { number in
    return number % 2 == 1
}
let array = [1, 2, 3, 4, 5]
let oddNumbers = array.filter(closure)
print(oddNumbers)


//Task 4
func sumOfNumbers(myArray: [Int]) -> Int {
    var sum: Int = 0
    for myNumber in myArray {
        sum += myNumber
    }
    return sum
}

func delayedSum(result: Int, completion: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: completion)
}

let sum = sumOfNumbers(myArray: [1, 2, 3, 4, 5])
delayedSum(result: sum) {
    print(sum)
}


//Task 5
var contacts: [String: String] = [:]
contacts["Ana"] = "599 78-89-10"
contacts["Saba"] = "595 27-00-77"
contacts["Elene"] = "577 12-21-22"

for (name, number) in contacts {
    print("\(name): \(number)")
}

let nameOfContact = "Ana"
if let number = contacts[nameOfContact] {
    print("\(number)")
} else {
    print("ასეთი სახელით კონტაქტი არ არსებობს")
}

let deleteContact = "Saba"
if let removeNumber = contacts.removeValue(forKey: deleteContact) {
    print("\(deleteContact) წაიშლება კონტაქტებიდან")
}


//Task 6
func productsToBuy(dictionary: [String: Int]) -> [String] {
    let alphabeticOrder = dictionary.keys.sorted()
    return alphabeticOrder
}

let productsList: [String: Int] = [
    "bread": 3,
    "apple": 5,
    "candy": 2,
    "donut": 4
]

let alphabeticOrder = productsToBuy(dictionary: productsList)
print("alphabeticOrder:", alphabeticOrder)


//Task 7
var doubleArray = [1.5, 2.75, 3.9, 4.3, 5.0]
var theLargestDouble = 0.0
for double in doubleArray {
    if double > theLargestDouble {
        theLargestDouble = double
    }
}
print(theLargestDouble)
