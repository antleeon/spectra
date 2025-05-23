import UIKit

class EditProfileViewController: UIViewController {
    
    // MARK: - Properties
    var interactor: EditProfileBusinessLogic?
    
    // UI Elements
    private let avatarImageView = UIImageView()
    private let nameTextField = UITextField()
    private let nicknameTextField = UITextField()
    private let bioTextView = UITextView()
    private let interestsTextField = UITextField()
    private let saveButton = UIButton(type: .system)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadUserProfile()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        view.backgroundColor = .spectraBackground
        title = "Edit Profile"

        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.clipsToBounds = true

        nameTextField.placeholder = "Name"
        nameTextField.backgroundColor = .spectraSurface
        nameTextField.textColor = .spectraText
        nameTextField.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [.foregroundColor: UIColor.spectraSecondaryText])

        nicknameTextField.placeholder = "Nickname"
        nicknameTextField.backgroundColor = .spectraSurface
        nicknameTextField.textColor = .spectraText
        nicknameTextField.attributedPlaceholder = NSAttributedString(string: "Nickname", attributes: [.foregroundColor: UIColor.spectraSecondaryText])

        bioTextView.backgroundColor = .spectraSurface
        bioTextView.textColor = .spectraText
        bioTextView.layer.borderColor = UIColor.spectraSecondaryText.cgColor
        bioTextView.layer.borderWidth = 1.0
        bioTextView.layer.cornerRadius = 5.0

        interestsTextField.placeholder = "Interests"
        interestsTextField.backgroundColor = .spectraSurface
        interestsTextField.textColor = .spectraText
        interestsTextField.attributedPlaceholder = NSAttributedString(string: "Interests", attributes: [.foregroundColor: UIColor.spectraSecondaryText])

        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.spectraText, for: .normal)
        saveButton.backgroundColor = .spectraAccent
        saveButton.layer.cornerRadius = 8
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)

        let stackView = UIStackView(arrangedSubviews: [avatarImageView, nameTextField, nicknameTextField, bioTextView, interestsTextField, saveButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        ])

        overrideUserInterfaceStyle = .dark
    }
    
    // MARK: - Load User Profile
    private func loadUserProfile() {
        interactor?.fetchUserProfile()
    }
    
    // MARK: - Save Button Action
    @objc private func saveButtonTapped() {
        let updatedUser = User(name: nameTextField.text ?? "", nickname: nicknameTextField.text ?? "", bio: bioTextView.text, interests: interestsTextField.text?.components(separatedBy: ", ") ?? [])
        interactor?.saveUserProfile(updatedUser)
    }
}

// MARK: - EditProfileDisplayLogic
extension EditProfileViewController: EditProfileDisplayLogic {
    func displayUserProfile(viewModel: UserProfileViewModel) {
        nameTextField.text = viewModel.name
        nicknameTextField.text = viewModel.nickname
        bioTextView.text = viewModel.bio
        interestsTextField.text = viewModel.interests.joined(separator: ", ")
        // Load avatar image if needed
    }
}