//
//  GitHubViewModel.swift
//  GitHubApp
//
//  Created by Thibault GODEFROY on 16/11/2023.
//

import Foundation

// MARK: - GitHubViewModel
class GitHubViewModel: ObservableObject {
	
	// MARK: Properties
	@Published var userResponse: UserResponse?
	
	private let apiManager = APIManager()
	
	/**
	 Permet de récupérer le repository GitHub
	 - Parameters:
	 - username : Pseudo de l'utilisateur GitHub
	 */
	@MainActor
	func getGitHub(username: String) {
		Task {
			do {
				self.userResponse = try await apiManager.fetchData(name: username)
			} catch {
				print("Erreur lors de la récupération des données GitHub: \(error.localizedDescription)")
			}
		}
	}
}
