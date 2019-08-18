// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
enum L10n {

  enum Authpage {

    enum Buttons {

      enum Login {
        /// Login
        static let text = L10n.tr("Localizable", "AuthPage.Buttons.Login.text")
      }
    }

    enum Inputfield {

      enum Email {
        /// Email
        static let placeholder = L10n.tr("Localizable", "AuthPage.InputField.Email.placeholder")
      }

      enum Errors {
        /// Field cannot be empty
        static let empty = L10n.tr("Localizable", "AuthPage.InputField.Errors.empty")
        /// Invalid format
        static let incorrect = L10n.tr("Localizable", "AuthPage.InputField.Errors.incorrect")
      }

      enum Password {
        /// Password
        static let placeholder = L10n.tr("Localizable", "AuthPage.InputField.Password.placeholder")
      }
    }
  }

  enum Keychainserviceerror {
    /// Data to String conversion error
    static let dataToString = L10n.tr("Localizable", "KeychainServiceError.dataToString")
    /// String to Data conversion error
    static let stringToData = L10n.tr("Localizable", "KeychainServiceError.stringToData")
    /// Error can not be handled
    static let unhandled = L10n.tr("Localizable", "KeychainServiceError.unhandled")
  }

  enum Maintabbar {

    enum Tabs {

      enum Playlist {
        /// Play List
        static let title = L10n.tr("Localizable", "MainTabBar.Tabs.PlayList.title")
      }

      enum Profile {
        /// Profile
        static let title = L10n.tr("Localizable", "MainTabBar.Tabs.Profile.title")
      }

      enum Randomimages {
        /// Random Images
        static let title = L10n.tr("Localizable", "MainTabBar.Tabs.RandomImages.title")
      }
    }
  }

  enum Playlist {

    enum Navbar {
      /// Play List
      static let title = L10n.tr("Localizable", "PlayList.Navbar.title")
    }
  }

  enum Profile {

    enum Buttons {

      enum Logout {
        /// Logout
        static let title = L10n.tr("Localizable", "Profile.Buttons.Logout.title")
      }
    }

    enum Navbar {
      /// Profile
      static let title = L10n.tr("Localizable", "Profile.Navbar.title")
    }
  }

  enum Randomimages {

    enum Buttons {

      enum Update {
        /// Update
        static let title = L10n.tr("Localizable", "RandomImages.Buttons.Update.title")
      }
    }

    enum Navbar {
      /// Random Images
      static let title = L10n.tr("Localizable", "RandomImages.Navbar.title")
    }
  }

  enum Songdetail {

    enum Lyricscell {
      /// Lyrics
      static let title = L10n.tr("Localizable", "SongDetail.LyricsCell.title")
    }
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
