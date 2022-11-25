//
//  BodyView.swift
//  SwiftGuthubTutorial
//
//  Created by 江口直輝 on 2022/11/24.
//
import SwiftUI

struct GithubRepositoryItems: Codable {
    let fullName: String
    let htmlUrl: String
    let stargazersCount: String
    let watchersCount: Int
    enum Key: String, CodingKey {
            case fullName = "full_name"
            case htmlUrl = "html_url"
            case stargazersCount = "stargazers_count"
            case watchersCount = "watchers_count"
        }
}

struct User: Decodable {
    let id: Int
    let name: String
}

class githubRepogitory: ObservableObject {
    
    @Published var userData: User?
    
    init() {
        getGithubRepogitory()
    }
    
    func getGithubRepogitory() {
        // サンプルクエリ
        let requestURL = URL(string: "https://api.github.com/users/MasakatsuTagishi")!
        let task = URLSession.shared.dataTask(with: requestURL) { data, response, error in
            // エラーの時
            if let error = error {
                print("error", error)
            }
            // jsonが帰ってきた時
            else if let data = data {
                let decoder = JSONDecoder()
                do
                {
                    let decoded = try decoder.decode(User.self, from: data)
                    print(decoded)
                    DispatchQueue.main.async {
                        self.userData = decoded
                    }
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
    @State var user: User?
    @ObservedObject var repository = githubRepogitory()
    
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
            Text(repository.userData?.name ?? "")
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
        .onAppear(perform:
                    {
            print(repository.userData)
        })
    }
}

struct BodyView_Previews: PreviewProvider {
    static var previews: some View {
        BodyView()
    }
}
Footer
