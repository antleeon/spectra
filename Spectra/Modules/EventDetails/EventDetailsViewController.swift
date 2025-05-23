import UIKit

class EventDetailsViewController: UIViewController {
    
    var event: Event?
    var presenter: EventDetailsPresenterProtocol?
    
    private let titleLabel = UILabel()
    private let dateLabel = UILabel()
    private let locationLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let goingButton = UIButton()
    private let commentsButton = UIButton()
    private let shareButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }
    
    private func setupUI() {
        view.backgroundColor = .spectraBackground
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .spectraText
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.textColor = .spectraSecondaryText
        dateLabel.font = UIFont.systemFont(ofSize: 16)
        
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.textColor = .spectraSecondaryText
        locationLabel.font = UIFont.systemFont(ofSize: 16)
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.textColor = .spectraText
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.numberOfLines = 0
        
        goingButton.translatesAutoresizingMaskIntoConstraints = false
        goingButton.setTitle("Пойду", for: .normal)
        goingButton.setTitleColor(.spectraText, for: .normal)
        goingButton.backgroundColor = .spectraAccent
        goingButton.layer.cornerRadius = 8
        goingButton.addTarget(self, action: #selector(goingButtonTapped), for: .touchUpInside)
        
        commentsButton.translatesAutoresizingMaskIntoConstraints = false
        commentsButton.setTitle("Комментарии", for: .normal)
        commentsButton.setTitleColor(.spectraAccent, for: .normal)
        commentsButton.backgroundColor = .spectraSurface
        commentsButton.layer.cornerRadius = 8
        commentsButton.addTarget(self, action: #selector(commentsButtonTapped), for: .touchUpInside)
        
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.setTitle("Поделиться", for: .normal)
        shareButton.setTitleColor(.spectraAccent, for: .normal)
        shareButton.backgroundColor = .spectraSurface
        shareButton.layer.cornerRadius = 8
        shareButton.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        
        view.addSubview(titleLabel)
        view.addSubview(dateLabel)
        view.addSubview(locationLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(goingButton)
        view.addSubview(commentsButton)
        view.addSubview(shareButton)
        
        // Setup constraints
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            locationLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10),
            locationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            goingButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            goingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            commentsButton.topAnchor.constraint(equalTo: goingButton.bottomAnchor, constant: 10),
            commentsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            shareButton.topAnchor.constraint(equalTo: commentsButton.bottomAnchor, constant: 10),
            shareButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        overrideUserInterfaceStyle = .dark
    }
    
    @objc private func goingButtonTapped() {
        presenter?.didTapGoingButton()
    }
    
    @objc private func commentsButtonTapped() {
        presenter?.didTapCommentsButton()
    }
    
    @objc private func shareButtonTapped() {
        presenter?.didTapShareButton()
    }
}

extension EventDetailsViewController: EventDetailsViewProtocol {
    func displayEventDetails(event: Event) {
        titleLabel.text = event.title
        dateLabel.text = event.date
        locationLabel.text = event.location
        descriptionLabel.text = event.description
    }
}