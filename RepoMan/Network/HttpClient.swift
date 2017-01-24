//
//  HttpClient.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 21/01/17.
//  Copyright © 2017 Anders Ullnæss. All rights reserved.
//

import Foundation

typealias HTTPResult = (Data?, Error?) -> Void

enum HttpError: Error {
    case notFound
    case other
}

class HttpClient {
    func get(url: URL, completion: @escaping HTTPResult) {
        let request = createRequest(url: url, httpMethod: Constants.HttpMethods.get)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            self.handleResponse(data: data, response: response, error: error, completion: completion)
        }

        task.resume()
    }

    private func createRequest(url: URL, httpMethod: String) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.timeoutInterval = 5.0

        return request
    }

    private func handleResponse(data: Data?, response: URLResponse?, error: Error?, completion: HTTPResult) {
        if error != nil {
            completion(nil, HttpError.other)
        } else {
            if let response = response as? HTTPURLResponse {
                switch response.statusCode {
                case 200 ... 299:
                    completion(data, nil)
                case 404:
                    completion(nil, HttpError.notFound)
                default:
                    completion(nil, HttpError.other)
                }
            }
        }
    }
}
