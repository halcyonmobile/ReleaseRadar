//
//  Result.swift
//  ReleaseRadar
//
//  Created by Botond Magyarosi on 17/09/2018.
//

import Foundation

enum Result<Value> {
    case success(Value)
    case failure(Error)
}
