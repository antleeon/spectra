import Foundation

struct Organization {
    let id: UUID
    let name: String
    let nickname: String
    let avatarURL: String
    let bio: String
    let upcomingEvents: [Event]
    
    init(id: UUID = UUID(), name: String, nickname: String, avatarURL: String, bio: String, upcomingEvents: [Event] = []) {
        self.id = id
        self.name = name
        self.nickname = nickname
        self.avatarURL = avatarURL
        self.bio = bio
        self.upcomingEvents = upcomingEvents
    }
}