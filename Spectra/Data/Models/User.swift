import Foundation

struct User {
    let name: String
    let nickname: String
    let bio: String
    let interests: [String]
    let upcomingEvents: [Event]
    
    init(name: String, nickname: String, bio: String, interests: [String], upcomingEvents: [Event]) {
        self.name = name
        self.nickname = nickname
        self.bio = bio
        self.interests = interests
        self.upcomingEvents = upcomingEvents
    }
}