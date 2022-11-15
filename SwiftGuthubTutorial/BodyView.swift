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
            List {
                Text("hello")
                Text("hello")
                Text("hello")
                Text("hello")
                Text("hello")
            }
        }
    }
}

struct BodyView_Previews: PreviewProvider {
    static var previews: some View {
        BodyView()
    }
}
