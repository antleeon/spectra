import UIKit

extension UIColor {
    static let spectraBackground = UIColor(hex: "#111111")
    static let spectraSurface = UIColor(hex: "#1E1E1E")
    static let spectraText = UIColor(hex: "#FFFFFF")
    static let spectraSecondaryText = UIColor(hex: "#888888")
    static let spectraAccent = UIColor(hex: "#7751FF")

    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        let r = CGFloat((rgb & 0xFF0000) >> 16) / 255
        let g = CGFloat((rgb & 0x00FF00) >> 8) / 255
        let b = CGFloat(rgb & 0x0000FF) / 255
        self.init(red: r, green: g, blue: b, alpha: 1)
    }
}