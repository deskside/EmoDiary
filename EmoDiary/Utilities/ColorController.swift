//
//  ColorController.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/25.
//

import Foundation
import SwiftUI

struct ColorController{
    
    static func hexToColor(hex: String) -> Color{
        Color(hexadecimal: hex)
    }
    
    static let systemColorArray = ["green","blue","brown","cyan","gray","indigo","mint","orange","pink","teal","yellow"]
    
    static func stringToColor(string:String) -> Color{
        switch string{
        case "green": return Color.green
        case "blue": return Color.blue
        case "brown": return Color.brown
        case "cyan": return Color.cyan
        case "gray": return Color.gray
        case "indigo": return Color.indigo
        case "mint": return Color.mint
        case "orange": return Color.orange
        case "pink": return Color.pink
        case "teal": return Color.teal
        case "yellow": return Color.yellow
        default : return Color(hexadecimal: Constants.defaultColor)
        }
    }
    
    
}



extension Color {
    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, opacity: CGFloat) {

        #if canImport(UIKit)
        typealias NativeColor = UIColor
        #elseif canImport(AppKit)
        typealias NativeColor = NSColor
        #endif

        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var o: CGFloat = 0

        guard NativeColor(self).getRed(&r, green: &g, blue: &b, alpha: &o) else {
            // You can handle the failure here as you want
            return (0, 0, 0, 0)
        }

        return (r, g, b, o)
    }
}

//struct ColorComponents: Codable, Equatable {
//    var r: CGFloat
//    var g: CGFloat
//    var b: CGFloat
//    var o: CGFloat
//}
//
//extension ColorComponents {
//    func color() -> Color {
//        Color(red: r, green: g, blue: b, opacity: o)
//    }
//    
//    extension Color {
//        func components() -> ColorComponents {
//#if os(iOS)
//            let comp = UIColor(self).cgColor.components
//#else
//            let comp = NSColor(self).cgColor.components
//#endif
//            guard let comp = comp else {
//                return ColorComponents(r: 0.0, g: 0.4784314036369324, b: 0.9999999403953552, o: 1.0) // This is Color.accentColor
//            }
//            return  ColorComponents(r: comp[0], g: comp[1], b: comp[2], o: comp[3])
//        }
//    }
    
    //extension Color {
    //    init(hex: String) {
    //        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
    //        var int: UInt64 = 0
    //        Scanner(string: hex).scanHexInt64(&int)
    //        let a, r, g, b: UInt64
    //        switch hex.count {
    //        case 3: // RGB (12-bit)
    //            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
    //        case 6: // RGB (24-bit)
    //            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
    //        case 8: // ARGB (32-bit)
    //            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
    //        default:
    //            (a, r, g, b) = (1, 1, 1, 0)
    //        }
    //
    //        self.init(
    //            .sRGB,
    //            red: Double(r) / 255,
    //            green: Double(g) / 255,
    //            blue:  Double(b) / 255,
    //            opacity: Double(a) / 255
    //        )
    //    }
    //}
    
    //extension Color {
    //
    //    /**
    //     This initializer  will convert a valid **hex** `String` to a `Color`.
    //
    //     - warning: Converting a **hex** to a `Color` can cause a slight accuracy loss.
    //     */
    //    public init?(hex: String?) {
    //        guard let hexString = hex else { return nil }
    //
    //        let r, g, b, a: CGFloat
    //        let cleanedHex = hexString.cleanedHex
    //
    //        if cleanedHex.count == 8 {
    //            let scanner = Scanner(string: cleanedHex)
    //            var hexNumber: UInt64 = 0
    //
    //            if scanner.scanHexInt64(&hexNumber) {
    //                r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
    //                g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
    //                b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
    //                a = CGFloat(hexNumber & 0x000000ff) / 255
    //
    //                self.init(.sRGB, red: Double(r), green: Double(g), blue:  Double(b), opacity: Double(a))
    //                return
    //            } else {
    //                return nil
    //            }
    //        } else if cleanedHex.count == 6 {
    //            let scanner = Scanner(string: cleanedHex)
    //            var hexNumber: UInt64 = 0
    //
    //            if scanner.scanHexInt64(&hexNumber) {
    //                r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
    //                g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
    //                b = CGFloat((hexNumber & 0x0000ff) >> 0) / 255
    //
    //                self.init(.sRGB, red: Double(r), green: Double(g), blue:  Double(b))
    //                return
    //            } else {
    //                return nil
    //            }
    //        } else {
    //            return nil
    //        }
    //    }
    //
    //    /**
    //     This variable will convert a `Color` to a **hex** `String`.
    //
    //     - warning: Converting a `Color` to a **hex** can cause a slight accuracy loss.
    //     */
    //    public var hex: String? {
    //        let colorString = "\(self)"
    //        if let colorHex = colorString.isHex() {
    //            return colorHex.cleanedHex
    //        } else {
    //            var colorArray: [String] = colorString.components(separatedBy: " ")
    //            if colorArray.count < 3 { colorArray = colorString.components(separatedBy: ", ") }
    //            if colorArray.count < 3 { colorArray = colorString.components(separatedBy: ",") }
    //            if colorArray.count < 3 { colorArray = colorString.components(separatedBy: " - ") }
    //            if colorArray.count < 3 { colorArray = colorString.components(separatedBy: "-") }
    //
    //            colorArray = colorArray.filter { colorElement in
    //                return (!colorElement.isEmpty) && (String(colorElement).replacingOccurrences(of: ".", with: "").rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil)
    //            }
    //
    //            if (colorArray.count == 3) { //count == 3 no alpha set
    //                var r: Float = Float(colorArray[0]) ?? 1
    //                var g: Float = Float(colorArray[1]) ?? 1
    //                var b: Float = Float(colorArray[2]) ?? 1
    //
    //                if (r < 0.0) {r = 0.0}
    //                if (g < 0.0) {g = 0.0}
    //                if (b < 0.0) {b = 0.0}
    //
    //                if (r > 1.0) {r = 1.0}
    //                if (g > 1.0) {g = 1.0}
    //                if (b > 1.0) {b = 1.0}
    //
    //                return String(format: "%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255)).cleanedHex
    //            } else if (colorArray.count == 4) { //count == 4 alpha is set
    //                var r: Float = Float(colorArray[0]) ?? 1
    //                var g: Float = Float(colorArray[1]) ?? 1
    //                var b: Float = Float(colorArray[2]) ?? 1
    //                var a: Float = Float(colorArray[3]) ?? 1
    //
    //                if (r < 0.0) {r = 0.0}
    //                if (g < 0.0) {g = 0.0}
    //                if (b < 0.0) {b = 0.0}
    //                if (a < 0.0) {a = 0.0}
    //
    //                if (r > 1.0) {r = 1.0}
    //                if (g > 1.0) {g = 1.0}
    //                if (b > 1.0) {b = 1.0}
    //                if (a > 1.0) {a = 1.0}
    //
    //                return String(format: "%02lX%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255), lroundf(a * 255)).cleanedHex
    //            } else {
    //                return nil
    //            }
    //        }
    //    }
    //
    //    /**
    //     Compare a `Color` to another `Color` by allowing a tolerance.
    //
    //     - parameter color: The color to compare itself with.
    //     - parameter tolerance: A `CGFloat` of a tolerance from **0** to **1.0**.
    //
    //     - note: The default tolerance is **0.3**.
    //     */
    //    @available(iOS 14.0, *)
    //    public func isEqual(to color: Color, tolerance: CGFloat = 0.3, checkAlpha: Bool = false) -> Bool {
    //        #if os(iOS)
    //        var r1 : CGFloat = 0
    //        var g1 : CGFloat = 0
    //        var b1 : CGFloat = 0
    //        var a1 : CGFloat = 0
    //        var r2 : CGFloat = 0
    //        var g2 : CGFloat = 0
    //        var b2 : CGFloat = 0
    //        var a2 : CGFloat = 0
    //
    //        UIColor(self).getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
    //        UIColor(color).getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
    //
    //        if checkAlpha {
    //            return abs(r1 - r2) <= tolerance && abs(g1 - g2) <= tolerance && abs(b1 - b2) <= tolerance && abs(a1 - a2) <= tolerance
    //        } else {
    //            return abs(r1 - r2) <= tolerance && abs(g1 - g2) <= tolerance && abs(b1 - b2) <= tolerance
    //        }
    //        #elseif os(macOS)
    //        if let newSelfColor = NSColor(self).usingColorSpace(.deviceRGB) {
    //            if let newColor = NSColor(color).usingColorSpace(.deviceRGB) {
    //                var r1 : CGFloat = 0
    //                var g1 : CGFloat = 0
    //                var b1 : CGFloat = 0
    //                var a1 : CGFloat = 0
    //                var r2 : CGFloat = 0
    //                var g2 : CGFloat = 0
    //                var b2 : CGFloat = 0
    //                var a2 : CGFloat = 0
    //
    //
    //                newSelfColor.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
    //                newColor.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
    //
    //                if checkAlpha {
    //                    return abs(r1 - r2) <= tolerance && abs(g1 - g2) <= tolerance && abs(b1 - b2) <= tolerance && abs(a1 - a2) <= tolerance
    //                } else {
    //                    return abs(r1 - r2) <= tolerance && abs(g1 - g2) <= tolerance && abs(b1 - b2) <= tolerance
    //                }
    //            } else {
    //                return false
    //            }
    //        } else {
    //            return false
    //        }
    //        #endif
    //    }
    //
    //    /**
    //     This variable will convert a `Color` to a themed `Color`.
    //     If the input color is close to black or white, it will return `Color.primary`.
    //
    //     - note: Comparison is calculated with a **0.3** tolerance.
    //     - warning: This does not look at the current theme. If you want to look at the current theme, use the **func themedColor()**
    //     */
    //    @available(iOS 14.0, *)
    //    public var themedColor: Color {
    //        if ((self.isEqual(to: .black, tolerance: 0.3)) || (self.isEqual(to: .white, tolerance: 0.3))) {
    //            return Color.primary
    //        } else {
    //            return self
    //        }
    //    }
    //
    //    /**
    //     This variable will convert a `Color` to a themed `Color`.
    //     If the **device theme** is dark, and the input is dark, it will the `replacingColor` or it will return `Color.primary`.
    //     If the **device theme** is light, and the input is light, it will the `replacingColor` or it will return `Color.primary`.
    //
    //     - parameter colorScheme: Add **@Environment(\.colorScheme) private var colorScheme** to your SwiftUI view and pass it as the parameter.
    //     - parameter replacingColor: An optional `Color` that will be returned if the color is to close to the themeColor. This color
    //     - parameter tolerance: An optional `CGFloat` of a tolerance from **0** to **1.0**. Default is **0.3**.
    //     */
    //    @available(iOS 14.0, *)
    //    public func themedColor(_ colorScheme: ColorScheme, replacingColor: Color? = nil, tolerance: CGFloat = 0.3) -> Color {
    //        if self.isAffectedBy(colorScheme: colorScheme, tolerance: tolerance) {
    //            return replacingColor?.fptThemedColor(colorScheme, tolerance: tolerance) ?? Color.primary
    //        } else {
    //            return self
    //        }
    //    }
    //
    //    /**
    //     This variable will convert a `Color` to a themed `Color`.
    //     If the **device theme** is dark, and the input is dark, it will return `Color.primary`.
    //     If the **device theme** is light, and the input is light, it will return `Color.primary`.
    //
    //     - parameter colorScheme: Add **@Environment(\.colorScheme) private var colorScheme** to your SwiftUI view and pass it as the parameter.
    //     - parameter tolerance: An optional `CGFloat` of a tolerance from **0** to **1.0**. Default is **0.3**.
    //
    //     - note: This function is only used to validate the replacingColor. FilePrivate use only.
    //     */
    //    @available(iOS 14.0, *)
    //    fileprivate func fptThemedColor(_ colorScheme: ColorScheme, tolerance: CGFloat = 0.3) -> Color {
    //        if self.isEqual(to: (colorScheme == .dark) ? .black : .white, tolerance: tolerance, checkAlpha: false) {
    //            return Color.primary
    //        } else {
    //            return self
    //        }
    //    }
    //
    //    /**
    //     Checks wheter or not the `Color` is affected by the current `ColorScheme`
    //     */
    //    @available(iOS 14.0, *)
    //    public func isAffectedBy(colorScheme: ColorScheme, tolerance: CGFloat = 0.3) -> Bool {
    //        return self.isEqual(to: (colorScheme == .dark) ? .black : .white, tolerance: tolerance, checkAlpha: false)
    //    }
    //}
