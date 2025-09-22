import Foundation

#if canImport(UIKit)
import UIKit
public typealias PlatformFont = UIFont
#elseif canImport(AppKit)
import AppKit
public typealias PlatformFont = NSFont
#endif

/// Simple cross-platform font utilities for iOS and macOS
public struct FontUtils {

    public init() {}

    /// Creates a system font with the specified size
    public func systemFont(size: CGFloat) -> PlatformFont? {
        #if canImport(UIKit)
        return UIFont.systemFont(ofSize: size)
        #elseif canImport(AppKit)
        return NSFont.systemFont(ofSize: size)
        #else
        return nil
        #endif
    }

    /// Gets the font size from a platform font
    public func fontSize(from font: PlatformFont) -> CGFloat {
        return font.pointSize
    }

    /// Validates if a font size is within reasonable bounds
    public func isValidFontSize(_ size: CGFloat) -> Bool {
        return size >= 6.0 && size <= 144.0
    }

    /// Gets the default font size for different text styles
    public func defaultSize(for style: FontStyle) -> CGFloat {
        switch style {
        case .caption:
            return 12.0
        case .body:
            return 17.0
        case .headline:
            return 22.0
        case .title:
            return 28.0
        }
    }
}

/// Common font styles
public enum FontStyle {
    case caption
    case body
    case headline
    case title
}
