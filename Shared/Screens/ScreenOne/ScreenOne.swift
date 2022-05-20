//
//  ScreenOne.swift
//  SwiftUINavigationFlow (iOS)
//
//  Created by Mac on 20/05/2022.
//

import SwiftUI

struct ScreenOne: View {
    @StateObject var vm: ScreenOneVM
    
    var body: some View {
        VStack(alignment: .center) {
            
            /// Email Field
            VStack(alignment: .leading) {
                Text("Enter Email")
                TextField("Email", text: $vm.userEmail)
                    .textFieldStyle(.roundedBorder)
            }.padding(.vertical,10)
            
            /// Phone Number Field
            VStack(alignment: .leading) {
                Text("Enter Phone")
                TextField("Phone Number", text: $vm.phoneNumber)
                    .textFieldStyle(.roundedBorder)
            }.padding(.vertical,10)
            
            /// Button
            Button(action: {
                self.vm.didTapNextButton()
            }, label: {
                Text("Continue")
                    .font(.body)
                    .fontWeight(.black)
            })
            .disabled(!vm.isValid)
        }.padding()
    }
}


struct ScreenOne_Previews: PreviewProvider {
    static var previews: some View {
        ScreenOne(vm: ScreenOneVM(phoneNumber: nil, userEmail: nil))
    }
}
