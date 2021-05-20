//
//  AddingStrokeBorder.swift
//  project 9
//
//  Created by Anisha Lamichhane on 5/20/21.
//

import SwiftUI

struct AddingStrokeBorder: View {
    var body: some View {
        Circle()
            .strokeBorder(Color.blue, lineWidth: 10)
    }
}

struct AddingStrokeBorder_Previews: PreviewProvider {
    static var previews: some View {
        AddingStrokeBorder()
    }
}
