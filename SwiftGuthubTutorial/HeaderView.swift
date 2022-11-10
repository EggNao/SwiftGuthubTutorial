//
//  HeaderView.swift
//  SwiftGuthubTutorial
//
//  Created by 江口直輝 on 2022/11/10.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Image("github_icon")
                .resizable()
                .frame(width: 30, height: 30)
            Text("Github Search")
                .font(.title)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
