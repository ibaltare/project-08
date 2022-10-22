//
//  NetworkService.swift
//  Practica
//
//  Created by Nicolas on 17/10/22.
//

import Foundation
import Combine
import CryptoKit

final class NetworkService {
    
    static let shared = NetworkService()
    
    private init() {}
    
    
    private func MD5(string: String) -> String {
        let digest = Insecure.MD5.hash(data: string.data(using: .utf8) ?? Data())
        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
    
    
    func getSessionCharacters() -> URLRequest {
        let timestamp = NSDate().timeIntervalSince1970
        let hash = MD5(string: "\(timestamp)\(MarvelApi.PrivateKey)\(MarvelApi.PublicKey)")
        var urlComponents = URLComponents(string: MarvelApi.URLCharacters)!
        urlComponents.queryItems = [
            URLQueryItem(name: "orderBy", value: "name"),
            URLQueryItem(name: "offset", value: "100"),
            URLQueryItem(name: "ts", value: String(timestamp)),
            URLQueryItem(name: "apikey", value: MarvelApi.PublicKey),
            URLQueryItem(name: "hash", value: hash)
        ]
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = HTTPMethod.Get.rawValue
        request.addValue(HTTPMethod.Content.rawValue, forHTTPHeaderField: "Content-type")
        return request
    }
    
    
    func getSessionComics(for character: Int) -> URLRequest {
        let timestamp = NSDate().timeIntervalSince1970
        let hash = MD5(string: "\(timestamp)\(MarvelApi.PrivateKey)\(MarvelApi.PublicKey)")
        var urlComponents = URLComponents(string: MarvelApi.URLCharacters+"/\(character)/comics")!
        urlComponents.queryItems = [
            URLQueryItem(name: "orderBy", value: "focDate"),
            URLQueryItem(name: "format", value: "comic"),
            URLQueryItem(name: "ts", value: String(timestamp)),
            URLQueryItem(name: "apikey", value: MarvelApi.PublicKey),
            URLQueryItem(name: "hash", value: hash)
        ]
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = HTTPMethod.Get.rawValue
        request.addValue(HTTPMethod.Content.rawValue, forHTTPHeaderField: "Content-type")
        return request
    }
    
    //MARK: Combine
    func getData<T: Decodable>(type: T.Type, urlRequest: URLRequest) -> AnyPublisher<T, Error>{
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap{
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else{
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
                    .eraseToAnyPublisher()
    }
    
    //MARK: async await
    func getData<T: Decodable>(type: T.Type, urlRequest: URLRequest) async throws ->T{
        let (data, _) =  try await URLSession.shared.data(for: urlRequest)
        return try JSONDecoder().decode(T.self, from: data)
    }
    
}
