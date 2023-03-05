//
//  CustomTextField.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/04.
//

import Foundation
import UIKit

class CustomTextField: UITextField {
    let label = UILabel()
//    let deleteButton = UIButton()
    let button = UIButton()
    var isUserWantToHide = true
    
    func addUILabelAndButton() {
        self.addSubview(label)
        self.addSubview(button)
        self.delegate = self
        
        // Set label text
        label.text = self.placeholder
        // Set label font and color
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.white
        // Enable Auto Layout
        label.translatesAutoresizingMaskIntoConstraints = false
        // Align label to the top left corner of text field
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15)
        ])
        label.isHidden = true
        
       
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
        
        
        if self.tag == 1 {
            button.isHidden = true
            button.setImage(UIImage(named: "xImage"), for: .normal)
            button.addTarget(self, action: #selector(clearTextField), for: .touchUpInside)
        } else if self.tag == 2 {
            button.isHidden = false
            button.setImage(UIImage(named: "hidePassword"), for: .normal)
            button.addTarget(self, action: #selector(showOrHidePassword), for: .touchUpInside)
        }
    }
    
    @objc func clearTextField() {
        print("clear")
        self.text = ""
        button.isHidden = true
    }
    
    @objc func showOrHidePassword() {
        button.isSelected.toggle()
        self.isSecureTextEntry.toggle()
        
        let imageString = button.isSelected ? "showPassword" : "hidePassword"
        
        button.setImage(UIImage(named: imageString), for: .normal)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        
        if self.text == "" {
            return rect.inset(by: UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 40))
        } else {
            return rect.inset(by: UIEdgeInsets(top: 25, left: 8, bottom: 10, right: 40))
        }
        
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        
        if self.text == "" {
            return rect.inset(by: UIEdgeInsets(top: 18, left: 8, bottom: 10, right: 40))
        } else {
            return rect.inset(by: UIEdgeInsets(top: 25, left: 8, bottom: 10, right: 40))
        }
        
    }
}


extension CustomTextField: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.tag == 1 {
            if textField.text == "" {
                button.isHidden = true
            } else {
                button.isHidden = false
            }
        } else if textField.tag == 2 {
            
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        setBeginEditingUI()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        setEndEditingUI()
    }
    
    private func setBeginEditingUI() {
        label.isHidden = false
        self.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.1289084852, green: 0.1131337956, blue: 0.1604926884, alpha: 0)])
    }
    
    private func setEndEditingUI() {
        let font = UIFont(name: "Arial", size: 18)!
        let fontDescriptor = font.fontDescriptor.withSymbolicTraits(.traitLooseLeading)!
        let boldFont = UIFont(descriptor: fontDescriptor, size: 0)
        let placeholderAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.5416380763, green: 0.5816664696, blue: 0.6238328815, alpha: 1),
                                     NSAttributedString.Key.font: boldFont]
        
        self.layer.borderColor = #colorLiteral(red: 0.5406107903, green: 0.5818449855, blue: 0.624736011, alpha: 1)
        
        if self.text == "" {
            label.isHidden = true
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder!,
                                                            attributes: placeholderAttributes)
        }
    }
}
