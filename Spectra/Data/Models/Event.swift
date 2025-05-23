import Foundation

struct Event {
    let id: UUID
    let title: String
    let date: Date
    let location: String
    let description: String
    let genre: String
    let organizerId: UUID
    let isFavorite: Bool
    
    init(id: UUID = UUID(), title: String, date: Date, location: String, description: String, genre: String, organizerId: UUID, isFavorite: Bool = false) {
        self.id = id
        self.title = title
        self.date = date
        self.location = location
        self.description = description
        self.genre = genre
        self.organizerId = organizerId
        self.isFavorite = isFavorite
    }
}