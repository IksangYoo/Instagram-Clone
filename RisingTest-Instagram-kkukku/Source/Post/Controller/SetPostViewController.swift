//
//  SetPostViewController.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/09.
//

import UIKit

class SetPostViewController: UIViewController {
    
    @IBOutlet weak var isPostMoreThanOne: UIImageView!
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var contentTextView: UITextView!
    var selectedImage = [UIImage()]
    
    @IBOutlet weak var postImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        print(selectedImage)
    }
    
    func setView() {
        contentTextView.delegate = self
        postImageView.image = selectedImage[0]
        if selectedImage.count > 1 {
            isPostMoreThanOne.isHidden = false
        } else {
            isPostMoreThanOne.isHidden = true
        }
    }
    
    @IBAction func share(_ sender: UIBarButtonItem) {
        // 업로드 api
    }
    
}

extension SetPostViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        menuImage.alpha = 0.5
        if textView.text == "문구 입력..." {
            textView.textColor = .white
            textView.text = ""
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        menuImage.alpha = 1
        if textView.text == "" {
            textView.textColor = .lightGray
            textView.text = "문구 입력..."
        }
    }
}
