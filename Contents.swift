import UIKit

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

