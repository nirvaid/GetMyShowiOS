//
//  Constant.swift
//  GetMyShows
//
//  Created by user220159 on 4/21/22.
//

import Foundation

enum States {
    case Loading
    case Success
    case Failure
}

let BaseUrlString : String = "https://api.tvmaze.com/"
let ShowSearchUrlString : String = "search/shows?q=" // q=SHOW_SEARCH_STRING
