import UIKit

<<<<<<< HEAD
//Task 1
class Book {
    let id: UUID
    var title: String
    var author: String
    var isBorrowed: Bool
    
    init (id: UUID, title: String, author: String, isBorrowed: Bool) {
        self.id = id
        self.title = title
        self.author = author
        self.isBorrowed = isBorrowed
    }
    
    func borrowed() {
        isBorrowed = true
    }
    func returned() {
        isBorrowed = false
    }
}


//Task 2
class Owner {
    let id = UUID()
    var name: String
    var borrowedBooks: [Book]
    
    init(id: UUID, name: String, borrowedBooks: [Book] = []) {
        self.name = name
        self.borrowedBooks = borrowedBooks
    }
    
    func borrowBook(book: Book) {
        book.borrowed()
        borrowedBooks.append(book)
    }
    
    func returnBook(book: Book) {
        book.returned()
        borrowedBooks = borrowedBooks.filter { (bookInArray) in
            bookInArray.id != book.id
        }
    }
}


//Task 3
class Library {
    var Books: [Book]
    var Owners: [Owner]
    
    init(Books: [Book], Owners: [Owner]) {
        self.Books = Books
        self.Owners = Owners
    }
    
    func addBook(newBook: Book) {
        Books.append(newBook)
    }
    
    func addOwner(newOwner: Owner) {
        Owners.append(newOwner)
    }
    
    func allAvailableBooks() -> [Book] {
        return Books.filter { (book: Book) -> Bool in
            return book.isBorrowed == false
        }
    }
    
    func allBorrowedBooks() -> [Book] {
        return Books.filter { (book: Book) -> Bool in
            return book.isBorrowed == true
        }
    }
    
    func findOwner (ownerId: UUID) -> Owner? {
        for owner in Owners {
            if owner.id == ownerId {
                return owner
            }
        }
        return nil
    }
    
    func takenBooksByOwner(ownerId: UUID) -> [Book] {
        for owner in Owners {
            if owner.id == ownerId {
                return owner.borrowedBooks
            }
        }
        return[]
    }
    
    func takeBookIfAvailable(bookId: UUID) {
        for index in 0..<Books.count {
            if Books[index].id == bookId {
                if !Books[index].isBorrowed {
                    Books[index].isBorrowed = true
                    break
                }
            }
        }
    }
}


//Task 4
let book1 = Book(id: UUID(), title: "1984", author: "George Orwell", isBorrowed: false)
let book2 = Book(id: UUID(), title: "Master and Margarita", author: "Mikhail Bulgakov", isBorrowed: false)
let book3 = Book(id: UUID(), title: "Martin Eden", author: "Jack London", isBorrowed: false)
let book4 = Book(id: UUID(), title: "The Stranger", author: "Albert Camus", isBorrowed: false)

let owner1 = Owner(id: UUID(), name: "Nika")
let owner2 = Owner(id: UUID(), name: "Nino")
let owner3 = Owner(id: UUID(), name: "Giorgi")

let library = Library(Books: [book1, book2, book3, book4], Owners: [owner1, owner2, owner3])

owner1.borrowBook(book: book1)
owner1.borrowBook(book: book2)
owner1.borrowBook(book: book3)

owner1.returnBook(book: book2)
owner1.returnBook(book: book3)

let borrowedBooks = library.allBorrowedBooks()
if !borrowedBooks.isEmpty {
    print("Books that are borrowed:")
    for book in borrowedBooks {
        print("-\(book.title) by \(book.author)")
    }
} else {
    print("No borrowed books")
}

let availableBooks = library.allAvailableBooks()
var titles = ""
for book in availableBooks {
    titles += "\(book.title), "
}
print("Available books: \(titles)")

let ownerBooks = library.takenBooksByOwner(ownerId: owner1.id)
if !ownerBooks.isEmpty {
    print("Books borrowed by \(owner1.name):")
    for book in ownerBooks {
        print("- \(book.title) by \(book.author)")
    }
} else {
    print("\(owner1.name) has not borrowed any books.")
}
=======

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
>>>>>>> 5780a080a28328fb6ca8cddbcedeb2905aafa229
