//
//  ContentView.swift
//  WeSplit
//
//  Created by Uday Pandey on 25/07/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = ""
    @State private var peopleIndex = 0
    @State private var tipIndex = 2

    let tipPercentages = [0, 5, 10, 15, 20, 25]
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $amount)
                        .keyboardType(.decimalPad)

                    Picker("Number Of People", selection: $peopleIndex) {
                        ForEach(2..<10) { count in
                            Text("\(count) people")
                        }
                    }
                }

                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Number Of People", selection: $tipIndex) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Section(header: Text("Total")) {
                    Text("\(totalAmount, specifier: "%.2f")")
                }

                Section(header: Text("Amount To Pay")) {
                    Text("\(dividedAmount, specifier: "%.2f")")
                        .font(.largeTitle)
                }
            }
            .navigationTitle("WeSplit")
        }
    }

    private var totalAmount: Double {
        let amt = Double(amount) ?? 0.0
        let tip = Double(tipPercentages[tipIndex])

        return amt * ( 100 + tip ) / 100.0
    }

    private var dividedAmount: Double {
        totalAmount / Double(peopleIndex + 2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
