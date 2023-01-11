//
//  HTTPRequest.swift
//  PokemonApp
//
//  Created by Diego Costa on 10/01/23.
//

import Foundation
import RxSwift
import RxCocoa

final class HTTPRequest<Model: Codable> {
    private let apiScheme = (Bundle.main.object(forInfoDictionaryKey: "PokemonApiScheme") as? String) ?? ""
    private let apiHost = (Bundle.main.object(forInfoDictionaryKey: "PokemonApiHost") as? String) ?? ""
    private let apiPath = (Bundle.main.object(forInfoDictionaryKey: "PokemonApiPath") as? String) ?? ""
    
    private let requestable: HTTPRequestable
    
    init(_ requestable: HTTPRequestable) {
        self.requestable = requestable
    }
    
    func fetch()-> Observable<Model> {
        guard var request = makeRequest() else {
            return Observable.error(HTTPRequestError.urlMalformed)
        }
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = requestable.headers
        return URLSession.shared.rx.response(request: request)
            .retry(1)
            .map(\.data)
            .decode(type: Model.self, decoder: HTTPRequestDecoder())
            .debug()
            .observe(on: MainScheduler.instance)
        
    }
}

extension HTTPRequest {
    
    private func makeRequest() -> URLRequest? {
        var components = URLComponents()
        components.scheme = apiScheme
        components.host = apiHost
        components.path = apiPath + requestable.path
        components.query = requestable.query
        
        guard let url = components.url else {
            return nil
        }
        return URLRequest(url: url)
    }
}
