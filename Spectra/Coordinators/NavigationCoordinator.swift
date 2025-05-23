import UIKit

class NavigationCoordinator {
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginViewController = LoginViewController()
        navigationController.setViewControllers([loginViewController], animated: false)
    }
    
    func showHomeFeed() {
        let homeFeedViewController = HomeFeedViewController()
        navigationController.pushViewController(homeFeedViewController, animated: true)
    }
    
    func showEventDetails(for event: Event) {
        let eventDetailsViewController = EventDetailsViewController(event: event)
        navigationController.pushViewController(eventDetailsViewController, animated: true)
    }
    
    func showMapView() {
        let mapViewController = MapViewController()
        navigationController.pushViewController(mapViewController, animated: true)
    }
    
    func showUserProfile(for user: User) {
        let userProfileViewController = UserProfileViewController(user: user)
        navigationController.pushViewController(userProfileViewController, animated: true)
    }
    
    func showOrganizationProfile(for organization: Organization) {
        let organizationProfileViewController = OrganizationProfileViewController(organization: organization)
        navigationController.pushViewController(organizationProfileViewController, animated: true)
    }
    
    func showEditProfile(for user: User) {
        let editProfileViewController = EditProfileViewController(user: user)
        navigationController.pushViewController(editProfileViewController, animated: true)
    }
    
    func showFavorites() {
        let favoritesViewController = FavoritesViewController()
        navigationController.pushViewController(favoritesViewController, animated: true)
    }
    
    func showComments(for event: Event) {
        let commentsViewController = CommentsViewController(event: event)
        navigationController.pushViewController(commentsViewController, animated: true)
    }
    
    func showAddEvent() {
        let addEventViewController = AddEventViewController()
        navigationController.pushViewController(addEventViewController, animated: true)
    }
}