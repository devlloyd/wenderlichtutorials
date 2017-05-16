/*Difference between Struct and class
 
 1. Struct does not support inheritance
 
 2. With structs, you do not have to initialize the value
 
 
 */
 
 import Foundation

struct MyStruct {
    var someProperty: Double
}


var myStruct = MyStruct(someProperty: 50)
myStruct.someProperty


//Initialization for Class

class MyClass {
    var someProperty: Double
    
    init(addProperty: Double) {
        someProperty = addProperty
    }
}

var myClass = MyClass(addProperty: 102.123)
myClass.someProperty


// Finding radius of a circle

class Circle {
    var x: Int, y: Int
    var radius: Double
    var diameter: Double {
        return radius * 2
    }
    
    init(x: Int, y:Int, radius:Double) {
        self.x = x
        self.y = y
        self.radius = radius
    }
}

var myCircle = Circle(x: 10, y: 10, radius: 20)
myCircle.diameter