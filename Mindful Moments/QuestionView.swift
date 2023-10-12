//
//  QuestionView.swift
//  Mindful Moments
//
//  Created by Cathy Pham on 10/12/23.
//

import SwiftUI

struct QuestionView: View {
    var name: String
    
    var body: some View {
        Text("Hello \(name)")
        Text("This is the Question Screen")
    }
}

#Preview {
    QuestionView(name: "User")
}
