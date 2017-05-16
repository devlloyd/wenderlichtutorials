import Foundation


///////////ENUMS//////////

/*
enum ColorName: String {
    case black, silver, gray, white, maroon, red, purple, fuchsia, green, lime, olive, yellow, navy, blue, teal, aqua
}
 */

enum CSSColor {
    case named(ColorName)
    case rgb(UInt8, UInt8, UInt8)
}

extension CSSColor {
    enum ColorName: String {
        case black, silver, gray, white, maroon, red, purple, fuchsia, green, lime, olive, yellow, navy, blue, teal, aqua
    }
}
/*Note: One of the great features of Swift is that the order in which you declare things usually doesn’t matter. The compiler scans the file multiple times and figures it out without needing to forward declare things as it does when working with C/C++/Objective-C.
 However, if you receive an error in your playground about ColorName being an undeclared type, move the above extension to just below your enum definition of CSSColor to clear the playground error.
 Sometimes playgrounds are sensitive to the ordering of definitions, even when it doesn’t really matter. :]
 */

extension CSSColor: CustomStringConvertible {
    var description: String {
        switch self {
        case .named(let colorName):
            return colorName.rawValue
        case .rgb(let red, let green, let blue):
            return String(format: "#%02X%02X%02X", red,green,blue)
        }
    }
}

let color1 = CSSColor.named(.red)
let color2 = CSSColor.rgb(0xAA, 0xAA, 0xAA)
print("color1 = \(color1), color2 = \(color2)")

extension CSSColor {
    init(gray: UInt8) {
        self = .rgb(gray, gray, gray)
    }
}

let color3 = CSSColor(gray: 0xaa)
print(color3)

enum Math {
    static let phi = 1.6180339887498948482 // golden mean
}

//Enumerations are great for picking items from a list of well-known things, such as days of the week, faces of a coin or states in a state machine.

//New enum cases cannot be added later in an extension.


///////////STRUCTS//////////

protocol Drawable {
    func draw(context: DrawingContext)
}

protocol DrawingContext {
    func draw(circle: Circle)
    // more primitives will go here ...
}

struct Circle : Drawable {
    var strokeWidth = 5
    var strokeColor = CSSColor.named(.red)
    var fillColor = CSSColor.named(.yellow)
    var center = (x: 80.0, y: 160.0)
    var radius = 60.0
    
    // Adopting the Drawable protocol.
    
    func draw(context: DrawingContext) {
        context.draw(self)
    }
}


var document = SVGDocument()

let rectangle = Rectangle()
document.append(rectangle)

let circle = Circle()
document.append(circle)

let htmlString = document.htmlString
print(htmlString)

import WebKit
import PlaygroundSupport
URLCache.shared = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)
let view = WKWebView(frame: CGRect(x: 0, y: 0, width: 250, height: 250))
view.loadHTMLString(htmlString, baseURL: nil)
PlaygroundPage.current.liveView = view




//Structs work a lot like classes with a couple of key differences. Perhaps the biggest difference is that structs are value types and classes are reference types.
