//
//  UserInputModel.swift
//  Mindful Moments
//
//  Created by Cathy Pham on 10/20/23.
//

import Foundation
import SwiftUI
import SwiftData

class UserInputModel: ObservableObject {
    var name: String = ""
    @Published var feeling: String = ""
    @Published var time: TimeInterval = 0
    
    init(name: String, feeling: String, time: TimeInterval) {
        self.name = name
        self.feeling = feeling
        self.time = time
    }
}

//@Observable
//class UserInputModel {
//    var name: String
//    var feeling: String
//    var time: TimeInterval
//    
//    init(name: String, feeling: String, time: TimeInterval) {
//        self.name = name
//        self.feeling = feeling
//        self.time = time
//    }
//}
