import UIKit

class CommentsViewController: UIViewController {
    
    var eventId: String?
    var comments: [Comment] = []
    
    private let tableView = UITableView()
    private let inputTextField = UITextField()
    private let sendButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchComments()
    }
    
    private func setupUI() {
        title = "Comments"
        view.backgroundColor = .white
        
        setupTableView()
        setupInputField()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CommentCell")
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: inputTextField.topAnchor)
        ])
    }
    
    private func setupInputField() {
        inputTextField.placeholder = "Add a comment..."
        inputTextField.borderStyle = .roundedRect
        
        sendButton.setTitle("Send", for: .normal)
        sendButton.addTarget(self, action: #selector(sendComment), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [inputTextField, sendButton])
        stackView.axis = .horizontal
        stackView.spacing = 8
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
    }
    
    private func fetchComments() {
        // Fetch comments from the database or API
        // For now, we will use dummy data
        comments = [
            Comment(username: "User1", nickname: "@user1", timestamp: Date(), text: "This event looks amazing!"),
            Comment(username: "User2", nickname: "@user2", timestamp: Date(), text: "Can't wait to attend!")
        ]
        tableView.reloadData()
    }
    
    @objc private func sendComment() {
        guard let text = inputTextField.text, !text.isEmpty else { return }
        
        // Here you would typically send the comment to the server or save it locally
        let newComment = Comment(username: "CurrentUser", nickname: "@currentuser", timestamp: Date(), text: text)
        comments.append(newComment)
        tableView.reloadData()
        inputTextField.text = ""
    }
}

extension CommentsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath)
        let comment = comments[indexPath.row]
        cell.textLabel?.text = "\(comment.username) \(comment.nickname): \(comment.text)"
        return cell
    }
}