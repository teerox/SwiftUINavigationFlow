//
//  ScreenTwoVM.swift
//  SwiftUINavigationFlow (iOS)
//
//  Created by Mac on 20/05/2022.
//

import Foundation
import Combine

final class ScreenTwoVM: ObservableObject, Completeable {
    @Published var verification = ""
    var userEmail: String
    var phoneNumber: String
    
    let didComplete = PassthroughSubject<ScreenTwoVM, Never>()
    
    init(phoneNumber: String?, userEmail: String?) {
        self.phoneNumber = phoneNumber ?? ""
        self.userEmail = userEmail ?? ""
    }

    func didTapNextButton() {
        didComplete.send(self)
    }
}
