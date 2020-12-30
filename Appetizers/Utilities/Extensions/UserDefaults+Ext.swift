import SwiftUI

extension UserDefaults {
    var welcomeScreenShown: Bool {
        get {
            return (UserDefaults.standard.value(forKey: "hasShownWelcomeScreen") as? Bool) ?? false
        }
        set {
            return UserDefaults.standard.setValue(newValue, forKey: "hasShownWelcomeScreen")
        }
    }
}
