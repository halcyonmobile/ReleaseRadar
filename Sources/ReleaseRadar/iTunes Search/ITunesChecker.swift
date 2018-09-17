//
//  ITunesChecker.swift
//  ReleaseRadar
//
//  Created by Botond Magyarosi on 13/09/2018.
//

import Foundation

internal class ITunesChecker {

    enum CheckingError: Error {
        case noData, invalidData, networkIssue
    }

    let iTunesId: String

    // MARK: - Lifecycle

    init(iTunesId: String) {
        self.iTunesId = iTunesId
    }

    func check(completion: @escaping (_ result: Result<AppInfo>) -> Void) {
        guard let lookUpURL = URL(string: iTunesSearchAPI + iTunesId) else {
            return
        }

        URLSession.shared.dataTask(with: lookUpURL) { (data, response, error) in
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(SearchResult.self, from: data)
                    if let appInfo = result.results.first {
                        completion(.success(appInfo))
                    } else {
                        completion(.failure(CheckingError.noData))
                    }
                } catch {
                    completion(.failure(CheckingError.invalidData))
                }
            } else if let _ = error {
                completion(.failure(CheckingError.networkIssue))
            } else {
                completion(.failure(CheckingError.noData))
            }
        }.resume()
    }
}
