//
//  CheckingResult.swift
//  ReleaseRadar
//
//  Created by Botond Magyarosi on 17/09/2018.
//

import Foundation

public enum CheckingResult {
    case notUpdated, updated(_ appInfo: AppInfo)
}
