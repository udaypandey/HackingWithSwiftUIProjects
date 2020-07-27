//
//  ContentView.swift
//  iExpense
//
//  Created by Uday Pandey on 27/07/2020.
//

import SwiftUI

struct Expense: Identifiable {
    let id = UUID()
    let name: String
    let category: Category
    let amount: Int

    enum Category: String {
        case personal
        case business
    }
}

struct ExpenseListView: View {
    @State private var expenses: [Expense] = [
        Expense(name: "Food", category: .personal, amount: 234),
        Expense(name: "Food", category: .personal, amount: 123),
        Expense(name: "Travel", category: .personal, amount: 678),
        Expense(name: "Logs", category: .personal, amount: 123),

    ]

    var body: some View {
        NavigationView {
            List(expenses) { expense in
                ExpenseListCellView(expense: expense)
            }
            .navigationTitle("iExpense")
            .toolbar {
                ToolbarItem {
                    Button(action: {

                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

struct ExpenseListCellView: View {
    let expense: Expense

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(expense.name)
                    .font(.body)
                Text(expense.category.rawValue.capitalized)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            Spacer()

            Text("\(expense.amount)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseListView()
    }
}
