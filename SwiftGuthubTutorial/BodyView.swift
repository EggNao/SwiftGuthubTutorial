//
//  BodyView.swift
//  SwiftGuthubTutorial
//
//  Created by 江口直輝 on 2022/11/10.
//

import SwiftUI

//func getGithubName(searchText: String) -> Void {
//    var fetchData = "https://api.github.com/search/repositories?q=\(searchText)"
//}


struct BodyView: View {
    @State var searchText = ""
    
    struct GithubName: Identifiable, Hashable {
        var id = UUID()
        let name: String
    }
    
    let sampleNames = [
        GithubName(name: "aaa"),
        GithubName(name: "bbb"),
        GithubName(name: "ccc"),
        GithubName(name: "ddd")
    ]
    
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search ...", text: $searchText)
            }
            .padding()
            .background(Color(.systemGray6))
            .padding()
            // List
            NavigationStack{
                List(sampleNames) { sampleName in
                    NavigationLink(sampleName.name, value: sampleName)
                }
                .navigationDestination(for: GithubName.self) { sampleName in
                    Text(sampleName.name)
                }
            }
        }
    }
}

struct BodyView_Previews: PreviewProvider {
    static var previews: some View {
        BodyView()
    }
}
