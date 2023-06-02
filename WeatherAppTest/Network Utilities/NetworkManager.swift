//
//  Network.swift
//  WeatherAppTest
//
//  Created by Brandon Suarez on 6/2/23.
//

import UIKit

// Network Call
class NetworkManager {
    // Single Responsibility Principle -> Every module should have only one responsibility
    let sessionHandler: SessionHandler
    let parserHandler: ParserHandler
    
    init(sessionHandler: SessionHandler = SessionHandler(), parserHandler: ParserHandler = ParserHandler()) {
        self.sessionHandler = sessionHandler
        self.parserHandler = parserHandler
    }
    
    func fetchRequest<T: Codable>(type: T.Type, url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {

        sessionHandler.startURLSession(with: url) { result in
            switch result {
            case .success(let data):
                self.parserHandler.startParsing(type: type ,data: data) { decodedResult in
                    switch decodedResult {
                    case .success(let decodedData):
                        completion(.success(decodedData))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}


class SessionHandler {
    
    func startURLSession(with url: URL, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            completion(.success(data))
            
        }.resume()
    }
}

class ParserHandler {
    
    func startParsing<T: Codable>(type: T.Type, data: Data, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        let response = try? JSONDecoder().decode(type.self, from: data)
        if let response = response {
            return completion(.success(response))
        } else {
            return completion(.failure(.decodingError))
        }
    }
}
