import UIKit

class AppCoordinator: NSObject {
    var window: UIWindow?
    var tabBarCoordinator: TabBarCoordinator?

    init(window: UIWindow?) {
        self.window = window
    }

    func start() {
        tabBarCoordinator = TabBarCoordinator()
        tabBarCoordinator?.start()
        window?.rootViewController = tabBarCoordinator?.tabBarController
        window?.makeKeyAndVisible()
    }
}