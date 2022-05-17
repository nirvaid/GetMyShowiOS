//
//  ShowSearchDisplayModels.swift
//  GetMyShows
//
//  Created by Nirvaid Rathore on 14/04/22.
//

import Foundation

struct DisplayShows : Encodable{
    let name : String
    let url : String
    let genere : [String]
    let language : String
}
