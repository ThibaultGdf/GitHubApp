//
//  GitHubDetail.swift
//  GitHubApp
//
//  Created by Thibault GODEFROY on 27/09/2022.
//

import SwiftUI

// MARK: - GitHubDetail
struct GitHubDetail: View {
    // MARK: Properties
    
    @State private var github: GitHub = GitHub(name: "", avatarUrl: "", followers: 0, following: 0)
    @State private var username : String = ""
    
    @StateObject var viewModel = GitHubViewModel(gitHubRepository: GitHubRepository())
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    HStack {
                        TextField("GitHub Username ", text: $username)
                        Button {
                            viewModel.gitHubRepository.getGitHubModel(name: username) { user in
                                self.github = user
                            }
                        } label: {
                            Text("Search")
                        }
                    }
                    if !github.name.isEmpty {
                        Section(header: Text("USERNAME")) {
                            Text(github.name)
                                .fontWeight(.semibold)
                        }
                        AsyncImage(url: URL(string: github.avatarUrl))
                            .frame(width: 400, height: 300)
                            .padding(-20)
                        Section(header: Text("Followers")) {
                            Text(" \(github.followers)")
                        }
                        Section(header: Text("Following")) {
                            Text("\(github.following)")
                        }
                    }
                }
            }
            .navigationTitle("GitHub")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct GitHubDetail_Previews: PreviewProvider {
    static var previews: some View {
        GitHubDetail()
    }
}
