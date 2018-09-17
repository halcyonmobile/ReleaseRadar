//
//  ReleaseRadar.swift
//  ReleaseRadar
//
//  Created by Botond Magyarosi on 17/09/2018.
//

public class ReleaseRadar {

    private let iTunesChecker: ITunesChecker

    public init(iTunesId: String) {
        self.iTunesChecker = ITunesChecker(iTunesId: iTunesId)
    }

    public func verify(completion: @escaping (_ result: CheckingResult) -> Void) {
        iTunesChecker.check { result in
            switch result {
            case .success(let appInfo):
                completion(.updated(appInfo))
            case .failure(_):
                completion(.notUpdated)
            }
        }
    }
}
