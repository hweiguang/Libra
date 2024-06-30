//
//  NetworkManager.swift
//
//
//  Created by Wei Guang Heng on 29/6/24.
//

import Foundation

public final class NetworkManager {
    public static let shared = NetworkManager()
    private let urlSession: URLSession
    
    private init() {
        self.urlSession = .shared
    }
    
    public func perform(_ request: any NetworkRequestable) async throws -> Decodable {
        if #available(iOS 15.0, *) {
            let urlRequest = try request.urlRequest()
            let (data, response) = try await urlSession.data(for: urlRequest)
            try processResponse(response: response)
            return try request.decode(data: data)
        } else {
            return try await withCheckedThrowingContinuation { continuation in
                perform(request) { result in
                    switch result {
                    case .success(let data):
                        continuation.resume(returning: data)
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
            }
        }
    }
    
    public func downloadFile(from url: URL) async throws -> URL {
        if #available(iOS 15.0, *) {
            let (localURL, response) = try await urlSession.download(from: url)
            try processResponse(response: response)
            return localURL
        } else {
            return try await withCheckedThrowingContinuation { continuation in
                downloadFile(from: url) { result in
                    switch result {
                    case .success(let localURL):
                        continuation.resume(returning: localURL)
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
            }
        }
    }
    
    private func processResponse(response: URLResponse?) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        switch httpResponse.statusCode {
        case 200...299:
            return
        case 404:
            throw NetworkError.notFound
        case 500:
            throw NetworkError.internalServerError
        default:
            throw NetworkError.unknownError(statusCode: httpResponse.statusCode)
        }
    }
}

extension NetworkManager {
    private func perform(_ request: any NetworkRequestable,
                         completion: @escaping (Result<Decodable, NetworkError>) -> Void) {
        do {
            let urlRequest = try request.urlRequest()
            urlSession.dataTask(with: urlRequest) { [weak self] data, response, error in
                if let error {
                    completion(.failure(.requestFailed(error)))
                    return
                }
                
                guard let data else {
                    completion(.failure(.dataNotFound))
                    return
                }
                
                do {
                    try self?.processResponse(response: response)
                    let decodedObject = try request.decode(data: data)
                    completion(.success(decodedObject))
                } catch {
                    completion(.failure(error as? NetworkError ?? .invalidResponse))
                }
            }.resume()
        } catch {
            completion(.failure(error as? NetworkError ?? .invalidResponse))
        }
    }
    
    private func downloadFile(from url: URL, completion: @escaping (Result<URL, NetworkError>) -> Void) {
        urlSession.downloadTask(with: url) { [weak self] localURL, response, error in
            if let error {
                completion(.failure(.requestFailed(error)))
                return
            }
            
            guard let localURL else {
                completion(.failure(.dataNotFound))
                return
            }
            
            do {
                try self?.processResponse(response: response)
                completion(.success(localURL))
            } catch {
                completion(.failure(error as? NetworkError ?? .invalidResponse))
            }
        }.resume()
    }
}
