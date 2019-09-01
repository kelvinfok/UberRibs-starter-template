//
//  LoggedOutViewController.swift
//  RibsDemo
//
//  Created by Kelvin Fok on 1/9/19.
//  Copyright © 2019 Kelvin Fok. All rights reserved.
//

import RIBs
import RxSwift
import UIKit
import SnapKit

protocol LoggedOutPresentableListener: class {
    func login(name: String, password: String)
}

final class LoggedOutViewController: UIViewController, LoggedOutPresentable, LoggedOutViewControllable {
    
    lazy var userNameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .groupTableViewBackground
        textField.placeholder = "Enter user name"
        textField.keyboardType = UIKeyboardType.alphabet
        textField.autocorrectionType = .no
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .groupTableViewBackground
        textField.placeholder = "Enter password"
        textField.autocorrectionType = .no
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userNameTextField, passwordTextField, loginButton])
        stackView.spacing = 16
        stackView.axis = .vertical
        return stackView
    }()

    weak var listener: LoggedOutPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .red
        
        view.addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.width.equalTo(220)
            make.center.equalTo(view.snp.center)
        }
        
        stackView.arrangedSubviews.forEach { (subViews) in
            subViews.snp.makeConstraints({ (make) in
                make.height.equalTo(40)
            })
        }
    }
    
    @objc func buttonTapped() {
        let name = userNameTextField.text ?? "DefaultUserName"
        let password = passwordTextField.text ?? "Password123"
        listener?.login(name: name, password: password)
    }
    
}
