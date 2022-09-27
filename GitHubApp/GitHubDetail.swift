//
//  GitHubDetail.swift
//  GitHubApp
//
//  Created by Thibault GODEFROY on 27/09/2022.
//

import SwiftUI

struct GitHubDetail: View {
    var githubmodel: GitHubModel
    @State var name : String = ""
    var body: some View {
        
        NavigationView{
            VStack{
                Form {
                    Section(header: Text("USERNAME")) {
                        TextField("Enter your name", text: $name)
                    }
                    Section(header: Text("USERNAME")) {
                        
                        
                        Text(githubmodel.name)
                            .fontWeight(.semibold)
                    }
                    
                    Text(githubmodel.avatarUrl)
                        .fontWeight(.semibold)
                    
                    Section(header: Text("Followers")) {
                        Text(" \(githubmodel.followers)")
                        
                    }
                    Section(header: Text("Following")) {
                        Text("\(githubmodel.following)")
                        
                    }
                }
            }.navigationTitle("GitHub")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct GitHubDetail_Previews: PreviewProvider {
    static var previews: some View {
        GitHubDetail(githubmodel: GitHubModel(name: "username", avatarUrl: "Image", followers: 30, following: 20))
    }
}
