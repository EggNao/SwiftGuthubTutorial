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
                HeaderView()
                Spacer()
            }
            BodyView()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
