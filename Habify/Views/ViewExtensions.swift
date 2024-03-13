//
//  ViewExtensions.swift
//  Habify
//
//  Created by nezzar dalia on 13/03/2024.
//

import SwiftUI

extension View {
    @ViewBuilder func `if`<Transform: View>(_ condition: Bool, transform: (Self) -> Transform) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
