import Foundation

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



