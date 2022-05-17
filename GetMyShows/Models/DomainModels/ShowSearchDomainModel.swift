//
//  ShowSearchDomainModel.swift
//  GetMyShows
//
//  Created by Nirvaid Rathore on 14/04/22.
//

import Foundation

import Foundation

struct Shows : Decodable{
    let score : Double
    let show : Show
}

struct Show : Decodable{
    let id : Int
    let url : String
    let name : String
    let type : String
    let language : String
    let genres : [String]
    let status : String
    let runtime : Int?
    let averageRuntime: Int?
    let premiered: String?
    let ended: String?
    let officialSite: String?
    let schedule : Schedule
    let rating : Rating
    let weight : Int
    let network : WebChannel?
    let webChannel : WebChannel?
    let dvdCountry : String?
    let externals : Externals?
    let image : Image?
    let summary : String
    let updated : Int64?
    let _links : Links
}

struct WebChannel: Decodable {
    let id: Int?
    let name: String?
    let country: Country?
    let officialSite: String?
}

struct Country: Decodable {
    let name : String?
    let code : String?
    let timezone : String?
}

struct Externals : Decodable{
    let tvrage: Int?
    let thetvdb: Int?
    let imdb: String?
}

struct Image : Decodable{
    let medium : String?
    let original : String?
}

struct Links : Decodable{
    let `self` : EpisodeHref?
    let previousepisode : EpisodeHref?
}

struct EpisodeHref: Decodable {
    let href : String?
}

struct Schedule: Decodable {
    let time : String
    let days : [String]
}

struct Rating : Decodable {
    let average : Float?
}
