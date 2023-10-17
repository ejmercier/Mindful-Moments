//
//  FeelingPicker.swift
//  Mindful Moments
//
//  Created by Annie Michel on 10/16/23.
//

import SwiftUI

struct FeelingPicker: View {
    
    var body: some View {
        Grid {
            GridRow {
                Button(action: {
                    print("Button tapped")
                    // Perform the desired action here
                }) {
                    VStack {
                        Image(systemName: "pencil")
                        Text("Happy")
                    }
                }
                Button(action: {
                    print("Button tapped")
                    // Perform the desired action here
                }) {
                    VStack {
                        Image(systemName: "pencil")
                        Text("Happy")
                    }
                }
            }
            GridRow {
                Text("Hello")
            }
        }
    }
}

struct FeelingPicker_Previews: PreviewProvider {
    static var previews: some View {
        FeelingPicker()
    }
}
