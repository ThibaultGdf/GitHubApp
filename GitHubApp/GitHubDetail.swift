//
//  GitHubDetail.swift
//  GitHubApp
//
//  Created by Thibault GODEFROY on 27/09/2022.
//

import SwiftUI

struct GitHubDetail: View {
    @State var githubmodel: GitHubModel = GitHubModel(name: "", avatarUrl: "", followers: 0, following: 0)
    @State var username : String = ""
    var body: some View {
        
        NavigationView{
            VStack{
                Form {
                    
                    HStack {
                        
                            TextField("GitHub Username ", text: $username)
                        
                        Button {
                            
                            getGitHubModel(name: username) { user in
                                self.githubmodel = user
                            }
                            
                        } label: {
                            Text("Search")
                            
                        }
                    }
                    
                    
                        if !githubmodel.name.isEmpty {
                            
                            Section(header: Text("USERNAME")) {
                
                            Text(githubmodel.name)
                                .fontWeight(.semibold)
                        }
                   
                        AsyncImage(url: URL(string: githubmodel.avatarUrl))
                        .frame(width: 400, height: 300)
                        .padding(-20)
                        
                            
                        
                        Section(header: Text("Followers")) {
                            Text(" \(githubmodel.followers)")
                            
                        }
                        Section(header: Text("Following")) {
                            Text("\(githubmodel.following)")
                            
                        
                    }
                } //Form
                }
            }.navigationTitle("GitHub")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct GitHubDetail_Previews: PreviewProvider {
    static var previews: some View {
        GitHubDetail()
    }
}
