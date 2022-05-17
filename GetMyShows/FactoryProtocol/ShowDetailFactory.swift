//
//  ShowDetailsProtocol.swift
//  GetMyShows
//
//  Created by Nirvaid Rathore on 14/04/22.
//

import Foundation
import UIKit

protocol ShowDetailFactory {
    func makeShowDetailCoordinator(navigationController : UINavigationController,factory : ShowDetailFactory,show : Show) -> ShowDetailCoordinator
    func makeShowDetailViewModel(coordinator : CoordinatorProtocol) -> ShowDetailViewModelType
    func makeShowDetailViewController(viewModel : ShowDetailViewModelType) -> ShowDetailViewController
}
