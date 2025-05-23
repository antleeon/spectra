import UIKit

class MapViewRouter {
    
    static func createModule() -> MapViewController {
        let view = MapViewController()
        let presenter = MapViewPresenter()
        let interactor = MapViewInteractor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}