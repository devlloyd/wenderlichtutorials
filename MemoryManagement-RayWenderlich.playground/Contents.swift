//: Playground - noun: a place where people can play
//https://www.raywenderlich.com/134411/arc-memory-management-swift

import UIKit

class User {
    var name: String
    var subscriptions: [CarrierSubscription] = []
    
    init(name: String) {
        self.name = name
        print("User \(name) is initialized")
    }
    
    private(set) var phones: [Phone] = []
    func add(phone: Phone) {
        phones.append(phone)
        phone.owner = self
    }
    
    deinit {
        print("User \(name) is being deallocated")
    }
}

class Phone {
    let model: String
    //var owner: User?
    weak var owner: User? //breaks the User-Phone reference cycle and allows for
                            //no memory leak
    
    var carrierSubscription: CarrierSubscription?
    
    func provision(carrierSubscription: CarrierSubscription) {
        self.carrierSubscription = carrierSubscription
    }
    
    func decommission() {
        self.carrierSubscription = nil
    }
    
    init(model: String) {
        self.model = model
        print("Phone \(model) is initialized")
    }
    
    deinit {
        print("Phone \(model) is being deallocated")
    }
}

//do {
//let user1 = User(name: "John")
//}  //do{} wrapper allows object to be deinitialized


//The lifetime of a Swift object consists of five stages:
//1. Allocation (memory taken from stack or heap)
//2. Initialization (init code runs)
//3. Usage (the object is used)
//4. Deinitialization (deinit code runs)
//5. Deallocation (memory returned to stack or heap)

//demonstrating 'unowned'
//"Since a User with no CarrierSubscription can exist, but no CarrierSubscription can exist without a User, the user reference should be unowned."
class CarrierSubscription {
    let name: String
    let countryCode: String
    let number: String
    unowned let user: User
    lazy var completePhoneNumber: () -> String = {
        [unowned self] in
        return self.countryCode + " " + self.number
    }
            //"The property is declared with lazy, meaning that it will not be assigned until it’s used the first time. This is required because it’s using self.countryCode and self.number, which aren’t available until after the initializer runs."
    
    init(name: String, countryCode: String, number: String, user: User) {
        self.name = name
        self.countryCode = countryCode
        self.number = number
        self.user = user
        user.subscriptions.append(self)
        
        print("CarrierSubscription \(name) is initialized")
    }
    
    deinit {
        print("CarrierSubscription \(name) is being deallocated")
    }
}

do {
    let user1 = User(name: "John")
    let iPhone = Phone(model: "iPhone 6s Plus")
    user1.add(phone: iPhone)
    let subscription1 = CarrierSubscription(name:"TelBel", countryCode: "0032", number: "31415926", user: user1)
    print(subscription1.completePhoneNumber())
}
