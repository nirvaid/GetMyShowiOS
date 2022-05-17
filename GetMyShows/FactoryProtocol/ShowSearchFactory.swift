//
//  ShowSearchProtocol.swift
//  GetMyShows
//
//  Created by Nirvaid Rathore on 14/04/22.
//

import Foundation
import UIKit
protocol ShowSearchFactory {
    func makeShowSearchCoordinator(navigationController : UINavigationController,
                                   factory : ShowSearchFactory) -> ShowSearchCoordinator
    func makeShowSearchViewModel(coordinator : CoordinatorProtocol, showSearchNetworkService : ShowSearchNetworkService, showSearchDataSource : ShowSearchDataSource ) -> ShowSearchViewModelType
    func makeShowSearchViewController(viewModel : ShowSearchViewModelType) -> ShowSearchViewController
}
