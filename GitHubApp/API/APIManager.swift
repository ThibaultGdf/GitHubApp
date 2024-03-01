//
//  APIManager.swift
//  Joke
//
//  Created by Thibault GODEFROY on 28/02/2024.
//

import Foundation

// MARK: - APIManager
class APIManager {
	
	// MARK: Parsing API
	func fetchData<T: Decodable>(name: String) async throws -> T {
		guard let url = URL(string: APIConstants.baseURL + APIConstants.path + name) else {
			throw APIError.invalidPath
		}
		var urlRequest = URLRequest(url: url)
		urlRequest.httpMethod = HTTPMethod.get.rawValue
	
		let (data, response) = try await URLSession.shared.data(for: urlRequest)
		
		guard (response as? HTTPURLResponse)?.statusCode == 200 else {
			throw APIError.decoding
		}
		let decoder = JSONDecoder()
		let decoded = try decoder.decode(T.self, from: data)
		
		return decoded
	}
}
