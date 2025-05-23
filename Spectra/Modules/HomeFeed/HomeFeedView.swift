import UIKit

class HomeFeedView: UIView {

    // MARK: - Properties
    private let tableView = UITableView()
    private let filterButton = UIButton(type: .system)
    private let genreFilterButton = UIButton(type: .system)
    private let dateFilterButton = UIButton(type: .system)
    private let locationFilterButton = UIButton(type: .system)

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupConstraints()
    }

    // MARK: - Setup Methods
    private func setupView() {
        backgroundColor = .white
        
        // Configure TableView
        tableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)

        // Configure Filter Buttons
        filterButton.setTitle("Filter", for: .normal)
        genreFilterButton.setTitle("Genre", for: .normal)
        dateFilterButton.setTitle("Date", for: .normal)
        locationFilterButton.setTitle("Location", for: .normal)

        let filterStackView = UIStackView(arrangedSubviews: [filterButton, genreFilterButton, dateFilterButton, locationFilterButton])
        filterStackView.axis = .horizontal
        filterStackView.distribution = .fillEqually
        filterStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(filterStackView)

        // Additional setup for buttons can be done here
    }

    private func setupConstraints() {
        // TableView Constraints
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        // Filter Stack View Constraints
        NSLayoutConstraint.activate([
            filterButton.heightAnchor.constraint(equalToConstant: 44),
            filterButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            filterButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            filterButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}