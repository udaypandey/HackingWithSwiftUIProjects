//
//  ContentView.swift
//  WordScramble
//
//  Created by Uday Pandey on 26/07/2020.
//

import SwiftUI

struct ContentView: View {
    let word = "clumsily"

    @State private var answer = ""
    @State private var answers: [String] = ["lily", "slum"]

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter a word", text: $answer, onCommit: {
                    self.answers.append(answer)
                    answer = ""
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.all, 20)


                List {
                    ForEach(answers, id: \.self) { option in
                        Text(option)
                    }
                }
            }
            .navigationTitle(word)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
