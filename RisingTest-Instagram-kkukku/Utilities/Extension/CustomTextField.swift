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
    
    func addUILabel() {
        self.addSubview(label)
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
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15)
        ])
        label.isHidden = true
    }
    
    func makeLabelHidden() {
        label.isHidden = true
    }
    
    func makeLabelShow() {
        label.isHidden = false
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.insetBy(dx: 10, dy: 5) // 텍스트 영역을 좌우로 10pt, 위아래로 5pt 내립니다.
        }

        override func editingRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.insetBy(dx: 10, dy: 5) // 수정 모드일 때 텍스트 영역도 같은 크기로 사용합니다.
        }
    
    func showPlaceHolderAgain() {
        let font = UIFont(name: "Arial", size: 18)!
        let fontDescriptor = font.fontDescriptor.withSymbolicTraits(.traitLooseLeading)!
        let boldFont = UIFont(descriptor: fontDescriptor, size: 0)
        let placeholderAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.5416380763, green: 0.5816664696, blue: 0.6238328815, alpha: 1),
                                     NSAttributedString.Key.font: boldFont]
        
        if self.text == "" {
            makeLabelHidden()
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder!,
                                                            attributes: placeholderAttributes)
        }
    }
//    func makePlaceHolderGoUp(_ isTextNil: Bool) {
//        self.addSubview(label)
//
//        // Set label text
//        label.text = self.placeholder
//        // Set label font and color
//        label.font = UIFont.systemFont(ofSize: 13)
//        label.textColor = UIColor.white
//        // Enable Auto Layout
//        label.translatesAutoresizingMaskIntoConstraints = false
//        // Align label to the top left corner of text field
//        NSLayoutConstraint.activate([
//            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
//            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15)
//        ])
//    }
}

extension CustomTextField: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        makeLabelShow()
        textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.1289084852, green: 0.1131337956, blue: 0.1604926884, alpha: 0)])
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        showPlaceHolderAgain()
    }
}
