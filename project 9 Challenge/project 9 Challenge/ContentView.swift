//
//  ContentView.swift
//  project 9 Challenge
//
//  Created by Anisha Lamichhane on 5/26/21.
//

import SwiftUI

struct NamedView {
    var name: String
    var view: AnyView

    init<V>(_ name: String, view: V) where V: View {
        self.name = name
        self.view = AnyView(view)
    }
}


struct ContentView: View {
    private let drawings: [NamedView] = [
        NamedView("Challenge 1 & 2", view: Challenge1_2()),
        NamedView("Challenge 3", view: Challenge3())
   ]

    var body: some View {
        NavigationView {
            List(0..<drawings.count) { i in
                NavigationLink(destination: self.drawings[i].view) {
                    Text(self.drawings[i].name)
                }
                .foregroundColor(.green)
                .font(.headline)
            }
            .navigationBarTitle("Drawing")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
