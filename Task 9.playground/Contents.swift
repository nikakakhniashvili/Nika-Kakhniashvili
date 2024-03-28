import UIKit


//Task 1
enum Gender {
    case male
    case female
}


//Task 2
protocol SuperBeing {
    var name: String { get set }
    var strength: Int { get set }
    var speed: Int { get set }
    var weakness: String { get set }
    var gender: Gender { get set }
}


//Task 3
extension SuperBeing {
    var strength: Int { 100 }
    var speed: Int { 50 }
}


//Task 4
class SuperHero: SuperBeing {
    var name: String
    var strength: Int
    var speed: Int
    var weakness: String
    var gender: Gender
    
    init(heroName: String, heroStrength: Int, heroSpeed: Int, heroWeakness: String, heroGender: Gender) {
        name = heroName
        strength = heroStrength
        speed = heroSpeed
        weakness = heroWeakness
        gender = heroGender
    }
}

class SuperVillain: SuperBeing {
    var name: String
    var strength: Int
    var speed: Int
    var weakness: String
    var gender: Gender
    
    init(villainName: String, villainStrength: Int, villainSpeed: Int, villainWeakness: String, villainGender: Gender) {
        name = villainName
        strength = villainStrength
        speed = villainSpeed
        weakness = villainWeakness
        gender = villainGender
    }
}


//Task 5
extension SuperHero {
    var outfitColor: String { "Green" }
    var equipment: String { "Bow" }
    var vehicle: String { "Motorcycle" }
}


//Task 6
extension SuperHero {
    func rescue(victimName: String) -> String {
        "\(name) saved \(victimName)"
    }
}

let hero = SuperHero(heroName: "Arrow", heroStrength: 100, heroSpeed: 25, heroWeakness: "Mistrustful", heroGender: .male )
print(hero.rescue(victimName: "Nika"))


//Task 7
extension SuperHero {
    func combat(villain: SuperVillain) -> String {
        "\(name) defeated \(villain.name)"
    }
}

let villain = SuperVillain(villainName: "The Dark Archer", villainStrength: 80, villainSpeed: 20, villainWeakness: "Greed", villainGender: .male)
print(hero.combat(villain: villain))


//Task 8
extension SuperVillain {
    var evilScheme: String { "to take over the city" }
    var obsession: String { "to defeat Arrow" }
    var rivalry: String { "Arrow" }
}


//Task 9
extension SuperVillain {
    func attack(hero: SuperHero) -> String {
        "\(name) plans to attack the city, it is doubtful if \(hero.name) will be able to stop him"
    }
}

print(villain.attack(hero: hero))


//Task 10
extension SuperVillain {
    func experimentation(subject: String) -> String {
        "\(name) conducts experiments on citizens, his victim turned out to be \(subject)"
    }
}
var subject: String = "Nika"

print(villain.experimentation(subject: "Nika"))


//Task 11
let hero1 = SuperHero(heroName: "Flash", heroStrength: 90, heroSpeed: 1400, heroWeakness: "Time Travel", heroGender: .male)
let hero2 = SuperHero(heroName: "Batman", heroStrength: 95, heroSpeed: 50, heroWeakness: "Bats", heroGender: .male)
let hero3 = SuperHero(heroName: "Superman", heroStrength: 89, heroSpeed: 79, heroWeakness: "Electricity", heroGender: .male)
let hero4 = SuperHero(heroName: "Hulk", heroStrength: 101, heroSpeed: 10, heroWeakness: "Magic", heroGender: .male)
let hero5 = SuperHero(heroName: "Captain America", heroStrength: 90, heroSpeed: 75, heroWeakness: "Idealism", heroGender: .male)

let villain1 = SuperVillain(villainName: "Reverse Flash", villainStrength: 50, villainSpeed: 1400, villainWeakness: "Alone", villainGender: .male)
let villain2 = SuperVillain(villainName: "The Joker", villainStrength: 6, villainSpeed: 8, villainWeakness: "Mental", villainGender: .male)
let villain3 = SuperVillain(villainName: "Darkseid", villainStrength: 150, villainSpeed: 9, villainWeakness: "Radion", villainGender: .male)
let villain4 = SuperVillain(villainName: "The Leader", villainStrength: 1, villainSpeed: 12, villainWeakness: "Strength", villainGender: .male)
let villain5 = SuperVillain(villainName: "Crossbones", villainStrength: 99, villainSpeed: 39, villainWeakness: "Defense", villainGender: .male)
