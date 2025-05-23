import UIKit

class AddEventViewController: UIViewController {
    
    // MARK: - Properties
    var presenter: AddEventPresenterProtocol?
    
    // UI Elements
    private let titleTextField = UITextField()
    private let typeTextField = UITextField()
    private let photoImageView = UIImageView()
    private let locationTextField = UITextField()
    private let dateTextField = UITextField()
    private let descriptionTextView = UITextView()
    private let publishButton = UIButton()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        view.backgroundColor = .spectraBackground
        title = "Add Event"

        setupTextField(titleTextField, placeholder: "Event Title")
        setupTextField(typeTextField, placeholder: "Event Type")
        setupImageView(photoImageView)
        setupTextField(locationTextField, placeholder: "Location")
        setupTextField(dateTextField, placeholder: "Date")
        setupTextView(descriptionTextView)

        publishButton.setTitle("Publish", for: .normal)
        publishButton.backgroundColor = .spectraAccent
        publishButton.setTitleColor(.spectraText, for: .normal)
        publishButton.layer.cornerRadius = 8
        publishButton.addTarget(self, action: #selector(publishEvent), for: .touchUpInside)

        layoutUI()
        overrideUserInterfaceStyle = .dark
    }
    
    private func setupTextField(_ textField: UITextField, placeholder: String) {
        textField.placeholder = placeholder
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .spectraSurface
        textField.textColor = .spectraText
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor: UIColor.spectraSecondaryText])
        view.addSubview(textField)
    }
    
    private func setupImageView(_ imageView: UIImageView) {
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        view.addSubview(imageView)
    }
    
    private func setupTextView(_ textView: UITextView) {
        textView.backgroundColor = .spectraSurface
        textView.textColor = .spectraText
        textView.layer.borderColor = UIColor.spectraSecondaryText.cgColor
        textView.layer.borderWidth = 1.0
        textView.layer.cornerRadius = 5.0
        view.addSubview(textView)
    }
    
    private func layoutUI() {
        // Layout code for UI elements goes here
        // Use Auto Layout or frame-based layout
    }
    
    // MARK: - Actions
    @objc private func publishEvent() {
        // Call presenter to handle event publishing
        presenter?.publishEvent(title: titleTextField.text,
                                type: typeTextField.text,
                                location: locationTextField.text,
                                date: dateTextField.text,
                                description: descriptionTextView.text)
    }
}

// MARK: - AddEventViewProtocol
extension AddEventViewController: AddEventViewProtocol {
    func showSuccessMessage() {
        // Show success message to user
    }
    
    func showErrorMessage(_ message: String) {
        // Show error message to user
    }
}