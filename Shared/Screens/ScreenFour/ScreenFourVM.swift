//
//  ScreenFourVM.swift
//  SwiftUINavigationFlow (iOS)
//
//  Created by Mac on 20/05/2022.
//

import Foundation
import Combine

final class ScreenFourVM: ObservableObject ,Completeable {
    
    @Published var workEmail: String
    
    let didComplete = PassthroughSubject<ScreenFourVM, Never>()
    let goToRootRequested = PassthroughSubject<ScreenFourVM, Never>()
    let goTo2Requested = PassthroughSubject<ScreenFourVM, Never>()
    let goTo3Requested = PassthroughSubject<ScreenFourVM, Never>()
    
    init(workEmail: String?) {
        self.workEmail = workEmail ?? ""
    }
    
    func didTapNext() {
        didComplete.send(self)
    }
    
    func didTapGoBackToRoot() {
        goToRootRequested.send(self)
    }
    
    func didTapGoBack2() {
        goTo2Requested.send(self)
    }
    
    func didTapGoBack3() {
        goTo3Requested.send(self)
    }
}
