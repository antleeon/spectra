import UIKit

class TabBarCoordinator: Coordinator {
    var tabBarController: UITabBarController
    var childCoordinators: [Coordinator] = []

    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
    }

    func start() {
        let homeFeedCoordinator = HomeFeedCoordinator()
        let mapViewCoordinator = MapViewCoordinator()
        let favoritesCoordinator = FavoritesCoordinator()
        let userProfileCoordinator = UserProfileCoordinator()

        childCoordinators.append(homeFeedCoordinator)
        childCoordinators.append(mapViewCoordinator)
        childCoordinators.append(favoritesCoordinator)
        childCoordinators.append(userProfileCoordinator)

        let homeFeedVC = homeFeedCoordinator.start()
        let mapViewVC = mapViewCoordinator.start()
        let favoritesVC = favoritesCoordinator.start()
        let userProfileVC = userProfileCoordinator.start()

        homeFeedVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        mapViewVC.tabBarItem = UITabBarItem(title: "Map", image: UIImage(systemName: "map"), tag: 1)
        favoritesVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "star"), tag: 2)
        userProfileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 3)

        tabBarController.viewControllers = [homeFeedVC, mapViewVC, favoritesVC, userProfileVC]
    }
}