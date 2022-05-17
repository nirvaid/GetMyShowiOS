//
//  DependencyAssembler.swift
//  GetMyShows
//
//  Created by Nirvaid Rathore on 14/04/22.
//

import Foundation
import UIKit

final class DependencyAssembler {
    static let shared = DependencyAssembler()
    private init() {}
}

extension DependencyAssembler : ShowSearchFactory{
    func makeShowSearchCoordinator(navigationController : UINavigationController,
                                   factory : ShowSearchFactory) -> ShowSearchCoordinator {
        return ShowSearchCoordinator(navigationController: navigationController,
                                     factory: factory)
    }
    
    func makeShowSearchViewModel(coordinator : CoordinatorProtocol, showSearchNetworkService : ShowSearchNetworkService, showSearchDataSource : ShowSearchDataSource ) -> ShowSearchViewModelType {
        return ShowSearchViewModel(coordinator: coordinator, showSearchNetworkService: showSearchNetworkService, showSearchDataSource: showSearchDataSource)
    }
    
    func makeShowSearchViewController(viewModel : ShowSearchViewModelType) -> ShowSearchViewController{
        return ShowSearchViewController(viewModel: viewModel)
    }
}

extension DependencyAssembler : ShowDetailFactory{
    func makeShowDetailCoordinator(navigationController: UINavigationController, factory: ShowDetailFactory, show : Show) -> ShowDetailCoordinator {
        return ShowDetailCoordinator(navigationController: navigationController, factory: factory,show: show)
    }
    
    func makeShowDetailViewModel(coordinator: CoordinatorProtocol) -> ShowDetailViewModelType {
        return ShowDetailViewModel(coordinator: coordinator)
    }
    
    func makeShowDetailViewController(viewModel: ShowDetailViewModelType) -> ShowDetailViewController {
        return ShowDetailViewController(viewModel: viewModel)
    }
    
    
}
