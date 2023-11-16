//
//  GitHubViewModel.swift
//  GitHubApp
//
//  Created by Thibault GODEFROY on 16/11/2023.
//

import Foundation

@MainActor

// MARK: - GitHubViewModel

class GitHubViewModel: ObservableObject {
    // MARK: Properties
    
    private let gitHubRepository: GitHubRepository
    // MARK: Initialization
    
    init(gitHubRepository: GitHubRepository) {
        self.gitHubRepository = gitHubRepository
    }
}
