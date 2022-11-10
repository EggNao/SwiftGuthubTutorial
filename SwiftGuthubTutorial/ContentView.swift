//
//  ContentView.swift
//  SwiftGuthubTutorial
//
//  Created by 江口直輝 on 2022/11/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Image("github_icon")
                    .resizable()
                    .frame(width: 30, height: 30)
                Text("Github Search")
                    .font(.title)
                Spacer()
            }
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
