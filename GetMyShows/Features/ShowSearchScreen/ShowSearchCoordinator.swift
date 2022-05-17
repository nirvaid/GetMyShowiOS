//
//  ShowSearchCoordinator.swift
//  GetMyShows
//
//  Created by Nirvaid Rathore on 14/04/22.
//

import Foundation
import UIKit

final class ShowSearchCoordinator{
    
    var navigationController : UINavigationController
    var factory : ShowSearchFactory
    
    init(navigationController : UINavigationController,
         factory : ShowSearchFactory){
        self.navigationController = navigationController
        self.factory = factory
    }
}

extension ShowSearchCoordinator : CoordinatorProtocol {
    func navigateToNextScreen<T:Decodable>(data : T) {
        let factory = DependencyAssembler.shared
        
        guard let selectedShow = data as? Show else {return}
        
        let detailCoordinator = factory.makeShowDetailCoordinator(navigationController: self.navigationController, factory: factory,show: selectedShow)
        
        detailCoordinator.start()
    }
    
    func start() {
        let viewModel = factory.makeShowSearchViewModel(coordinator: self, showSearchNetworkService: ShowSearchNetworkService(), showSearchDataSource: ShowSearchDataSource())
        
        let viewController = factory.makeShowSearchViewController(viewModel: viewModel)
        
        navigationController.pushViewController(viewController, animated: true)
        
    }
    
}

