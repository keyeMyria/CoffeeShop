//
//  SignUpView.swift
//  CoffeeShop
//
//  Created by TuanVi Phan on 10/28/17.
//  Copyright © 2017 TuanVi Phan. All rights reserved.
//

import UIKit
import Stevia

class SignUpView: UIView {
    
    // MARK: - create sub views
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect.zero)
        scrollView.isUserInteractionEnabled = true
        scrollView.showsVerticalScrollIndicator = true
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    
    let contentView: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let avatarView: UIImageView = {
        let imgView = UIImageView()
        imgView.isUserInteractionEnabled = true
        imgView.image = UIImage(named: "avatar")
        return imgView
    }()
    
    let userNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "User Name"
        textField.font = UIFont(name: "OpenSans", size: 17)
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.enablesReturnKeyAutomatically = true
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextFieldViewMode.whileEditing;
        return textField
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.font = UIFont(name: "OpenSans", size: 17)
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.enablesReturnKeyAutomatically = true
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextFieldViewMode.whileEditing;
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.font = UIFont(name: "OpenSans", size: 17)
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.enablesReturnKeyAutomatically = true
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextFieldViewMode.whileEditing;
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Confirm Password"
        textField.font = UIFont(name: "OpenSans", size: 17)
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.enablesReturnKeyAutomatically = true
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextFieldViewMode.whileEditing;
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: UIControlState.normal)
        button.titleLabel?.font = UIFont(name: "OpenSans-Semibold", size: 17)
        button.setTitleColor(WHITE, for: UIControlState.normal)
        button.backgroundColor = MYGREEN
        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    convenience init() {
        self.init(frame: CGRect.zero)
        render()
    }
    
    private func render() {
        userNameTextField.addBottomBorder(UIColor.lightGray, width: 2)
        emailTextField.addBottomBorder(UIColor.lightGray, width: 2)
        passwordTextField.addBottomBorder(UIColor.lightGray, width: 2)
        confirmPasswordTextField.addBottomBorder(UIColor.lightGray, width: 2)
        
        sv(
            scrollView.sv(
                contentView.sv(
                    avatarView,
                    userNameTextField,
                    emailTextField,
                    passwordTextField,
                    confirmPasswordTextField,
                    signUpButton
                )
            )
        )
        
        scrollView.fillContainer()
        contentView.fillContainer()
        contentView.height(568)
        equalWidths(scrollView, contentView)
        
        avatarView.width(100).centerHorizontally()
        
        layout(
            70,
            avatarView ~ 100,
            "",
            |-20-userNameTextField-20-| ~ 50,
            5,
            |-20-emailTextField-20-| ~ 50,
            5,
            |-20-passwordTextField-20-| ~ 50,
            5,
            |-20-confirmPasswordTextField-20-| ~ 50,
            50,
            |-20-signUpButton-20-| ~ 50,
            20
        )
        
    }
}