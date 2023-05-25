//
//  NavigationType.swift
//  NavigationForDummies
//
//  Created by Alex Nagy on 23.05.2023.
//

import Foundation

public enum NavigationType {
    case link
    case sheet
    #if !os(macOS)
    case fullScreenCover
    #endif
}
