//
//  EditTitleBodyView.swift
//  AlarmApp
//
//  Created by Grace couch on 26/03/2025.
//

import SwiftUI

struct EditTitleBodyView: View {
    @Binding var title: String
    @Binding var description: String
    var body: some View {
        VStack(spacing: 40) {
            HStack {
                GrayTextView(text: "name")
                TextField("name", text: $title)
            }
            HStack {
                GrayTextView(text: "description")
                TextField("description", text: $description)
            }
        }
        .padding()
        .multilineTextAlignment(.trailing)
    }
}

#Preview {
    EditTitleBodyView(title: .constant("climbing"), description: .constant("time to climb"))
}
