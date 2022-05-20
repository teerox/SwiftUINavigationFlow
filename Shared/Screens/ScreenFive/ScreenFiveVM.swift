//
//  ScreenFiveVM.swift
//  SwiftUINavigationFlow (iOS)
//
//  Created by Mac on 20/05/2022.
//

import Foundation
import Combine

final class ScreenFiveVM: ObservableObject, Completeable {
    
    let name: String

       let didComplete = PassthroughSubject<ScreenFiveVM, Never>()
       
       init(name: String?) {
           self.name = name ?? ""
       }
       
       func didTapNext() {
           //do some network calls etc
           didComplete.send(self)
       }
}
