// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum L10n {
  internal enum LaunchScreen {
  }
  internal enum Localizable {
    /// المقالات
    internal static let articles = L10n.tr("Localizable", "Articles")
    /// التسجيل من خلال جوجل
    internal static let logInWithGoogle = L10n.tr("Localizable", "Log In with google")
    /// المزيد
    internal static let more = L10n.tr("Localizable", "More")
    /// الأخبار
    internal static let news = L10n.tr("Localizable", "News")
    /// البحث
    internal static let search = L10n.tr("Localizable", "Search")
    /// الفيديوهات
    internal static let videos = L10n.tr("Localizable", "Videos")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    // swiftlint:disable:next nslocalizedstring_key
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
