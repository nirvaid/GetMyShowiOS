//
//  ShowSearchViewModel.swift
//  GetMyShows
//
//  Created by Nirvaid Rathore on 14/04/22.
//

import Foundation

protocol ShowSearchViewModelType{
    func searchShows(searchString : String)
    func showSelected(atIndex: IndexPath)
    
    var coordinator : CoordinatorProtocol {get}
    var showSearchNetworkService : ShowSearchNetworkServiceType {get}
    var showSearchDataSource : ShowSearchDataSource {get}
    var viewControllerDelegate : ShowSearchViewDelegate? {get set}
    var Shows : [Shows]? {get set}
}

final class ShowSearchViewModel : ShowSearchViewModelType{
    var Shows: [Shows]?
    var coordinator: CoordinatorProtocol
    var showSearchNetworkService: ShowSearchNetworkServiceType
    var showSearchDataSource: ShowSearchDataSource
    var viewControllerDelegate: ShowSearchViewDelegate?
    
    init(coordinator : CoordinatorProtocol, showSearchNetworkService : ShowSearchNetworkServiceType, showSearchDataSource : ShowSearchDataSource){
        self.coordinator = coordinator
        self.showSearchNetworkService =  showSearchNetworkService
        self.showSearchDataSource = showSearchDataSource
    }
    
    func showSelected(atIndex: IndexPath) {
        self.coordinator.navigateToNextScreen(data: self.Shows?[atIndex.row].show)
    }
    
    func transformToDisplayModels(shows : [Shows]) -> [DisplayShows] {
        var displayShows = [DisplayShows]()
        for show in shows{
            let displayShow = DisplayShows(name: show.show.name, url: show.show.image?.original ?? "",
                                           genere: show.show.genres,language: show.show.language)
            displayShows.append(displayShow)
        }
        return displayShows
    }
    
    func searchShows(searchString: String) {
        showSearchNetworkService.fetchShowListings(searchString: searchString) { [weak self] result in
            switch result{
            case .success(let response):
                self?.Shows = response
                let displayShow = self?.transformToDisplayModels(shows: self?.Shows ?? [])
                self?.showSearchDataSource.displayShows = displayShow ?? []
                self?.viewControllerDelegate?.updateState(states: .Success)
            case .failure(_):
                self?.viewControllerDelegate?.updateState(states: .Failure)
            }
        }
    }

}
