//
//  TextField.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/04.
//

import Foundation
import UIKit

extension UITextField  {
    
    func loginSignUpTextFieldUI(placeHolder: String) {
     
        //왼쪽 여백
//        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: self.frame.height))
        
        let font = UIFont(name: "Arial", size: 18)!
        let fontDescriptor = font.fontDescriptor.withSymbolicTraits(.traitLooseLeading)!
        let boldFont = UIFont(descriptor: fontDescriptor, size: 0)
        let placeholderAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.5416380763, green: 0.5816664696, blue: 0.6238328815, alpha: 1),
                                     NSAttributedString.Key.font: boldFont,
                                     ]
        
        self.attributedPlaceholder = NSAttributedString(string: placeHolder,
                                                        attributes: placeholderAttributes)
        
        // 테두리 색상 설정
        self.layer.borderColor = #colorLiteral(red: 0.5406107903, green: 0.5818449855, blue: 0.624736011, alpha: 1)
        
        // 테두리 두께 설정
        self.layer.borderWidth = 0.7
        
        self.layer.cornerRadius = 4
        
//        self.leftView = leftView
//        self.leftViewMode = .always
    }
}
