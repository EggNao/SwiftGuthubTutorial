//
//  PlagroundView.swift
//  SwiftGuthubTutorial
//
//  Created by TanakaHirokazu on 2022/11/15.
//

import SwiftUI

struct PlagroundView: View {
    struct Park: Identifiable, Hashable {
        var id = UUID()
        let name: String
        let place: String
    }

    struct Zoo: Identifiable, Hashable {
        var id = UUID()
        let name: String
        let place: String
    }

    let sampleParks = [
        Park(name: "今泉公園", place: "今泉"),
        Park(name: "中央公園", place: "天神")
    ]
    let sampleZoos = [
        Zoo(name: "今泉公園", place: "今泉"),
        Zoo(name: "中央公園", place: "天神")
    ]

    var body: some View {
        NavigationStack {
            List(sampleParks) { park in
                NavigationLink(park.name, value: park)

            }
            List(sampleZoos) { zoo in
                NavigationLink(zoo.name, value: zoo)

            }
            .navigationDestination(for: Park.self) { park in
                VStack {
                    Text(park.name)
                    Text(park.place)
                }
            }
            .navigationDestination(for: Zoo.self) { park in
                VStack {
                    TextField("zoo", text: .constant("zoo"))
                }
            }
        }
    }
}

struct PlagroundView_Previews: PreviewProvider {
    static var previews: some View {
        PlagroundView()
    }
}
