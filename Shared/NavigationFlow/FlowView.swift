//
//  FlowView.swift
//  SwiftUINavigationFlow (iOS)
//
//  Created by Mac on 20/05/2022.
//

import SwiftUI

struct FlowView: View {
    
    @StateObject var vm: FlowVM

    // Note the generation of view models here is only done once
    // as long as the view models are referenced as @StateObject and not @ObservedObject
    
    var body: some View {
        NavigationView {
            VStack() {
                ScreenOne(vm: vm.makeScreen1VM())
                
                Flow(next: $vm.navigateTo2) {
                    ScreenTwo(vm: vm.makeScreen2VM())
                    Flow(next: $vm.navigateTo3) {
                        ScreenThree(vm: vm.makeScreen3VM())
                        Flow(next: $vm.navigateTo4) {
                            ScreenFour(vm: vm.makeScreen4VM())
                            Flow(next: $vm.navigateToFinalFrom4) {
                                ScreenFive(vm: vm.makeScreen5VM())
                            }
                        }
                        Flow(next: $vm.navigateToFinalFrom3) {
                            ScreenFive(vm: vm.makeScreen5VM())
                        }
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
        .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}
