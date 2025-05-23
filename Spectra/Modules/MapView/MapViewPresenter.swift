import Foundation

protocol MapViewPresenterProtocol {
    func viewDidLoad()
}

class MapViewPresenter: MapViewPresenterProtocol {
    
    weak var view: MapViewController?
    var interactor: MapViewInteractorProtocol?
    
    func viewDidLoad() {
        // Fetch events and update the view
        interactor?.fetchEvents()
    }
}