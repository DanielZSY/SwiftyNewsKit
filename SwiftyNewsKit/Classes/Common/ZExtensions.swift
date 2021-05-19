
import UIKit

extension Bundle {
    static var assetBundle: Bundle {
        guard let url = Bundle(for: ZMessageViewController.self).url(forResource: "SwiftyNewsKit", withExtension: "bundle"),
              let resourcesBundle = Bundle(url: url)
        else {
            return Bundle.main
        }
        return resourcesBundle
    }
}
extension UIImage {
    static func assetImage(named: String) -> UIImage? {
        let image = UIImage(named: named, in: Bundle.assetBundle, compatibleWith: nil)
        if image == nil {
            return UIImage.init(named: named)
        }
        return image
    }
}
