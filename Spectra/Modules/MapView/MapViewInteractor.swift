import Foundation

protocol MapViewInteractorProtocol {
    func fetchEvents()
}

class MapViewInteractor: MapViewInteractorProtocol {
    
    var presenter: MapViewPresenterProtocol?
    
    func fetchEvents() {
        // Logic to fetch events from the database or API
        // Once fetched, call presenter to update the view
    }
}