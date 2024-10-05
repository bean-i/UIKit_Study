//
//  ViewController.swift
//  TextFieldProject
//
//  Created by 이빈 on 9/5/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        setUp()
    }

    func setUp() {
        view.backgroundColor = UIColor.gray
        
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "이메일 입력"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .next
        
        textField.becomeFirstResponder()
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        textField.resignFirstResponder()
    }
    
    //텍스트필드의 입력을 시작할때 호출 (시작할지 말지를 물어보는 것)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트필드의 입력이 시작되면 호출 (시점)
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
    }
    
    // 텍스트필드 내용을 삭제할 때 호출 (삭제할지 말지를 물어보는 것)
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트필드에 글자내용이 (한글자 한글자) 입력되거나 지워질때 호출 (허용할지 말지를 물어보는 것)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(#function)
        print("텍스트필드의 입력값: \(string)")
        
        //숫자인 경우 허용하지 않고, 5글자 이내로 작성하도록
        
        if Int(string) != nil {
            return false
        } else {
            guard let text = textField.text else { return true }
            return text.count + string.count <= 5
        }
    }
    
    // 텍스트필드의 엔터키가 눌러졌을때 호출 (동작할지 말지 물어보는 것)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        
        // 실제 텍스트필드에 아무것도 입력이 되어 있지 않으면, 입력을 끝내지 못하게
        if textField.text == "" {
            textField.placeholder = "Type Something!"
            return false
        } else {
            return true
        }
    }
    
    // 텍스트필드의 입력이 (실제) 끝났을때 호출 (시점)
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        textField.text = ""
    }
    
    // 화면에 탭을 감지(UIResponder)하는 메서드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

