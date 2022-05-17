//
//  ShowDetailCoordinator.swift
//  GetMyShows
//
//  Created by user220159 on 4/28/22.
//

import Foundation
import UIKit

final class ShowDetailCoordinator {
    var navigationController : UINavigationController
    var factory : ShowDetailFactory
    var show : Show

    init(navigationController : UINavigationController, factory : ShowDetailFactory,show : Show) {
        self.navigationController = navigationController
        self.factory = factory
        self.show = show
    }
}

extension ShowDetailCoordinator : CoordinatorProtocol {
    func navigateToNextScreen<T:Decodable>(data : T) {
        
    }
    
    func start() {
        var viewModel = self.factory.makeShowDetailViewModel(coordinator: self)
        
        viewModel.show = self.show
        
        let viewController = self.factory.makeShowDetailViewController(viewModel: viewModel)
        
        self.navigationController.pushViewController(viewController, animated:true)
    }
}
