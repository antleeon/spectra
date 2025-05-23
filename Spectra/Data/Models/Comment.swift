struct Comment {
    let username: String
    let nickname: String
    let timestamp: Date
    let text: String
    
    init(username: String, nickname: String, timestamp: Date, text: String) {
        self.username = username
        self.nickname = nickname
        self.timestamp = timestamp
        self.text = text
    }
}