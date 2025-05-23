import Foundation

protocol HomeFeedPresenterProtocol {
    func viewDidLoad()
    func didSelectEvent(at index: Int)
    func filterEvents(by date: Date?, genre: String?, location: String?)
}

class HomeFeedPresenter: HomeFeedPresenterProtocol {
    weak var view: HomeFeedViewProtocol?
    var interactor: HomeFeedInteractorProtocol?
    var router: HomeFeedRouterProtocol?
    
    func viewDidLoad() {
        interactor?.fetchEvents()
    }
    
    func didSelectEvent(at index: Int) {
        guard let event = interactor?.events[index] else { return }
        router?.navigateToEventDetails(with: event)
    }
    
    func filterEvents(by date: Date?, genre: String?, location: String?) {
        interactor?.filterEvents(by: date, genre: genre, location: location)
    }
}

extension HomeFeedPresenter: HomeFeedInteractorOutputProtocol {
    func didFetchEvents(_ events: [Event]) {
        view?.displayEvents(events)
    }
    
    func didFailToFetchEvents(with error: Error) {
        view?.displayError(error.localizedDescription)
    }
}