//
//  NavigationDestinationModifier.swift
//  NavigationForDummies
//
//  Created by Alex Nagy on 23.05.2023.
//

import SwiftUI

struct NavigationDestinationModifier<Destination: View>: ViewModifier {
    
    @Binding var isPresented: Bool
    var onDismiss: (() -> Void)?
    @ViewBuilder var destination: () -> Destination
    
    func body(content: Content) -> some View {
        content
            .navigationDestination(isPresented: $isPresented, destination: destination)
            .onChange(of: isPresented) { newValue in
                if !newValue {
                    onDismiss?()
                }
            }
    }
}

