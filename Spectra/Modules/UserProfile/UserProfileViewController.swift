import UIKit

class UserProfileViewController: UIViewController {
    
    var presenter: UserProfilePresenterProtocol?
    
    private let avatarImageView = UIImageView()
    private let nameLabel = UILabel()
    private let nicknameLabel = UILabel()
    private let bioLabel = UILabel()
    private let tagsLabel = UILabel()
    private let eventsTableView = UITableView()
    private let editButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }
    
    private func setupUI() {
        view.backgroundColor = .spectraBackground
        
        // Setup avatarImageView
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.clipsToBounds = true
        view.addSubview(avatarImageView)
        
        // Setup nameLabel
        nameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        nameLabel.textColor = .spectraText
        view.addSubview(nameLabel)
        
        // Setup nicknameLabel
        nicknameLabel.font = UIFont.systemFont(ofSize: 16)
        nicknameLabel.textColor = .spectraAccent
        view.addSubview(nicknameLabel)
        
        // Setup bioLabel
        bioLabel.font = UIFont.systemFont(ofSize: 14)
        bioLabel.numberOfLines = 0
        bioLabel.textColor = .spectraSecondaryText
        view.addSubview(bioLabel)
        
        // Setup tagsLabel
        tagsLabel.font = UIFont.systemFont(ofSize: 14)
        tagsLabel.textColor = .spectraAccent
        view.addSubview(tagsLabel)
        
        // Setup eventsTableView
        eventsTableView.delegate = self
        eventsTableView.dataSource = self
        eventsTableView.backgroundColor = .spectraBackground
        view.addSubview(eventsTableView)
        
        // Setup editButton
        editButton.setTitle("Edit", for: .normal)
        editButton.setTitleColor(.spectraAccent, for: .normal)
        editButton.backgroundColor = .spectraSurface
        editButton.layer.cornerRadius = 8
        editButton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        view.addSubview(editButton)
        
        // Layout code here (using Auto Layout or frames)
        
        overrideUserInterfaceStyle = .dark
    }
    
    @objc private func editButtonTapped() {
        presenter?.editProfile()
    }
}

extension UserProfileViewController: UserProfileViewProtocol {
    func displayUserProfile(with user: User) {
        nameLabel.text = user.name
        nicknameLabel.text = user.nickname
        bioLabel.text = user.bio
        tagsLabel.text = user.interests.joined(separator: ", ")
        // Load avatar image
        avatarImageView.image = UIImage(named: user.avatarImageName) // Assuming avatarImageName is a property in User model
        eventsTableView.reloadData()
    }
}

extension UserProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfUpcomingEvents() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if let event = presenter?.upcomingEvent(at: indexPath.row) {
            cell.textLabel?.text = event.title
        }
        cell.backgroundColor = .spectraSurface
        cell.textLabel?.textColor = .spectraText
        return cell
    }
}