//
//  ScreenOneVM.swift
//  SwiftUINavigationFlow (iOS)
//
//  Created by Mac on 20/05/2022.
//

import Foundation
import Combine

final class ScreenOneVM: ObservableObject, Completeable {
    
    @Published var userEmail = ""
    @Published var phoneNumber = ""
    
    let didComplete = PassthroughSubject<ScreenOneVM, Never>()
    
    init(phoneNumber: String?, userEmail: String?) {
        self.phoneNumber = phoneNumber ?? ""
        self.userEmail = userEmail ?? ""
    }
    
    var isValid: Bool {
        !phoneNumber.isEmpty && !userEmail.isEmpty
    }
    
    func didTapNextButton() {
        guard isValid else {
            return
        }
        
        didComplete.send(self)
    }
}
