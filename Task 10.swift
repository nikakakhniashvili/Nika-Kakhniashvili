import UIKit


//Strong reference
class Portal {
    let name: String
    init(name: String) { self.name = name }
    var user: User?
    deinit { print("\(name) is deinitialized") }
}

class User {
    let userName: String
    init(userName: String) { self.userName = userName }
    var webName: Portal?
    deinit { print("\(userName) is deinitialized") }
}

var name: Portal?
var userName: User?

name = Portal(name: "Instagram")
userName = User(userName: "nika24")

name!.user = userName
userName!.webName = name

name = nil
userName = nil


//Weak reference
class Company {
    let name: String
    init(name: String) { self.name = name }
    var product: Product?
    deinit { print("\(name) is deinitialized") }
}

class Product {
    let productName: String
    init(productName: String) { self.productName = productName }
    weak var companyName: Company?
    deinit { print("\(productName) is deinitialized") }
}

var companyName: Company?
var productName: Product?

companyName = Company(name: "Apple")
productName = Product(productName: "iPhone")

companyName!.product = productName
productName!.companyName = companyName

companyName = nil
productName = nil


//Unowned reference
class Person {
    let personName: String
    var phone: Phone?
    init(personName: String) {
        self.personName = personName
    }
    deinit { print("\(personName) is deinitialized") }
}

class Phone {
    let phoneNumber: UInt64
    unowned let person: Person
    init(phoneNumber: UInt64, person: Person) {
        self.phoneNumber = phoneNumber
        self.person = person
    }
    deinit { print("\(phoneNumber) is deinitialized") }
}

var personName: Person?

personName = Person(personName: "Nika")
personName!.phone = Phone(phoneNumber: 599040141, person: personName!)

personName = nil


//Closure in the class
class Car {
    let model: String
    let color: String?
    var closure: (() -> Void)?
    
    init(model: String, color: String?) {
        self.model = model
        self.color = color
        self.closure = {
            print("I have \(self.model)")
        }
    }
    
    deinit {
        print("\(model) is deinitialized")
    }
}

var myCar: Car? = Car(model: "Toyota", color: "Black")
myCar?.closure?()
myCar = nil


//Protocol, class and struct
protocol Device {
    var brand: String { get }
    func turnOn()
}

class Laptop: Device {
    var brand: String
    
    init(brand: String) {
        self.brand = brand
    }
    
    func turnOn() {
        print("\(brand) is turned on")
    }
    
    deinit {
        print("\(brand) is deinitialized")
    }
}

struct Owner {
    var laptop: Laptop?
}

let someLaptop = Laptop(brand: "Lenovo")
var owner = Owner(laptop: someLaptop)

owner.laptop?.turnOn()

owner = Owner(laptop: Laptop(brand: "Microsoft"))
owner.laptop = nil

