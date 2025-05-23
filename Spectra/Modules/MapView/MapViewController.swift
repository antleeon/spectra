import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var presenter: MapViewPresenterProtocol?
    
    private let mapView: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    private let searchBar: UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.placeholder = "Search events"
        search.barStyle = .black
        search.searchBarStyle = .minimal
        search.backgroundColor = .spectraSurface
        search.barTintColor = .spectraSurface
        search.tintColor = .spectraAccent
        if let textField = search.value(forKey: "searchField") as? UITextField {
            textField.backgroundColor = .spectraSurface
            textField.textColor = .spectraText
            textField.attributedPlaceholder = NSAttributedString(
                string: "Search events",
                attributes: [.foregroundColor: UIColor.spectraSecondaryText]
            )
        }
        return search
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.viewDidLoad()
    }
    
    private func setupView() {
        view.backgroundColor = .spectraBackground
        view.addSubview(mapView)
        view.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            mapView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        title = "Map View"
        let filterButton = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filterEvents))
        filterButton.tintColor = .spectraAccent
        navigationItem.rightBarButtonItem = filterButton
        
        overrideUserInterfaceStyle = .dark
    }
    
    @objc private func filterEvents() {
        // Implement filter functionality
    }
    
    func displayEventsOnMap(events: [Event]) {
        // Logic to display events on the map
    }
}
