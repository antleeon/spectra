import Foundation

struct Constants {
    // API Constants
    static let baseURL = "https://api.spectra.com"
    static let eventsEndpoint = "/events"
    static let usersEndpoint = "/users"
    static let organizationsEndpoint = "/organizations"
    
    // User Defaults Keys
    static let userTokenKey = "userToken"
    static let isLoggedInKey = "isLoggedIn"
    
    // Notification Names
    static let eventAddedNotification = Notification.Name("eventAdded")
    static let userProfileUpdatedNotification = Notification.Name("userProfileUpdated")
    
    // UI Constants
    static let defaultAnimationDuration: TimeInterval = 0.3
    static let cornerRadius: CGFloat = 8.0
    static let shadowOpacity: Float = 0.2
    static let shadowRadius: CGFloat = 4.0
    
    // Miscellaneous
    static let appName = "Spectra"
    static let appVersion = "1.0.0"
}