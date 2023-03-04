//
//  TextField.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/04.
//

import Foundation
import UIKit

extension UITextField : UITextFieldDelegate{
    
    func loginSignUpTextFieldUI(placeHolder: String) {
        self.delegate = self
        
        //왼쪽 여백
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: self.frame.height))
        
        
        let font = UIFont(name: "Arial", size: 18)!
        let fontDescriptor = font.fontDescriptor.withSymbolicTraits(.traitLooseLeading)!
        let boldFont = UIFont(descriptor: fontDescriptor, size: 0)
        let placeholderAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.5416380763, green: 0.5816664696, blue: 0.6238328815, alpha: 1),
                                     NSAttributedString.Key.font: boldFont]
        
        self.attributedPlaceholder = NSAttributedString(string: placeHolder,
                                                        attributes: placeholderAttributes)
        // 테두리 색상 설정
        self.layer.borderColor = #colorLiteral(red: 0.5406107903, green: 0.5818449855, blue: 0.624736011, alpha: 1)
        
        // 테두리 두께 설정
        self.layer.borderWidth = 0.7
        
        self.layer.cornerRadius = 4
        
        self.leftView = leftView
        self.leftViewMode = .always
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        makePlaceHolderGoUp(false)
        textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.1289084852, green: 0.1131337956, blue: 0.1604926884, alpha: 0)])
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        
        let font = UIFont(name: "Arial", size: 18)!
        let fontDescriptor = font.fontDescriptor.withSymbolicTraits(.traitLooseLeading)!
        let boldFont = UIFont(descriptor: fontDescriptor, size: 0)
        let placeholderAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.5416380763, green: 0.5816664696, blue: 0.6238328815, alpha: 1),
                                     NSAttributedString.Key.font: boldFont]
        
        // 텍스트필드가 빈 상태로 리턴될 때
        if textField.text == "" {
            makePlaceHolderGoUp(true)
            self.attributedPlaceholder = NSAttributedString(string: textField.placeholder!,
                                                            attributes: placeholderAttributes)
        }
    }
    
    private func makePlaceHolderGoUp(_ isTextNil: Bool) {
        let label = UILabel()
        // Add label to text field
        self.addSubview(label)
        
        // Set label text
        label.text = self.placeholder
        // Set label font and color
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.white
        // Enable Auto Layout
        label.translatesAutoresizingMaskIntoConstraints = false
        // Align label to the top left corner of text field
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15)
        ])
        
       
            label.removeFromSuperview()
        
        
        print("4. \(label.text)")
    }
}
