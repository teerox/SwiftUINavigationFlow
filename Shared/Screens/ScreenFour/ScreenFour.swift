//
//  ScreenFour.swift
//  SwiftUINavigationFlow (iOS)
//
//  Created by Mac on 20/05/2022.
//

import SwiftUI

struct ScreenFour: View {
    
    @StateObject var vm: ScreenFourVM
    
    var body: some View {
        VStack(alignment: .center) {
            VStack(alignment: .leading) {
            Text("4: Enter Work Details")
            TextField("Work Email", text: $vm.workEmail)
                    .textFieldStyle(.roundedBorder)
            }
            
            Button(action: { self.vm.didTapNext() }, label: { Text("Next") })
            Text("")
            VStack(alignment: .center) {
            Text("Test other navigation")
            Button(action: { self.vm.didTapGoBackToRoot() },
                   label: { Text("Go back to root") }).padding()
            Button(action: { self.vm.didTapGoBack2() },
                   label: { Text("Go back to 2") }).padding()
            Button(action: { self.vm.didTapGoBack3() },
                   label: { Text("Go back to 3") })
            }
        }.padding()
    }
}

struct ScreenFour_Previews: PreviewProvider {
    static var previews: some View {
        ScreenFour(vm: ScreenFourVM(workEmail: nil))
    }
}
