//
//  NetworkRequestable.swift
//
//
//  Created by Wei Guang Heng on 29/6/24.
//

import Foundation

public protocol NetworkRequestable {
    associatedtype ResponseT: Decodable
    
    var url: URL? { get }
    var method: HTTPMethod { get }
    var headers: [HTTPHeader: String]? { get }
    var parameters: Encodable? { get }
}

extension NetworkRequestable {
    func urlRequest() throws -> URLRequest {
        guard let url else {
            throw NetworkError.badURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        if let headers {
            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key.rawValue)
            }
        }
        
        if let parameters {
            switch method {
            case .get:
                var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
                let parameterData = try JSONEncoder().encode(parameters)
                let parameterDictionary = try JSONSerialization.jsonObject(with: parameterData,
                                                                           options: []) as? [String: Any]
                urlComponents?.queryItems = parameterDictionary?.map {
                    URLQueryItem(name: $0.key, value: "\($0.value)")
                }
                request.url = urlComponents?.url
            default:
                do {
                    let jsonData = try JSONEncoder().encode(parameters)
                    request.httpBody = jsonData
                } catch {
                    throw NetworkError.encodingFailed(error)
                }
            }
        }
        return request
    }
    
    func decode(data: Data) throws -> Decodable {
        do {
            return try JSONDecoder().decode(ResponseT.self, from: data)
        } catch let decodingError {
            throw NetworkError.decodingFailed(decodingError)
        }
    }
}

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

public enum HTTPHeader: String {
    case contentType = "Content-Type"
    case authorization = "Authorization"
}

public enum ContentType: String {
    case json = "application/json"
    case xml = "application/xml"
    case formUrlEncoded = "application/x-www-form-urlencoded"
}

public enum NetworkError: Error {
    case badURL
    case requestFailed(Error)
    case invalidResponse
    case dataNotFound
    case decodingFailed(Error)
    case encodingFailed(Error)
    case notFound
    case internalServerError
    case unknownError(statusCode: Int)
}

public struct DecodingError: Error {
    let message: String
}

public struct EmptyResponse: Decodable {
    
}
