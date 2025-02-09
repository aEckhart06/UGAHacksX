//
//  Utils.swift
//  RockstarBandBuilder
//
//  Created by Andrew Eckhart on 2/9/25.
//

import Foundation
import SwiftUI

class Utils {
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
