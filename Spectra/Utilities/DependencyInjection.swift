import Foundation
import Swinject

class DependencyInjection {
    static let shared = DependencyInjection()
    private let container = Container()

    private init() {
        setup()
    }

    private func setup() {
        // Register services and view models here
        container.register(APIClient.self) { _ in
            return APIClient()
        }

        container.register(SwiftDataStack.self) { _ in
            return SwiftDataStack()
        }

        // Example for registering a module
        container.register(HomeFeedInteractor.self) { resolver in
            return HomeFeedInteractor(apiClient: resolver.resolve(APIClient.self)!)
        }

        container.register(HomeFeedPresenter.self) { resolver in
            return HomeFeedPresenter(interactor: resolver.resolve(HomeFeedInteractor.self)!)
        }

        // Continue registering other dependencies...
    }

    func resolve<T>(_ serviceType: T.Type) -> T? {
        return container.resolve(serviceType)
    }
}