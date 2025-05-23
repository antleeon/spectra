import Foundation

protocol HomeFeedInteractorInput {
    func fetchEvents()
}

protocol HomeFeedInteractorOutput: AnyObject {
    func didFetchEvents(_ events: [Event])
    func didFailToFetchEvents(with error: Error)
}

class HomeFeedInteractor: HomeFeedInteractorInput {
    weak var output: HomeFeedInteractorOutput?
    private let apiClient: APIClient

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    func fetchEvents() {
        apiClient.fetchEvents { [weak self] result in
            switch result {
            case .success(let events):
                self?.output?.didFetchEvents(events)
            case .failure(let error):
                self?.output?.didFailToFetchEvents(with: error)
            }
        }
    }
}