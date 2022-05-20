//
//  ScreenThree.swift
//  SwiftUINavigationFlow (iOS)
//
//  Created by Mac on 20/05/2022.
//

import SwiftUI

struct ScreenThree: View {
    
    @StateObject var vm: ScreenThreeVM
    
    var body: some View {
        VStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text("Enter personal details")
                TextField("Name", text: $vm.name)
                    .textFieldStyle(.roundedBorder)
                TextField("Personal Address", text: $vm.personalAddress)
                    .textFieldStyle(.roundedBorder)
            }
            Spacer()
                .frame(height: 12)
            VStack(alignment: .center) {
                Button(action: {
                    self.vm.didTapNext()
                }, label: {
                    Text("Enter Company Info")
                })
                .disabled(!vm.isValid)
                Spacer()
                    .frame(height: 12)
                Button(action: {
                    self.vm.didTapSkip()
                }, label: {
                    Text("Skip")
                })
            }.padding()
        }.padding()
    }
}


struct ScreenThree_Previews: PreviewProvider {
    static var previews: some View {
        ScreenThree(vm: ScreenThreeVM(name: nil, personalAddress: nil))
    }
}
