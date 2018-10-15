//
//  CheckPolicyTests.swift
//  ReleaseRadarTests
//
//  Created by Botond Magyarosi on 15/10/2018.
//

import XCTest
@testable import ReleaseRadar

class CheckPolicyTests: XCTestCase {

    // MARK: - Major

    func test_checkPolicyMajor_larger_true() {
        checkLarger(version1: "2.0.0", version2: "1.0.0", policy: .major)
        checkLarger(version1: "2", version2: "1.0.0", policy: .major)
    }

    func test_checkPolicyMajor_larger_false() {
        checkNotLarger(version1: "1.0.0", version2: "2.0.0", policy: .major)
        checkNotLarger(version1: "1.0.0", version2: "1.1.0", policy: .major)
        checkNotLarger(version1: "1.1.0", version2: "1.0.0", policy: .major)
    }

    // MARK: - Minor

    func test_checkPolicyMinor_larger_true() {
        checkLarger(version1: "1.1.0", version2: "1.0.0", policy: .minor)
        checkLarger(version1: "2.0.0", version2: "1.0.0", policy: .minor)
    }

    func test_checkPolicyMinor_larger_false() {
        checkNotLarger(version1: "1.1.1", version2: "1.1.0", policy: .minor)
        checkNotLarger(version1: "1.1.0", version2: "1.2.0", policy: .minor)
    }

    // MARK: - Patch

    func test_checkPolicyPatch_larger_true() {
        checkLarger(version1: "1.0.1", version2: "1.0.0", policy: .patch)
        checkLarger(version1: "1.1.0", version2: "1.0.0", policy: .patch)
        checkLarger(version1: "2.0.0", version2: "1.0.0", policy: .patch)
    }

    func test_checkPolicyPatch_larger_false() {
        checkNotLarger(version1: "1.1.1", version2: "1.1.1.0", policy: .patch)
        checkNotLarger(version1: "2.0.0.5", version2: "2.0.0.1", policy: .patch)
    }

    // MARK: - Build

    func test_checkPolicyBuild_larger_true() {
        checkLarger(version1: "1.0.0.1", version2: "1", policy: .build)
    }

    func test_checkPolicyBuild_larger_false() {
        checkNotLarger(version1: "1.0", version2: "1", policy: .build)
        checkNotLarger(version1: "1.2.3.4", version2: "1.2.3.4", policy: .build)
    }

    // MARK: - Private

    private func checkLarger(version1: String, version2: String, policy: CheckPolicy) {
        let result = policy.isVersionString(version1, largerThan: version2)
        XCTAssert(result, "\(version1) should be larger than \(version2) \(policy.asText)")
    }

    private func checkNotLarger(version1: String, version2: String, policy: CheckPolicy) {
        let result = policy.isVersionString(version1, largerThan: version2)
        XCTAssertFalse(result, "\(version1) shouldn't be larger than \(version2) \(policy.asText)")
    }

    static var allTests = [
        ("test_checkPolicyMajor_larger_true", test_checkPolicyMajor_larger_true),
        ("test_checkPolicyMajor_larger_false", test_checkPolicyMajor_larger_false),
        ("test_checkPolicyMinor_larger_true", test_checkPolicyMinor_larger_true),
        ("test_checkPolicyMinor_larger_false", test_checkPolicyMinor_larger_false),
        ("test_checkPolicyPatch_larger_true", test_checkPolicyPatch_larger_true),
        ("test_checkPolicyPatch_larger_false", test_checkPolicyPatch_larger_false),
        ("test_checkPolicyBuild_larger_true", test_checkPolicyBuild_larger_true),
        ("test_checkPolicyBuild_larger_false", test_checkPolicyBuild_larger_false),
    ]
}

private extension CheckPolicy {

    var asText: String {
        switch self {
        case .major: return "major"
        case .minor: return "minor"
        case .patch: return "patch"
        case .build: return "build"
        }
    }
}
