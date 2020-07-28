//
//  ContentView.swift
//  Moonshot
//
//  Created by Uday Pandey on 27/07/2020.
//

import SwiftUI

struct MissionListView: View {
    @StateObject private var store = Store()

    var body: some View {
        NavigationView {
            List(store.missions) { mission in
                NavigationLink(destination: MissionDetailedView(store: store, mission: mission)) {
                    MissionListCellView(mission: mission)
                }
            }
            .navigationTitle("Moonshot")
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static var previews: some View {
        MissionListView()
    }
}


struct MissionListCellView: View {
    let mission: Mission

    var body: some View {
        HStack {
            Image(mission.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)

            VStack(alignment: .leading) {
                Text("\(mission.displayName)")
                Text("\(mission.launchDate ?? "")")
                    .font(.subheadline)

            }
        }
    }
}
