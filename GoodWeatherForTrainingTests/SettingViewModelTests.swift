//
//  SettingViewModelTests.swift
//  GoodWeatherForTrainingTests
//
//  Created by 石川大輔 on 2021/09/04.
//

import XCTest
@testable import GoodWeatherForTraining

class SettingViewModelTests: XCTestCase {
    
    private var settingVM: SettingViewModel!
    
    override func setUp() {
        super.setUp()
        self.settingVM = SettingViewModel()
    }
    
    func test_should_return_correct_display_name_for_fahrenheit() {
        XCTAssertEqual(settingVM.selectedUnit.displayName, "Fahrenheit")
    }

    func test_should_make_sure_that_default_selected_unit_is_fahrenheit(){
        XCTAssertEqual(settingVM.selectedUnit, .fahrenheit)
    }
    
    func test_should_be_able_to_save_user_unit_selection() {
        settingVM.selectedUnit = .celsius
        let userDefaults = UserDefaults.standard
        XCTAssertNotNil(userDefaults.value(forKey: "unit"))
    }
    
    override func tearDown() {
        super.tearDown()

        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "unit")
    }

}
