//
//  Collection+Padded.swift
//  Example
//
//  Created by Botond Magyarosi on 15/10/2018.
//

import Foundation

extension Array {

    func padded(with element: Element, upTo length: Int) -> [Element] {
        guard count < length else { return self }
        var newArray = self
        for _ in 0..<(length - count) {
            newArray.append(element)
        }
        return newArray
    }
}
