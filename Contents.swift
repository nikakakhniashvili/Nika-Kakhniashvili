import UIKit

//Task 1
enum WeekDay {
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    case Sunday
}

func workDayOrNot(day: WeekDay) -> String {
    if day == WeekDay.Saturday || day == WeekDay.Sunday {
        return "დასვენების დღე"
    } else {
        return "სამუშაო დღე"
    }
}

let kindOfDay = workDayOrNot(day: .Monday)
print(kindOfDay)


//Task 2
enum GialaSquad: String {
    case TsigroviManto = "9999"
    case MoshishvlebuliMkerdi = "50"
    case TuGapatio = "1"
}
var monthlyPayment1 = GialaSquad.TsigroviManto.rawValue
print(monthlyPayment1)
var monthlyPayment2 = GialaSquad.MoshishvlebuliMkerdi.rawValue
print(monthlyPayment2)
var monthlyPayment3 = GialaSquad.TuGapatio.rawValue
print(monthlyPayment3)


//Task 3
enum Weather {
    case Sunny(Int)
    case Cloudy(Int)
    case Rainy(Int)
    case Snowy(Int)
    
    func recommendationWhatToWear() -> String {
        switch self {
        case .Sunny(let celsius) where celsius >= 35:
            return "ჩაიცვი მაისური"
        case .Cloudy(let celsius) where celsius == 20:
            return "ჩაიცვი პერანგი"
        case .Rainy(let celsius) where celsius == 10:
            return "ჩაიცვი საწვიმარი"
        case .Snowy(let celsius) where celsius == 0:
            return "ჩაიცვი ქურთუკი"
        default:
            return "ამინდის ტიპი გაურკვეველია"
        }
    }
}

let celsius1 = Weather.Sunny(35)
let celsius2 = Weather.Cloudy(20)
let celsius3 = Weather.Rainy(10)
let celsius4 = Weather.Snowy(0)

print(celsius1.recommendationWhatToWear())


//Task 4
struct Kanye {
    var album: String
    var releaseYear: Int
}

var albums: [Kanye] = []

albums.append(Kanye(album: "Graduation", releaseYear: 2007))
albums.append(Kanye(album: "Yeezus", releaseYear: 2013))
albums.append(Kanye(album: "Donda", releaseYear: 2021))

func releasedAfter(releaseYear: Int) -> [String] {
    var releasedAlbums: [String] = []
    for album in albums {
        if album.releaseYear > releaseYear {
            releasedAlbums.append("\(album)")
        }
    }
    return releasedAlbums
}

let albumsAfter2010 = releasedAfter(releaseYear: 2010)
print(albumsAfter2010)


//Task 5
@propertyWrapper
struct cachedData {
    var wrappedValue: String
    var closure: () -> Void = {}
    
    init(wrappedValue: String, closure: @escaping () -> Void) {
        self.wrappedValue = wrappedValue
        self.closure = closure
    }
}

struct Object {
    @cachedData(closure: {
        print("")
    })
    var property: String = "lazy ინიციალიზებულია"
}

var object = Object()
print(object.property)
