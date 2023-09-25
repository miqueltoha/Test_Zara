//
//  ApiCall.swift
//  Test Zara
//
//  Created by Miquel Toha Perera on 20/9/23.
//

import Foundation

final class CharactersList {
    func getCharactersList() async throws -> CharacterModelResponse {
        let endpoint = "https://rickandmortyapi.com/api/character"
        
        guard let url = URL(string: endpoint) else {
            throw ErrorApiCall.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200 else {
            throw ErrorApiCall.invalidResponse
        }
        
        do {
            return try JSONDecoder().decode(CharacterModelResponse.self, from: data)
        } catch {
            throw ErrorApiCall.invalidData
        }
    }
}

enum ErrorApiCall: String, Error {
    case invalidUrl = "URL Format"
    case invalidResponse = "Server response"
    case invalidData = "Incorrect data"
}
