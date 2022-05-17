//
//  CoordinatorProtocol.swift
//  GetMyShows
//
//  Created by Nirvaid Rathore on 14/04/22.
//

import Foundation
protocol CoordinatorProtocol {
    func start()
    func navigateToNextScreen<T:Decodable>(data : T)
}
