//
//  main.swift
//  ReleaseRadar Example
//
//  Created by Botond Magyarosi on 17/09/2018.
//

import Foundation

let releaseRadar = ReleaseRadar(iTunesId: "284910350")
releaseRadar.verify { result in
    print(result)
}

readLine()
