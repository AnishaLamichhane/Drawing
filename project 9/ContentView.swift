//
//  ContentView.swift
//  project 9
//
//  Created by Anisha Lamichhane on 5/20/21.
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
        NamedView("Creating custom paths with SwiftUI", view: CreatingCustomPath()),
        NamedView("Paths vs shapes in SwiftUI", view: PathVsShape()),
        NamedView("Adding strokeBorder() support with InsettableShape", view: AddingStrokeBorder()),
        NamedView("MetalRendering with drawingGroup()", view: MetalRendering())
   ]

    var body: some View {
        NavigationView {
            ScrollView {
            List(0..<drawings.count) { i in
                NavigationLink(destination: self.drawings[i].view) {
                    Text(self.drawings[i].name)
                }
            }
            }
            .navigationBarTitle("Drawing")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
