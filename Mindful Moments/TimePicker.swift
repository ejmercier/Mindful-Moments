//
//  TimePicker.swift
//  Mindful Moments
//
//  Created by Annie Michel on 10/15/23.
//

import UIKit
import SwiftUI

struct TimePicker: UIViewRepresentable {
    @Binding var countdownInterval: TimeInterval

    func makeUIView(context: Context) -> UIDatePicker {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .countDownTimer
        datePicker.countDownDuration = countdownInterval
        datePicker.minuteInterval = 5
        datePicker.addTarget(context.coordinator, action: #selector(Coordinator.changed(_:)), for: .valueChanged)
        return datePicker
    }

    func updateUIView(_ datePicker: UIDatePicker, context: Context) {
        countdownInterval = datePicker.countDownDuration
    }
    
    func makeCoordinator() -> TimePicker.Coordinator {
        Coordinator(interval: $countdownInterval)
    }

    class Coordinator: NSObject {
        private let interval: Binding<TimeInterval>

        init(interval: Binding<TimeInterval>) {
            self.interval = interval
        }

        @objc func changed(_ sender: UIDatePicker) {
            self.interval.wrappedValue = sender.countDownDuration
        }
    }
}
