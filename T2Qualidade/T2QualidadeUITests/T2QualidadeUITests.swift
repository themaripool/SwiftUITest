//
//  T2QualidadeUITests.swift
//  T2QualidadeUITests
//
//  Created by Mariela on 16/05/20.
//  Copyright © 2020 Mariela. All rights reserved.
//

import XCTest

class form_test: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        self.app = XCUIApplication()
        self.app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }


    func test_checkUserTextField(){
        
        let userTextField = self.app.textFields["userTextField"]
        userTextField.tap()
        sleep(2)
        userTextField.typeText("batman")
        
        let username = userTextField.value as? String
        
        guard let testUsername = username, !testUsername.isEmpty else {
            XCTFail("Campo username está vazio")
            return
        }
    
    }
    
    func test_checkPassword(){
        
        let passwordTextField = self.app.textFields["passwordTextField"]
        passwordTextField.tap()
        passwordTextField.typeText("12345678AX")
        
        let password = passwordTextField.value as? String
        guard let testPassword = password, !testPassword.isEmpty else {
            XCTFail("Campo senha está vazio")
            
            return
        }
        if password?.isValidPassword == false || password!.count < 8 || password!.count > 16 {
            XCTFail("Sua senha precisa ter no mínimo 8 dígitos e no máximo 16 dígitos")
        }
        
    }
    
    func test_checkEmailTextField(){
        
        let emailTextField = self.app.textFields["emailTextField"]
        emailTextField.tap()
        sleep(2)
        emailTextField.typeText("batman@hotmail.com\n")
        
        let emailConfirmationTextField = self.app.textFields["emailConfirmationTextField"]
        emailConfirmationTextField.tap()
        emailConfirmationTextField.typeText("batman@hotmail.com\n")
        
        XCTAssertEqual(emailTextField.value as! String, emailConfirmationTextField.value as! String)
  
    }
    
    func test_checkDataNascimento(){
        
        let openPickerNascimento = self.app.buttons["datePickerNascimento"]
        openPickerNascimento.tap()
        let datePickerNascimento = self.app.datePickers["datePickerNascimento"]
        datePickerNascimento.pickerWheels.element(boundBy: 0).adjust(toPickerWheelValue: "December")
        datePickerNascimento.pickerWheels.element(boundBy: 1).adjust(toPickerWheelValue: "1")
        datePickerNascimento.pickerWheels.element(boundBy: 2).adjust(toPickerWheelValue: "1996")
        
        let ano = datePickerNascimento.pickerWheels.element(boundBy: 2).value as! String
        
        XCTAssertLessThanOrEqual(ano, "2002")
    }
    
    func test_checkEmailToggle(){
        
        let emailToggle = self.app/*@START_MENU_TOKEN@*/.switches["receberEmailToggle"]/*[[".cells",".switches[\"Receber notificações via email\\nReceber notificações via email\"]",".switches[\"receberEmailToggle\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        emailToggle.tap()
        
    }
    
    func test_Send(){
        
        let sendFormButton = self.app.buttons["sendFormButton"]
        
        test_checkUserTextField()
        test_checkPassword()
        test_checkEmailTextField()
        test_checkDataNascimento()
        test_checkEmailToggle()
        
        sendFormButton.tap()
        
        if (testRun?.failureCount != 0){
            XCTFail("Algum teste terminou com erro")
        }
        
    }
}

extension String {
    var isValidPassword: Bool {
        return !isEmpty && range(of: "^[A-Za-z0-9]$", options: .regularExpression) == nil
    }
}
