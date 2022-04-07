//
//  NewsModel.swift
//  NewsApp
//
//  Created by Furkan Ayşavkı on 3.04.2022.
//

import Foundation

struct NewsModel: Codable {
    let success: Bool
      let result: [Result]
}
struct Result : Codable {
    let key: String
    let url: String
    let resultDescription: String
    let image: String
    let name, source: String

    enum CodingKeys: String, CodingKey {
        case key, url
        case resultDescription = "description"
        case image, name, source
    }
}

