//
//  AppRequest.swift
//  UserListApp
//
//  Created by Emincan Antalyalı on 7.07.2025.
//

import Foundation

class AppRequest: EndpointProtocol {
    var method: HTTPMethod
    var url: URL? {
        return URL(string: urlString)
    }
    var bodyParameters: [String: Any]?
    var urlString: String
    var header: [String: String]?
    let timeoutInterval: TimeInterval
    var encodedParameters: Data?
    
    init(method: HTTPMethod, url: String, bodyParameters: [String: Any]? = nil, header: [String: String]? = nil, timeoutInterval: TimeInterval = 90) {
        
      
        
        self.method = method
        self.urlString = url
        self.bodyParameters = bodyParameters
        self.header = header
        self.timeoutInterval = timeoutInterval
    }

    func request() -> URLRequest? {
        guard let url = url else {
            print("Error: Invalid URL - \(urlString)")
            return nil
        }

        var urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: timeoutInterval)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headerBuilder(parameters: header)

        if let parameters = encodedParameters {
            urlRequest.httpBody = parameters
        } else if let bodyParameters = bodyParameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: bodyParameters, options: [])
            } catch {
                print("Error: Failed to serialize body parameters - \(error.localizedDescription)")
            }
        }
       
        return urlRequest
    }
}

extension AppRequest {
    private func headerBuilder(parameters: [String: String]?) -> [String: String] {
        return parameters ?? [:]
    }
}

extension AppRequest: CustomDebugStringConvertible {
    public var debugDescription: String {
        let parameters = bodyParameters?.jsonStringRepresentation ?? "No Parameters"
        return """
        NGRequest Debug Info:
        Method: \(method.rawValue)
        URL: \(url?.absoluteString ?? "Invalid URL")
        Parameters: \(parameters)
        Header: \(header ?? [:])
        """
    }
}
