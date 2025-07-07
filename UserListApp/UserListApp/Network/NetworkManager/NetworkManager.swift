//
//  NetworkManager.swift
//  UserListApp
//
//  Created by Emincan Antalyalı on 7.07.2025.
//

import Foundation

class NetworkManager: NetworkManagerInterface {
    
    private var httpUrlResponse: HTTPURLResponse?
    
    func request<T: Decodable>(_ endpoint: AppRequest, completion: @escaping (Result<T, NetworkErrors>) -> Void) {
        
        guard let req = endpoint.request() else {
            DispatchQueue.main.async {
                completion(.failure(.invalidRequest))
            }
            return
        }
        
        print(endpoint.debugDescription)
        
        let task = URLSession.shared.dataTask(with: req) { data, response, error in
            
            if let error = error {
                print("Hata oluştu: \(error.localizedDescription)")
                completion(.failure(.generalError))
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("HTTP Durum Kodu: \(httpResponse.statusCode)")
                
                switch httpResponse.statusCode {
                case 200...299:
                    break
                case 400...499:
                    completion(.failure(.clientError(code: httpResponse.statusCode)))
                    return
                case 500...599:
                    completion(.failure(.serverError(code: httpResponse.statusCode)))
                    return
                default:
                    completion(.failure(.unexpectedStatusCode(code: httpResponse.statusCode)))
                    return
                }
            } else {
                completion(.failure(.generalError))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            if let responseString = String(data: data, encoding: .utf8) {
                print("Yanıt: \(responseString)")
            }
            
            self.handleResponse(data: data) { response in
                completion(response)
            }
        }
        
        task.resume()
    }
}

extension NetworkManager {
    
    fileprivate func handleResponse<T: Decodable>(data: Data, compeltion: @escaping( (Result<T,NetworkErrors>)-> () ) ) {
        
        do {
            let succesData =  try JSONDecoder().decode(T.self, from: data)
            compeltion(.success(succesData))
        } catch  {
            print(error)
            compeltion(.failure(.parsingError))
        }
        
    }
}
