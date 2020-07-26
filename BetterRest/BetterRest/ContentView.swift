//
//  ContentView.swift
//  BetterRest
//
//  Created by Uday Pandey on 26/07/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var numberOfHours = 4
    @State private var wakeupTime = Date()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("When do you want to wake up")) {
                    DatePicker("When do you want to wake up", selection: $wakeupTime, displayedComponents: .hourAndMinute)
                        .datePickerStyle(WheelDatePickerStyle())
                        .labelsHidden()
                }


                Section(header: Text("Desired amount of sleep")) {
                    Stepper("\(numberOfHours) Hours", value: $numberOfHours, in: 4...12, step: 2)
                }
            }
            .navigationTitle("Better Rest")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
