//
//  AppDelegateCoordinator.swift
//  GetMyShows
//
//  Created by Nirvaid Rathore on 14/04/22.
//

import Foundation
import UIKit
final class AppCoordinator{
    let navigationController : UINavigationController
    
    init(navController : UINavigationController) {
        self.navigationController = navController
    }
    
}

extension AppCoordinator : CoordinatorProtocol{
    func navigateToNextScreen<T:Decodable>(data : T) {
        
    }
    
    func start() {
        let factory = DependencyAssembler.shared
        
        let searchCoordinator = factory.makeShowSearchCoordinator(navigationController: self.navigationController, factory: factory)
        
        searchCoordinator.start()
        
    }
    
}
