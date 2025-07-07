//
//  NetworkErrors.swift
//  UserListApp
//
//  Created by Emincan Antalyalı on 7.07.2025.
//

enum NetworkErrors: Error, Equatable {
    case invalidUrl
    case noData
    case invalidRequest
    case generalError
    case parsingError
    case responseError
    case custom(message: String?)
    case emptyResponse
    case clientError(code: Int)
    case serverError(code: Int)
    case unexpectedStatusCode(code: Int)
    // local db errore
    case localDBParseError
    case storageFailure
    
    var errorDescription: String? {
        switch self {
        case .serverError(let code):
            return "serverError" + "HTTP Code: \(code)"
        case .parsingError:
            return "Veri formatında hata oluştu"
        case .emptyResponse:
            return "Sunucudan boş yanıt alındı"
        case .invalidUrl:
            return "invalidUrl"
        case .noData:
            return "noData"
        case .invalidRequest:
            return "invalidRequest"
        case .generalError:
            return "generalError"
        case .responseError:
            return "responseError"
        case .custom(message: let message):
            return message
        case .clientError(code: let code):
            return "clientError" + "HTTP Code: \(code)"
        case .unexpectedStatusCode(code: let code):
            return "unexpectedStatusCode" + "HTTP Code: \(code)"
        case .localDBParseError:
            return "LocalDBParseError"
        case .storageFailure:
            return "StorageFailure"
        }
    }
}
