//
//  Bundle+Version.swift
//  ReleaseRadar
//
//  Created by Botond Magyarosi on 18/09/2018.
//

import Foundation

internal extension Bundle {

    var version: String {
        if let releaseVersionNumber = releaseVersionNumber {
            if let buildVersionNumber = buildVersionNumber {
                return "\(releaseVersionNumber).\(buildVersionNumber)"
            }
            return "\(releaseVersionNumber)"
        }
        return "NaN"
    }

    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }

    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}
