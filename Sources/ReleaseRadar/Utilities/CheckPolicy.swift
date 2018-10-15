//
//  CheckPolicy.swift
//  ReleaseRadar
//
//  Created by Botond Magyarosi on 20/09/2018.
//

import Foundation

/// Release note check policy.
/// Defines which kind of version change should invoke
/// a call for release notes.
/// Semantic Versioning is used: https://semver.org
///
/// - major: Usually contains redesigned or breaking changes.
/// - minor: Usually contains new features.
/// - patch: Usually contains bugfixes.
/// - build: Usefull for app distributed thorugh 3rd parties (like Fabric).
public enum CheckPolicy: Int {
    case major, minor, patch, build
}

extension CheckPolicy: Comparable {

    public static func < (lhs: CheckPolicy, rhs: CheckPolicy) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

extension CheckPolicy {

    typealias VersionString = String

    func isVersionString(_ lhsVersionString: VersionString, largerThan rhsVersionString: VersionString) -> Bool {
        let lhsComponents = lhsVersionString.components(separatedBy: ".").padded(with: "0", upTo: 4)
        let rhsComponents = rhsVersionString.components(separatedBy: ".").padded(with: "0", upTo: 4)

        if self >= CheckPolicy.major, areComponents(lhsComponents, largerThan: rhsComponents, checkPolicy: .major) {
            return true
        }

        if self >= CheckPolicy.minor, areComponents(lhsComponents, largerThan: rhsComponents, checkPolicy: .minor) {
            return true
        }

        if self >= CheckPolicy.patch, areComponents(lhsComponents, largerThan: rhsComponents, checkPolicy: .patch) {
            return true
        }

        if self >= CheckPolicy.build, areComponents(lhsComponents, largerThan: rhsComponents, checkPolicy: .build) {
            return true
        }

        return false
    }

    private func areComponents(_ lhsComponents: [String], largerThan rhsComponents: [String], checkPolicy: CheckPolicy) -> Bool {
        // If the left hand side has less components the the right hand side version can't be bigger.
        guard lhsComponents.count > checkPolicy.rawValue else { return false }
        // If the right hand side has less components the left hand side version is bigger.
        guard rhsComponents.count > checkPolicy.rawValue else { return true }
        return lhsComponents[checkPolicy.rawValue] > rhsComponents[checkPolicy.rawValue]
    }
}

