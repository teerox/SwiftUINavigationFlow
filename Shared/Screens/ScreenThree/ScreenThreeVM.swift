//
//  ScreenThreeVM.swift
//  SwiftUINavigationFlow (iOS)
//
//  Created by Mac on 20/05/2022.
//

import Foundation
import Combine

final class ScreenThreeVM: ObservableObject, Completeable {
    
    @Published var name = ""
    @Published var personalAddress = ""
    
    let didComplete = PassthroughSubject<ScreenThreeVM, Never>()
    let skipRequested = PassthroughSubject<ScreenThreeVM, Never>()
    
    init(name: String? , personalAddress: String?) {
        self.name = name ?? ""
        self.personalAddress = personalAddress ?? ""
    }
    
    var isValid: Bool {
        !name.isEmpty && !personalAddress.isEmpty
    }
    
    func didTapNext() {
        didComplete.send(self)
    }
    
    func didTapSkip() {
        skipRequested.send(self)
    }
}
