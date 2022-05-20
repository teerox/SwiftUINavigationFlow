//
//  ScreenTwo.swift
//  SwiftUINavigationFlow (iOS)
//
//  Created by Mac on 20/05/2022.
//

import SwiftUI

struct ScreenTwo: View {
    @StateObject var vm: ScreenTwoVM
    
    var body: some View {
        VStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text("Verification sent to \(vm.userEmail)")
                TextField("Enter Verfication Number", text: $vm.verification)
                    .textFieldStyle(.roundedBorder)
            }
            Button(action: {
                self.vm.didTapNextButton()
            }, label: {
                Text("Continue")
                    .font(.body)
                    .fontWeight(.black)
            })
        }
        .navigationBarHidden(true)
        .padding()
    }
}

struct ScreenTwo_Previews: PreviewProvider {
    static var previews: some View {
        ScreenTwo(vm: ScreenTwoVM(phoneNumber: nil, userEmail: nil))
    }
}
