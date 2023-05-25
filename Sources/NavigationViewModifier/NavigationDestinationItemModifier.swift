//
//  NavigationDestinationItemModifier.swift
//  NavigationForDummies
//
//  Created by Alex Nagy on 23.05.2023.
//

import SwiftUI

struct NavigationDestinationItemModifier<Destination: View, Item: Identifiable & Equatable>: ViewModifier {
    
    @Binding var item: Item?
    var onDismiss: (() -> Void)?
    @ViewBuilder var destination: () -> Destination
    
    @State private var isPresented: Bool = false
    
    func body(content: Content) -> some View {
        content
            .onChange(of: item, perform: { newValue in
                isPresented = newValue != nil
            })
            .navigationDestination(isPresented: $isPresented, destination: destination)
            .onChange(of: isPresented) { newValue in
                if !newValue {
                    onDismiss?()
                }
            }
    }
}
