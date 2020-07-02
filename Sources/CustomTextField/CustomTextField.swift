//
//  CustomTextField.swift
//  Startuworkers
//
//  Created by Bernardo Silva on 06/11/19.
//  Copyright © 2019 Bernardo Silva. All rights reserved.
//

import UIKit

class CustomTextField: UIView {

    @IBOutlet private var contentView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak private var errorMessageLabel: UILabel!
    @IBOutlet weak private  var tapArea: UIView!
    @IBOutlet private weak var lineView: UIView!
    @IBOutlet weak var arrow: UIImageView!
    
    @IBInspectable var placeholder: String? {
        didSet {
            self.textField.placeholder = self.placeholder
        }
    }
    @IBInspectable var text: String? {
        didSet {
            self.textField.text = self.text
        }
    }
    @IBInspectable var showArrow: Bool = false {
        didSet {
            self.arrow.isHidden = !self.showArrow
        }
    }
    
    @IBOutlet weak var lineHeight: NSLayoutConstraint!
    
    @IBInspectable var isPassword: Bool = false {
        didSet {
            self.textField.isSecureTextEntry = self.isPassword
        }
    }
    
    @IBInspectable var textSize: Int = 14 {
        didSet {
            setFont()
        }
    }
    
    var font: UIFont? {
        didSet {
            setFont()
        }
    }
    
    private func setFont() {
        self.textField.font = self.font?.withSize(CGFloat(self.textSize))
    }
    
    func changeColor(color: UIColor) {
        self.textField.textColor = color
    }
        
    var delegate: UITextFieldDelegate? {
        didSet {
            self.textField.delegate = self.delegate
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("CustomTextField", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        let tap = UITapGestureRecognizer(target: self, action: #selector(focusTextField))
        tapArea.addGestureRecognizer(tap)
        self.font = self.textField.font ?? UIFont.systemFont(ofSize: 14)
        setupTextField()
    }
    
    @objc func focusTextField() {
        self.textField.becomeFirstResponder()
    }
    
    func setupTextField() {
        self.textField.addTarget(self, action: #selector(highlightTextField), for: .editingDidBegin)
        self.textField.addTarget(self, action: #selector(removeHighlightTextField), for: .editingDidEnd)
    }
    
    @objc private func highlightTextField() {
        self.lineHeight.constant = 2
        self.lineView.backgroundColor = UIColor.Default.darkBlue
    }
   
    @objc private func removeHighlightTextField() {
        self.lineHeight.constant = 1
        self.lineView.backgroundColor = UIColor(red: 176/255, green: 176/255, blue: 176/255, alpha: 1)
    }
    
    func showErrorMessage(message: String) {
        self.errorMessageLabel.text = message
        self.errorMessageLabel.isHidden = false
    }

}
