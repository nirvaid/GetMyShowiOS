//
//  ShowDetailDisplayModels.swift
//  GetMyShows
//
//  Created by Nirvaid Rathore on 14/04/22.
//

import Foundation

struct DisplayShowDetails : Encodable{
    let descreption : String
    let status : String
    let genere : [String]
    let language : String
    let name : String
    let type : String
    let url : String
}
