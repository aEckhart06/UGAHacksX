//
//  KeyboardResponder.swift
//  RockstarBandBuilder
//
//  Created by Andrew Eckhart on 2/9/25.
//

import SwiftUI
import Combine

class KeyboardResponder: ObservableObject {
    @Published var currentHeight: CGFloat = 60
    private var cancellable: AnyCancellable?

    init() {
        cancellable = NotificationCenter.default
            .publisher(for: UIResponder.keyboardWillChangeFrameNotification)
            .merge(with: NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification))
            .compactMap { notification -> CGFloat? in
                if let frameEnd = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                    if frameEnd.origin.y >= UIScreen.main.bounds.height {
                        return 0
                    } else {
                        return frameEnd.height
                    }
                }
                return nil
            }
            .assign(to: \.currentHeight, on: self)
    }

    deinit {
        cancellable?.cancel()
    }
}
