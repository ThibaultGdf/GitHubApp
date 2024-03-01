//
//  GitHubDetail.swift
//  GitHubApp
//
//  Created by Thibault GODEFROY on 27/09/2022.
//

import SwiftUI

// MARK: - GitHubDetail
struct GitHubView: View {
	
	// MARK: Properties
	@StateObject var viewModel = GitHubViewModel()
	@State private var username: String = ""
	
	// MARK: Body
	var body: some View {
		NavigationView {
			VStack {
				Form {
					HStack {
						TextField("GitHub Username", text: $username)
						Button {
							self.viewModel.getGitHub(username: username)
						} label: {
							Text("Search")
						}
					}
					
					if let gitHub = viewModel.userResponse,
					   !gitHub.name.isEmpty {
						Section(header: Text("USERNAME")) {
							Text(gitHub.name)
								.fontWeight(.semibold)
						}
						AsyncImage(url: URL(string: gitHub.avatarUrl))
							.frame(width: 400, height: 300)
							.padding(-20)
						Section(header: Text("Followers")) {
							Text(" \(gitHub.followers)")
						}
						Section(header: Text("Following")) {
							Text("\(gitHub.following)")
							
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
		GitHubView()
	}
}
