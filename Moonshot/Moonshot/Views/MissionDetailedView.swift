//
//  ExpeditionDetailedView.swift
//  Moonshot
//
//  Created by Uday Pandey on 27/07/2020.
//

import SwiftUI

struct MissionDetailedView: View {
    let store: Store
    let mission: Mission

    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)

                VStack {
                    Text(mission.description)
                }
                .padding()


//                List(store.missions) { mission in
//                    Text("Hello world")
//                }
            }
            .navigationBarTitle(mission.displayName, displayMode: .inline)
        }
    }
}

struct MissionDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MissionDetailedView(store: Store(), mission: Store().missions[0])
        }
    }
}
