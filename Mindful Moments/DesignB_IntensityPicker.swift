//
//  DesignB_IntensityPicker.swift
//  Mindful Moments
//
//  Created by Annie Michel on 11/27/23.
//

import SwiftUI

struct DesignB_IntensityPicker: View {
    @State private var selectedOption = 0
    let options = ["Mild", "Moderate", "Significant", "Intense"]

    var body: some View {
        Picker("Options", selection: $selectedOption) {
            ForEach(0..<options.count) { index in
                Text(options[index]).tag(index)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }
}

struct DesignB_IntensityPicker_Previews: PreviewProvider {
    static var previews: some View {
        DesignB_IntensityPicker()
    }
}
