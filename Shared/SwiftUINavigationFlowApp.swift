//
//  SwiftUINavigationFlowApp.swift
//  Shared
//
//  Created by Mac on 20/05/2022.
//

import SwiftUI

@main
struct SwiftUINavigationFlowApp: App {
    var body: some Scene {
        WindowGroup {
            FlowView(vm: FlowVM())
        }
    }
}
