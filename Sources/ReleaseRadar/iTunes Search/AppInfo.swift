//
//  AppInfo.swift
//  ReleaseRadar
//
//  Created by Botond Magyarosi on 13/09/2018.
//

import Foundation

public struct AppInfo: Decodable {
    let title: String
    let releaseNotes: String
    let version: String

    enum CodingKeys: String, CodingKey {
        case title = "trackName"
        case releaseNotes
        case version
    }
}
