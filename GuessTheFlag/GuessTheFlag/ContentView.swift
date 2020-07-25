//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Uday Pandey on 25/07/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()

    @State private var selected  = ""
    @State private var showAnswerAlert  = false
    @State private var alertTitle  = ""

    var body: some View {
        NavigationView {
            ZStack {
                Color.gray

                VStack {
                    Text("Tell me the flag for \(selected)")
                        .foregroundColor(.white)

                    VStack(spacing: 50) {
                        ForEach(countries[0..<3], id: \.self) { country in
                            Button(action: {
                                checkAnswer(country: country)
                            }) {
                                Image(country)
                                    .renderingMode(.original)
                                    .clipShape(Capsule())
                            }
                        }

                        Spacer()
                    }
                    .onAppear {
                        self.reset()
                    }
                }
            }
            .alert(isPresented: $showAnswerAlert) {
                Alert(title: Text(alertTitle), message: Text(alertTitle),
                      dismissButton: .cancel(Text("Ok"), action: {
                        self.reset()
                      }))
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationTitle("Guess Flag")
        }
    }

    private func reset() {
        countries.shuffle()
        selected = countries[Int.random(in: 0..<2)]
    }

    private func checkAnswer(country: String) {
        alertTitle = (country == selected) ? "Correct" : "Incorrect"
        showAnswerAlert = true
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
