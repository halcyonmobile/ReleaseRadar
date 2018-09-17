//
//  SearchResult.swift
//  ReleaseRadar
//
//  Created by Botond Magyarosi on 13/09/2018.
//

import Foundation

struct SearchResult: Decodable {
    let count: Int
    let results: [AppInfo]

    enum CodingKeys: String, CodingKey {
        case count = "resultCount"
        case results
    }
}
