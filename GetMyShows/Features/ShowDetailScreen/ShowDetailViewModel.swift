//
//  ShowDetailViewModel.swift
//  GetMyShows
//
//  Created by user220159 on 4/28/22.
//

import Foundation

protocol ShowDetailViewModelType
{
    var coordinator : CoordinatorProtocol {get}
    var viewControllerDelegate : ShowDetailViewDelegate? {get set}
    var show : Show? {get set}
    func updateShowDetails()
}

final class ShowDetailViewModel : ShowDetailViewModelType{

    var coordinator: CoordinatorProtocol
    
    var viewControllerDelegate: ShowDetailViewDelegate?
    
    var show: Show?
    
    init(coordinator : CoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func updateShowDetails() {
        guard let show = self.show else {return}
        
        let selectedShowDetail = transFormToShowDetails(selectedShow: show)
        viewControllerDelegate?.updateShowDetails(showDetail: selectedShowDetail)
    }
    
    func transFormToShowDetails(selectedShow : Show) -> DisplayShowDetails{
        return DisplayShowDetails(descreption: selectedShow.summary, status: selectedShow.status, genere: selectedShow.genres, language: selectedShow.language, name: selectedShow.name, type: selectedShow.type, url: selectedShow.image?.original ?? "")
    }
}
