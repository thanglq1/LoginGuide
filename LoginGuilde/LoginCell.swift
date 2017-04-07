//
//  LoginCell.swift
//  LoginGuilde
//
//  Created by ThangLQ on 4/6/17.
//  Copyright © 2017 ThangLQ. All rights reserved.
//

import UIKit

class LoginCell: UICollectionViewCell {
    
    var imageView: UIImageView = {
        let image = UIImage(named: "ic_logo")
        let iv = UIImageView(image: image)
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    var textFieldEmail: LeftPaddedTextFiled = {
        let tfEmail = LeftPaddedTextFiled()
        tfEmail.placeholder = "Email"
        tfEmail.layer.borderColor = UIColor.lightGray.cgColor
        tfEmail.layer.borderWidth = 1
        tfEmail.translatesAutoresizingMaskIntoConstraints = false
        tfEmail.keyboardType = .emailAddress
        tfEmail.layer.cornerRadius = 4
        return tfEmail
    }()
    
    var textFieldPassword: LeftPaddedTextFiled = {
        let tfPassword = LeftPaddedTextFiled()
        tfPassword.placeholder = "Password"
        tfPassword.layer.borderWidth = 1
        tfPassword.layer.borderColor = UIColor.lightGray.cgColor
        tfPassword.layer.cornerRadius = 4
        tfPassword.isSecureTextEntry = true
        tfPassword.translatesAutoresizingMaskIntoConstraints = false
        return tfPassword
    }()
   
    lazy var loginButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("Login", for: .normal)
        bt.setTitleColor(.white, for: .normal)
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.backgroundColor = UIColor.orange
        bt.layer.cornerRadius = 4
        bt.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return bt
    }()
    
//    var loginController: ViewController?
    var finishLoginController: FinishViewControllerDelegate?
    
    func handleLogin() {
//        loginController?.finishController()
        finishLoginController?.finishViewController()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("required init coder not implement")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        addSubview(imageView)
        addSubview(textFieldEmail)
        addSubview(textFieldPassword)
        addSubview(loginButton)
        
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -150).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        textFieldEmail.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        textFieldEmail.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        textFieldEmail.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24).isActive = true
        textFieldEmail.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        textFieldPassword.leftAnchor.constraint(equalTo: textFieldEmail.leftAnchor).isActive = true
        textFieldPassword.rightAnchor.constraint(equalTo: textFieldEmail.rightAnchor).isActive = true
        textFieldPassword.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 12).isActive = true
        textFieldPassword.heightAnchor.constraint(equalTo: textFieldEmail.heightAnchor).isActive = true
        
        loginButton.leftAnchor.constraint(equalTo: textFieldEmail.leftAnchor).isActive = true
        loginButton.rightAnchor.constraint(equalTo: textFieldEmail.rightAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 12).isActive = true
        loginButton.heightAnchor.constraint(equalTo: textFieldEmail.heightAnchor).isActive = true
    }
    
    
}

class LeftPaddedTextFiled: UITextField {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width, height: bounds.height)
    }
}
