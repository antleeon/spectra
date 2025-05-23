import UIKit

class FavoritesViewController: UIViewController {
    
    var presenter: FavoritesPresenterProtocol?
    
    private var favoritesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }
    
    private func setupUI() {
        view.backgroundColor = .spectraBackground
        title = "Favorites"
        
        favoritesTableView = UITableView()
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
        favoritesTableView.register(FavoriteEventCell.self, forCellReuseIdentifier: "FavoriteEventCell")
        favoritesTableView.backgroundColor = .spectraBackground
        favoritesTableView.separatorColor = .spectraSurface
        
        view.addSubview(favoritesTableView)
        favoritesTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favoritesTableView.topAnchor.constraint(equalTo: view.topAnchor),
            favoritesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            favoritesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            favoritesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        overrideUserInterfaceStyle = .dark
    }
}

extension FavoritesViewController: UITableViewDelegate {
    // Implement UITableViewDelegate methods if needed
}

extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfFavorites() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteEventCell", for: indexPath) as! FavoriteEventCell
        if let event = presenter?.favoriteEvent(at: indexPath.row) {
            cell.configure(with: event)
        }
        cell.backgroundColor = .spectraSurface
        cell.textLabel?.textColor = .spectraText
        return cell
    }
}

class FavoriteEventCell: UITableViewCell {
    // Custom cell implementation
    func configure(with event: Event) {
        // Configure the cell with event data
        self.backgroundColor = .spectraSurface
        self.textLabel?.textColor = .spectraText
    }
}