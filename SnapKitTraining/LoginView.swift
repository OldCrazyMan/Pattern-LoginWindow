//
//  LoginView.swift
//  SnapKitTraining
//
//  Created by Тимур Ахметов on 01.04.2022.
//

import UIKit
import SnapKit

class LoginView: UIView {
    
    // MARK: - Properties
    
    let containerViewBGColor = UIColor(red: 167.0/255.0, green: 177.0/255.0, blue: 180.0/255.0, alpha: 1.0)
    
    let innerViewBGColor = UIColor(red: 190.0/255.0, green: 195.0/255, blue: 198.0/255.0, alpha: 1.0)
    
    let containerViewHeight: CGFloat = 192.0
    
    let textfieldHeight: CGFloat = 44.0
    
    let topInnerViewHeight: CGFloat = 24.0
    
    let bottomInnerViewHeight: CGFloat = 36.0
    
    let connectButtonWidth: CGFloat = 120.0
    
    var viewContainer: UIView!
    
    var viewTop: UIView!
    
    var viewBottom: UIView!
    
    var txtEmail: UITextField!
    
    var txtPassword: UITextField!
    
    var btnConnect: UIButton!
    
    var activityIndicator: UIActivityIndicatorView!
    
    var centerYConstraint: Constraint!
    
    var timer: Timer!
    
    var isAnimating = false
    
    // MARK: - Initialization
    
    init() {
        super.init(frame: CGRect.zero)
           
        keyboardFrame()
        setupContainerView()
        setupTitle()
        setupTextFields()
        setupBottomView()
        setupActivityIndicator()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Custom Methods
    
    func setupContainerView() {
        
        viewContainer = UIView()
        viewContainer.backgroundColor = .blue
        viewContainer.layer.cornerRadius = 8.0
        viewContainer.clipsToBounds = true
        
        self.addSubview(viewContainer)
        viewContainer.snp.makeConstraints { make in
            make.left.equalTo(self).offset(40).priority(750)
            make.right.equalTo(self).offset(-40).priority(750)
            
            make.width.lessThanOrEqualTo(500)
            
            make.centerX.equalTo(self)
            //make.centerY.equalTo(self)
            self.centerYConstraint = make.centerY.equalTo(self).constraint
            
            make.height.equalTo(containerViewHeight)
        }
    }
    
    func setupTitle() {
        
        viewTop = UIView()
        viewTop.backgroundColor = .systemPink
        
        viewContainer.addSubview(viewTop)
        viewTop.snp.makeConstraints { make in
            make.left.equalTo(viewContainer)
            make.right.equalTo(viewContainer)
            make.top.equalTo(viewContainer)
            make.height.equalTo(topInnerViewHeight)
        }
        
        let label = UILabel()
        label.text = "SingUP"
        label.textColor = .white
        label.backgroundColor = .clear
        label.font = UIFont(name: "Futura-Bold", size: 17.0)
        
        viewTop.addSubview(label)
        label.snp.makeConstraints { make in
            make.edges.equalTo(viewTop).inset(UIEdgeInsets(top: 0.0, left: 16.0, bottom: 0.0, right: 0.0))
        }
    }
    
    func setupTextFields() {
        
        txtEmail = UITextField()
        txtEmail.delegate = self
        txtEmail.placeholder = "Enter email"
        txtEmail.borderStyle = .none
        txtEmail.backgroundColor = .white
        txtEmail.keyboardType = .emailAddress
        txtEmail.returnKeyType = .next
        txtEmail.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: txtEmail.frame.height))
        txtEmail.leftViewMode = .always
        txtEmail.clearButtonMode = .always
        txtEmail.autocapitalizationType = .none
        
        viewContainer.addSubview(txtEmail)
        txtEmail.snp.makeConstraints { make in
            make.top.equalTo(viewTop.snp.bottom).offset(16)
            make.left.equalTo(viewContainer).offset(8)
            make.right.equalTo(viewContainer).offset(-8)
            make.height.equalTo(textfieldHeight)
        }
        
        txtPassword = UITextField()
        txtPassword.delegate = self
        txtPassword.placeholder = "Enter password"
        txtPassword.borderStyle = .none
        txtPassword.backgroundColor = .white
        txtPassword.returnKeyType = .done
        txtPassword.isSecureTextEntry = true
        txtPassword.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: txtPassword.frame.height))
        txtPassword.leftViewMode = .always
        txtPassword.clearButtonMode = .always
        
        viewContainer.addSubview(txtPassword)
        txtPassword.snp.makeConstraints { make in
            make.top.equalTo(txtEmail.snp.bottom).offset(16)
            make.left.equalTo(txtEmail)
            make.right.equalTo(txtEmail)
            make.height.equalTo(textfieldHeight)
        }
    }
    
    func setupBottomView() {
        
        viewBottom = UIView()
        viewBottom.backgroundColor = .darkGray
        
        viewContainer.addSubview(viewBottom)
        viewBottom.snp.makeConstraints { make in
            make.left.equalTo(viewContainer)
            make.right.equalTo(viewContainer)
            make.bottom.equalTo(viewContainer)
            make.height.equalTo(bottomInnerViewHeight)
        }
        
        btnConnect = UIButton(type: .custom)
        btnConnect.setTitle("Connect", for: .normal)
        btnConnect.setTitleColor(UIColor.white, for: .normal)
        btnConnect.setTitleColor(UIColor.lightGray, for: .highlighted)
        btnConnect.backgroundColor = .systemRed
        btnConnect.titleLabel?.font = UIFont(name: "Futura", size: 15.0)
        btnConnect.addTarget(self, action: #selector(connect), for: .touchUpInside)
        
        viewBottom.addSubview(btnConnect)
        btnConnect.snp.makeConstraints { make in
            make.top.equalTo(viewBottom)
            make.right.equalTo(viewBottom)
            make.bottom.equalTo(viewBottom)
            make.width.equalTo(connectButtonWidth)
        }
    }
    
    func setupActivityIndicator() {
        
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = UIColor.white
        activityIndicator.startAnimating()
        
        viewContainer.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { make in
            make.centerX.equalTo(viewContainer)
            make.centerY.equalTo(viewContainer).offset(-containerViewHeight/2 - 20)
            make.width.equalTo(40)
            make.height.equalTo(self.activityIndicator.snp.width)
        }
    }
    
    @objc func connect() {
        
//        if isAnimating {
//            return
//        }
        
        txtEmail.snp.remakeConstraints { (make) in
            make.top.equalTo(viewTop.snp.bottom).offset(16)
            make.left.equalTo(viewContainer.snp.right)
            make.width.equalTo(txtEmail.snp.width)
            make.height.equalTo(textfieldHeight)
        }
        
        txtPassword.snp.remakeConstraints { (make) in
            make.right.equalTo(viewContainer.snp.left)
            make.top.equalTo(txtEmail.snp.bottom).offset(8.0)
            make.width.equalTo(txtPassword.snp.width)
            make.height.equalTo(textfieldHeight)
        }
        
        btnConnect.isEnabled = false
        btnConnect.setTitleColor(UIColor.lightGray, for: .normal)
        
        activityIndicator.snp.updateConstraints { (make) in
            make.centerY.equalTo(viewContainer)
        }
        
        self.setNeedsLayout()
        
        UIView.animate(withDuration: 0.5, animations: {
            self.layoutIfNeeded()
        }) { (finished) in
            if finished {
                self.timer = Timer.scheduledTimer(timeInterval: 3.0,
                                                  target: self,
                                                  selector: #selector(self.revertLoginView),
                                                  userInfo: nil,
                                                  repeats: false)
            }
        }
        
        isAnimating = true
    }
    
    @objc func revertLoginView() {
        
        txtEmail.snp.remakeConstraints { (make) in
            make.top.equalTo(viewTop.snp.bottom).offset(16)
            make.left.equalTo(viewContainer).offset(8)
            make.right.equalTo(viewContainer).offset(-8)
            make.height.equalTo(textfieldHeight)
        }
        
        txtPassword.snp.remakeConstraints { (make) in
            make.top.equalTo(txtEmail.snp.bottom).offset(8.0)
            make.left.equalTo(txtEmail)
            make.right.equalTo(txtEmail)
            make.height.equalTo(textfieldHeight)
        }
        
        btnConnect.isEnabled = true
        btnConnect.setTitleColor(UIColor.white, for: .normal)
        btnConnect.setTitleColor(UIColor.lightGray, for: .highlighted)
        
        activityIndicator.snp.updateConstraints { (make) in
            make.centerY.equalTo(viewContainer).offset(-containerViewHeight/2 - 20)
        }
        
        self.setNeedsLayout()
        
        UIView.animate(withDuration: 0.5, animations: {
            self.layoutIfNeeded()
        }) { (finished) in
            if finished {
                self.timer.invalidate()
                self.timer = nil
                self.isAnimating = false
            }
        }
    }
    
    @objc func handleKeyboardWillShow(notification: Notification) {
        
        if let userInfo = notification.userInfo as? Dictionary<String, Any> {
            if let keyboardFrameValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                let keyboardFrame = keyboardFrameValue.cgRectValue
                
                let containerViewOriginPlusHeight = viewContainer.frame.origin.y + viewContainer.frame.size.height
                
                if containerViewOriginPlusHeight > keyboardFrameValue.cgRectValue.origin.y {
                    let overlappedSpace = containerViewOriginPlusHeight - keyboardFrame.origin.y
                    
                    centerYConstraint.update(offset: -overlappedSpace)
                    self.setNeedsLayout()
                    
                    UIView.animate(withDuration: 0.4, animations: {
                        self.layoutIfNeeded()
                    })
                }
            }
        }
    }
    
    @objc func handleKeyboardDidHide(notification: Notification) {
        centerYConstraint.update(offset: 0.0)
        self.setNeedsLayout()
        
        UIView.animate(withDuration: 0.4, animations: {
            self.layoutIfNeeded()
        })
    }
    
    func keyboardFrame() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.handleKeyboardWillShow(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.handleKeyboardDidHide(notification:)),
                                               name: UIResponder.keyboardDidHideNotification,
                                               object: nil)
    }
    
}

// MARK: - UITextFieldDelegate

extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtEmail {
            txtPassword.becomeFirstResponder()
        } else {
            txtPassword.resignFirstResponder()
        }
        return true
    }
}
