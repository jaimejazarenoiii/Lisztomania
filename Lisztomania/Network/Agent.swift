//
//  Agent.swift
//  Lisztomania
//
//  Created by Jaime Jazareno III on 1/21/21.
//

import Foundation
import Combine

extension URL {
    init(router: ApiRouter, params: [String: Any]) {
        var components = URLComponents(string: Constants.apiUrl)!
        components.path += router.path
        switch router.method {
        case .get, .delete:
            components.queryItems = params.map {
                URLQueryItem(name: $0.key, value: String(describing: $0.value))
            }
        default:
            break
        }

        self = components.url!
    }
}

extension URLRequest {
    init(router: ApiRouter, params: [String: Any]) {
        let url = URL(router: router, params: params)

        self.init(url: url)

        httpMethod = router.method.value

        addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")

        switch router.method {
        case .post, .put:
            httpBody = try! JSONSerialization.data(withJSONObject: params, options: [])
        default:
            break
        }
    }
}

struct Agent {

    func run<T: Decodable>(_ request: URLRequest,
                           _ decoder: JSONDecoder = JSONDecoder())
    -> AnyPublisher<Response<T>, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap { result -> Response<T> in
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let value = try decoder.decode(T.self, from: result.data)
                return Response(value: value, response: result.response)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

}

struct Response<T> {
    let value: T
    let response: URLResponse
}
