//
//  View+Navigation.swift
//  NavigationForDummies
//
//  Created by Alex Nagy on 23.05.2023.
//

import SwiftUI

public extension View {
    
    @ViewBuilder
    func navigation<Destination: View>(_ type: NavigationType,
                                       isPresented: Binding<Bool>,
                                       onDismiss: (() -> Void)? = nil,
                                       destination: @escaping () -> Destination) -> some View {
        switch type {
        case .link:
            self.modifier(NavigationDestinationModifier(isPresented: isPresented, onDismiss: onDismiss, destination: destination))
        case .sheet:
            self.sheet(isPresented: isPresented, onDismiss: onDismiss) {
                NavigationStack {
                    destination()
                }
            }
        #if !os(macOS)
        case .fullScreenCover:
            self.fullScreenCover(isPresented: isPresented, onDismiss: onDismiss) {
                NavigationStack {
                    destination()
                }
            }
        #endif
        }
    }
    
    @ViewBuilder
    func navigation<Destination: View, Item: Equatable & Identifiable>(_ type: NavigationType,
                                                                       item: Binding<Item?>,
                                                                       onDismiss: (() -> Void)? = nil,
                                                                       destination: @escaping () -> Destination) -> some View {
        switch type {
        case .link:
            self.modifier(NavigationDestinationItemModifier(item:item, onDismiss: onDismiss, destination: destination))
        case .sheet:
            self.sheet(item: item, onDismiss: onDismiss) { _ in
                NavigationStack {
                    destination()
                }
            }
        #if !os(macOS)
        case .fullScreenCover:
            self.fullScreenCover(item: item, onDismiss: onDismiss) { _ in
                NavigationStack {
                    destination()
                }
            }
        #endif
        }
    }
}
