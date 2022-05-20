//
//  SwiftUINavigationFlowTests.swift
//  SwiftUINavigationFlowTests
//
//  Created by Mac on 20/05/2022.
//

import XCTest
@testable import SwiftUINavigationFlow

class SwiftUINavigationFlowTests: XCTestCase {
    
    func test_doesNotNavigate_whenTapNextAndPhoneNumberValid() throws {
        let sut = FlowVM()
        let screen1VM = sut.makeScreen1VM()
        screen1VM.didTapNextButton()
        XCTAssertFalse(sut.navigateTo2)
    }
    
    func test_navigates_whenTapNextAndPhoneNumberValid() throws {
        let sut = FlowVM()
        let screen1VM = sut.makeScreen1VM()
        screen1VM.phoneNumber = "5555555555"
        screen1VM.userEmail = "tee@yamai.com"
        screen1VM.didTapNextButton()
        XCTAssertTrue(sut.navigateTo2)
    }
    
}
