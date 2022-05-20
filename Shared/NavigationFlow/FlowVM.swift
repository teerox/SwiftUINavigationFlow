//
//  FlowVM.swift
//  SwiftUINavigationFlow (iOS)
//
//  Created by Mac on 20/05/2022.
//

import Foundation
import Combine

protocol Completeable {
    var didComplete: PassthroughSubject<Self, Never> { get }
}

class FlowVM: ObservableObject {
    
    // Note the final model is manually "bound" to the view models here.
    // Automatic binding would be possible with combine or even a single VM.
    // However this may not scale well
    // and the views become dependant on something that is external to the view.
    private let model: User
    var subscription = Set<AnyCancellable>()
    
    @Published var navigateTo2: Bool = false
    @Published var navigateTo3: Bool = false
    @Published var navigateTo4: Bool = false
    @Published var navigateToFinalFrom3: Bool = false
    @Published var navigateToFinalFrom4: Bool = false
    
    init() {
        self.model = User()
    }

    func makeScreen1VM() -> ScreenOneVM {
        let vm = ScreenOneVM(phoneNumber: model.phone, userEmail: model.email)
        vm.didComplete
            .sink(receiveValue: didComplete1)
            .store(in: &subscription)
        return vm
    }

    func makeScreen2VM() -> ScreenTwoVM {
        let vm = ScreenTwoVM(phoneNumber: model.phone, userEmail: model.phone)
        vm.didComplete
            .sink(receiveValue: didComplete2)
            .store(in: &subscription)
        return vm
    }

    func makeScreen3VM() -> ScreenThreeVM {
        let vm = ScreenThreeVM(
            name: model.name,
            personalAddress: model.officeEmail
        )
        vm.didComplete
            .sink(receiveValue: didComplete3)
            .store(in: &subscription)
        vm.skipRequested
            .sink(receiveValue: skipRequested)
            .store(in: &subscription)
        return vm
    }

    func makeScreen4VM() -> ScreenFourVM {
        let vm = ScreenFourVM(workEmail: model.officeEmail)
        vm.didComplete
            .sink(receiveValue: didComplete4)
            .store(in: &subscription)
        vm.goToRootRequested
            .sink(receiveValue: goToRootRequested)
            .store(in: &subscription)
        vm.goTo2Requested
            .sink(receiveValue: goTo2Requested)
            .store(in: &subscription)
        vm.goTo3Requested
            .sink(receiveValue: goTo3Requested)
            .store(in: &subscription)
        return vm
    }

    func makeScreen5VM() -> ScreenFiveVM {
        let vm = ScreenFiveVM(name: model.name)
        vm.didComplete
            .sink(receiveValue: didComplete5)
            .store(in: &subscription)
        return vm
    }

    func didComplete1(vm: ScreenOneVM) {
        // Additional logic inc. updating model
        model.email = vm.userEmail
        model.phone = vm.phoneNumber
        navigateTo2 = true
    }

    func didComplete2(vm: ScreenTwoVM) {
        // Additional logic
        navigateTo3 = true
    }

    func didComplete3(vm: ScreenThreeVM) {
        // Additional logic inc. updating model
        updateModel(vm: vm)
        navigateTo4 = true
    }

    func skipRequested(vm: ScreenThreeVM) {
        // Additional logic inc. updating model
        updateModel(vm: vm)
        navigateToFinalFrom3 = true
    }

    func updateModel(vm: ScreenThreeVM) {
        model.name = vm.name
        model.address = vm.personalAddress
    }

    func didComplete4(vm: ScreenFourVM) {
        // Additional logic inc. updating model
        model.officeEmail = vm.workEmail
        navigateToFinalFrom4 = true
    }

    func goToRootRequested(vm: ScreenFourVM) {
        // Additional logic
        navigateTo2 = false
    }

    func goTo2Requested(vm: ScreenFourVM) {
        // Additional logic
        navigateTo3 = false
    }

    func goTo3Requested(vm: ScreenFourVM) {
        // Additional logic
        navigateTo4 = false
    }

    func didComplete5(vm: ScreenFiveVM) {
        // Switch out navigation.  Model now complete.
        print("Complete")
        print(model)
    }
}
