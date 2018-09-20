//
//  ReleaseRadar.swift
//  ReleaseRadar
//
//  Created by Botond Magyarosi on 17/09/2018.
//

import Foundation

public class ReleaseRadar {

    private let iTunesChecker: ITunesChecker
    private let bundle: Bundle

    private var lastVersionString: String? {
        get { return UserDefaults.standard.string(forKey: #function) }
        set { UserDefaults.standard.set(newValue, forKey: #function) }
    }

    // MARK: - Lifecycle

    public init(iTunesId: String, bundle: Bundle = .main) {
        self.iTunesChecker = ITunesChecker(iTunesId: iTunesId)
        self.bundle = bundle
    }

    // MARK: - Methods

    public func verify(checkPolicy: CheckPolicy = .patch, completion: @escaping (_ result: CheckingResult) -> Void) {
        guard let lastVersionString = lastVersionString else {
            self.lastVersionString = bundle.version
            completion(.notUpdated)
            return
        }
        guard checkPolicy.isVersionString(bundle.version, largerThan: lastVersionString) else {
            completion(.notUpdated)
            return
        }
        iTunesChecker.check { result in
            switch result {
            case .success(let appInfo):
                self.lastVersionString = self.bundle.version
                completion(.updated(appInfo))
            case .failure(_):
                completion(.notUpdated)
            }
        }
    }
}
