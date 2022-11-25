//
//  BodyView.swift
//  SwiftGuthubTutorial
//
//  Created by 江口直輝 on 2022/11/10.
//

import SwiftUI

struct Items: Decodable, Hashable, Identifiable {
    let id: Int
    let fullName: String
    let htmlUrl: String
    let stargazersCount: Int
    let language: String
    let forks: Int
}

struct Repository: Decodable {
    let totalCount: Int
    let items: Array<Items>
}

class ViewController: ObservableObject {
    
    @Published var getGithubRepositoryData: Repository?
    
    init() {
        getGithubRepository()
    }
    
    func getGithubRepository() {
        // サンプルクエリ
        let requestURL = URL(string: "https://api.github.com/search/repositories?q=swift")!
        let task = URLSession.shared.dataTask(with: requestURL) { data, response, error in
            // エラーの時
            if let error = error {
                print("error", error)
            }
            // jsonが帰ってきた時
            else if let data = data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do
                {
                    let decoded = try decoder.decode(Repository.self, from: data)
                    DispatchQueue.main.async {
                        self.getGithubRepositoryData = decoded
                    }
                    print(decoded)
                } catch {
                    print("error")
                }
            }
        }
        task.resume()
    }
}


struct BodyView: View {
    @State var searchText = ""
    @State var searchData: Repository?
    @ObservedObject var repository = ViewController()
    
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
                List(searchData?.items ?? []) { item in
                    NavigationLink(item.fullName, value: item)
                }
                .listStyle(PlainListStyle())
                .navigationDestination(for: Items.self) { item in
                    Text(item.fullName)
                }
            }
        }
        .onAppear(perform:
                    {
            searchData = repository.getGithubRepositoryData
            print(searchData)
        })
    }
}

struct BodyView_Previews: PreviewProvider {
    static var previews: some View {
        BodyView()
    }
}
