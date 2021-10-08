//
//  ComicsModel.swift
//  Marvel Comics App
//
//  Created by Kuba Kociucki on 07/10/2021.
//

import Foundation

struct ComicsModel: Codable{
    let data: ComicsData
}

struct ComicsData: Codable{
    let results: [Results]
}

struct Results: Codable{
    let title: String
    let description: String?
    let creators: Creators
    let thumbnail: Thumbnail
}

struct Thumbnail: Codable{
    let path: String
}

struct Creators: Codable{
    let returned: Int
    let items: [Items]
}

struct Items: Codable{
    let name: String
}
