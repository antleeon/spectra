import UIKit

protocol HomeFeedRouterProtocol {
    func navigateToEventDetails(from view: HomeFeedViewProtocol, event: Event)
    func navigateToUserProfile(from view: HomeFeedViewProtocol, user: User)
    func navigateToMapView(from view: HomeFeedViewProtocol)
}

class HomeFeedRouter: HomeFeedRouterProtocol {
    weak var viewController: HomeFeedViewController?

    func navigateToEventDetails(from view: HomeFeedViewProtocol, event: Event) {
        let eventDetailsVC = EventDetailsViewController()
        eventDetailsVC.event = event
        viewController?.navigationController?.pushViewController(eventDetailsVC, animated: true)
    }

    func navigateToUserProfile(from view: HomeFeedViewProtocol, user: User) {
        let userProfileVC = UserProfileViewController()
        userProfileVC.user = user
        viewController?.navigationController?.pushViewController(userProfileVC, animated: true)
    }

    func navigateToMapView(from view: HomeFeedViewProtocol) {
        let mapViewVC = MapViewController()
        viewController?.navigationController?.pushViewController(mapViewVC, animated: true)
    }
}