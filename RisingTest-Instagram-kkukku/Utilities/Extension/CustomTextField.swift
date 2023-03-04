//
//  CustomTextField.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/04.
//

import Foundation
import UIKit

class CustomTextField: UITextField {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.insetBy(dx: 10, dy: 5) // 텍스트 영역을 좌우로 10pt, 위아래로 5pt 내립니다.
        }

        override func editingRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.insetBy(dx: 10, dy: 5) // 수정 모드일 때 텍스트 영역도 같은 크기로 사용합니다.
        }
}
