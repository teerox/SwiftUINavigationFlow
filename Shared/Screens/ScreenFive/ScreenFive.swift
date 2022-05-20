//
//  ScreenFive.swift
//  SwiftUINavigationFlow (iOS)
//
//  Created by Mac on 20/05/2022.
//

import SwiftUI

struct ScreenFive: View {
    
    @StateObject var vm: ScreenFiveVM

     var body: some View {
         VStack(alignment: .center) {
             Text("Welcome: \(vm.name)")
             Button(action: { self.vm.didTapNext() }, label: { Text("Next") })
         }.padding()
     }
}

struct ScreenFive_Previews: PreviewProvider {
    static var previews: some View {
        ScreenFive(vm: ScreenFiveVM(name: nil))
    }
}
