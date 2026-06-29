import UIKit

// VARIABLES
var nameVar: String = "Hello world!" // This is editable
let nameConstant: String = "Nilton" // This is constant
let age: Int = 18

nameVar = "Nilton2"
//nameConstant = "Nilton3"

// CLASSES
class Car {
    var name: String
    var engine: String
    var numberOfRims: Int
    var numberOfPassangers: Int
    var rimHeight: Int?
    
    init(name: String, engine: String, numberOfRims: Int, numberOfPassangers: Int, rimHeight: Int? = nil) {
        self.name = name
        self.engine = engine
        self.numberOfRims = numberOfRims
        self.numberOfPassangers = numberOfPassangers
        self.rimHeight = rimHeight
    }
    
    public func getNumbeOfPassengers() -> Int {
        return numberOfPassangers
    }
}

let fiatUno: Car = Car(name: "Fiat Uno", engine: "1.0L", numberOfRims: 4, numberOfPassangers: 5)
let golf: Car = Car(name: "Golf", engine: "2.0L", numberOfRims: 4, numberOfPassangers: 5, rimHeight: 18)

if let rimHeightFiatUno = fiatUno.rimHeight, let rimHeightGolf = golf.rimHeight {
    if rimHeightFiatUno == rimHeightGolf {
        print("The rims are equal")
    } else {
        print("The rims are different")
    }
} else {
    print("One of the variables does not exist")
}

// BAD
func updateRimHeight(carToBeUpdated: Car, newRimHeight: Int) {
    carToBeUpdated.rimHeight = newRimHeight
}

// GOOD
func getRimHeight(carToBeConsulted: Car) -> Int {
    guard let carRimHeight = carToBeConsulted.rimHeight else {
        print("Height does not exist")
        return 0
    }
            
    return carRimHeight
}

getRimHeight(carToBeConsulted: fiatUno)
