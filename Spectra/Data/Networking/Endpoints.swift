import Foundation

struct Endpoints {
    static let baseURL = "https://api.spectra.com"

    static var login: String {
        return "\(baseURL)/login"
    }

    static var register: String {
        return "\(baseURL)/register"
    }

    static var events: String {
        return "\(baseURL)/events"
    }

    static var eventDetails: String {
        return "\(baseURL)/events/details"
    }

    static var userProfile: String {
        return "\(baseURL)/user/profile"
    }

    static var organizationProfile: String {
        return "\(baseURL)/organization/profile"
    }

    static var favorites: String {
        return "\(baseURL)/user/favorites"
    }

    static var comments: String {
        return "\(baseURL)/events/comments"
    }

    static var addEvent: String {
        return "\(baseURL)/events/add"
    }
}