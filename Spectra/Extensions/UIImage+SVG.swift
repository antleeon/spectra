import UIKit
import SVGKit

extension UIImage {
    static func svgImage(named name: String) -> UIImage? {
        let svgImage = SVGKImage(named: name)
        return svgImage?.uiImage
    }
}