import UIKit

class HomeFeedViewController: UIViewController {
    
    var presenter: HomeFeedPresenterProtocol?
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.viewDidLoad()
    }
    
    private func setupView() {
        view.backgroundColor = .spectraBackground
        title = "Home Feed"
        
        setupTableView()
        setupNavigationBar()
        
        overrideUserInterfaceStyle = .dark
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "EventCell")
        tableView.backgroundColor = .spectraBackground
        tableView.separatorColor = .spectraSurface
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupNavigationBar() {
        let filterButton = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filterTapped))
        filterButton.tintColor = .spectraAccent
        navigationItem.rightBarButtonItem = filterButton
    }
    
    @objc private func filterTapped() {
        // Handle filter action
    }
}

extension HomeFeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfEvents() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath)
        if let event = presenter?.event(at: indexPath.row) {
            cell.textLabel?.text = event.title
        }
        cell.backgroundColor = .spectraSurface
        cell.textLabel?.textColor = .spectraText
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectEvent(at: indexPath.row)
    }
}