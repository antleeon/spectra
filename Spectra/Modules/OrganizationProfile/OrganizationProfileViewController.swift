import UIKit

class OrganizationProfileViewController: UIViewController {
    
    var presenter: OrganizationProfilePresenterProtocol?
    var organization: Organization?
    
    private let avatarImageView = UIImageView()
    private let nameLabel = UILabel()
    private let nicknameLabel = UILabel()
    private let bioLabel = UILabel()
    private let eventsTableView = UITableView()
    private let editButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }
    
    private func setupUI() {
        view.backgroundColor = .spectraBackground
        
        // Setup avatar image view
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.clipsToBounds = true
        view.addSubview(avatarImageView)
        
        // Setup labels
        nameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        nameLabel.textColor = .spectraText
        nicknameLabel.font = UIFont.systemFont(ofSize: 16)
        nicknameLabel.textColor = .spectraAccent
        bioLabel.font = UIFont.systemFont(ofSize: 14)
        bioLabel.textColor = .spectraSecondaryText
        view.addSubview(nameLabel)
        view.addSubview(nicknameLabel)
        view.addSubview(bioLabel)
        
        // Setup events table view
        eventsTableView.delegate = self
        eventsTableView.dataSource = self
        eventsTableView.backgroundColor = .spectraBackground
        view.addSubview(eventsTableView)
        
        // Setup edit button
        editButton.setTitle("Edit", for: .normal)
        editButton.setTitleColor(.spectraAccent, for: .normal)
        editButton.backgroundColor = .spectraSurface
        editButton.layer.cornerRadius = 8
        editButton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        view.addSubview(editButton)
        
        // Layout setup (using frames for simplicity)
        layoutUI()
        
        overrideUserInterfaceStyle = .dark
    }
    
    private func layoutUI() {
        // Layout code for avatarImageView, nameLabel, nicknameLabel, bioLabel, eventsTableView, and editButton
        // This can be replaced with Auto Layout constraints for better responsiveness
    }
    
    @objc private func editButtonTapped() {
        presenter?.editProfile()
    }
}

extension OrganizationProfileViewController: OrganizationProfileViewProtocol {
    func displayOrganizationDetails(organization: Organization) {
        self.organization = organization
        nameLabel.text = organization.name
        nicknameLabel.text = organization.nickname
        bioLabel.text = organization.bio
        // Load avatar image using the avatar URL
    }
}

extension OrganizationProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return organization?.events.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let event = organization?.events[indexPath.row]
        cell.textLabel?.text = event?.title
        cell.backgroundColor = .spectraSurface
        cell.textLabel?.textColor = .spectraText
        return cell
    }
}