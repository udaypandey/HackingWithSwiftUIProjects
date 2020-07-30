//
//  ContentView.swift
//  CupCakeCorner
//
//  Created by Uday Pandey on 30/07/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var cakeType = 0
    @State private var numberOfCakes = 0

    @State private var specialRequests = false
    @State private var extraFrosting = false
    @State private var extraSprinkles = false

    let cakeTypes = [
        "Vanilla",
        "Strawberry",
        "Choclate",
        "Rainbow"
    ]

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $cakeType) {
                        ForEach(cakeTypes, id: \.self) { cupCake in
                            Text(cupCake)
                        }
                    }

                    Stepper("Number of cakes: \(cakeType)", value: $cakeType)
                }

                Section {
                    Toggle("Any special requests", isOn: $specialRequests.animation())

                    if specialRequests {
                        Toggle("Add extra frostings", isOn: $extraFrosting)

                        Toggle("Add extra sprinkles", isOn: $extraSprinkles)
                    }
                }

                Section {
                    NavigationLink(
                        destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
                        label: {
                            Text("Delivery Details")
                        })
                }

            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
