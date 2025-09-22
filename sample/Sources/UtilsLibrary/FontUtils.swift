import Foundation

#if canImport(UIKit)
import UIKit
public typealias PlatformFont = UIFont
#elseif canImport(AppKit)
import AppKit
public typealias PlatformFont = NSFont
#endif

/// Cross-platform font utilities for iOS and macOS
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

    /// Creates a bold system font with the specified size
    public func boldSystemFont(size: CGFloat) -> PlatformFont? {
        #if canImport(UIKit)
        return UIFont.boldSystemFont(ofSize: size)
        #elseif canImport(AppKit)
        return NSFont.boldSystemFont(ofSize: size)
        #else
        return nil
        #endif
    }

    /// Gets the font size from a platform font
    public func fontSize(from font: PlatformFont) -> CGFloat {
        return font.pointSize
    }

    /// Checks if a font is bold
    public func isBold(_ font: PlatformFont) -> Bool {
        #if canImport(UIKit)
        let traits = font.fontDescriptor.symbolicTraits
        return traits.contains(.traitBold)
        #elseif canImport(AppKit)
        let traits = font.fontDescriptor.symbolicTraits
        return traits.contains(.bold)
        #else
        return false
        #endif
    }

    /// Gets the font family name
    public func familyName(from font: PlatformFont) -> String? {
        return font.familyName
    }

    /// Compares two fonts for equality based on family name and size
    public func areEqual(_ font1: PlatformFont, _ font2: PlatformFont) -> Bool {
        guard let family1 = font1.familyName, let family2 = font2.familyName else {
            return false
        }
        return family1 == family2 && font1.pointSize == font2.pointSize
    }

    /// Scales a font to a new size
    public func scale(_ font: PlatformFont, to newSize: CGFloat) -> PlatformFont? {
        #if canImport(UIKit)
        return font.withSize(newSize)
        #elseif canImport(AppKit)
        return NSFont(descriptor: font.fontDescriptor, size: newSize)
        #else
        return nil
        #endif
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
