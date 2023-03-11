//
//  SetPostViewController.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/09.
//

import UIKit
import FirebaseStorage

class SetPostViewController: UIViewController {
    
    @IBOutlet weak var indicator: IndicatorView!
    @IBOutlet weak var isPostMoreThanOne: UIImageView!
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var contentTextView: UITextView!
    var selectedImage = [UIImage]()
    
    @IBOutlet weak var postImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    func setView() {
        indicator.isHidden = true
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
        
        if contentTextView.text == "" || contentTextView.text == "문구 입력..." {
            let alert = UIAlertController(title: "", message: "문구를 입력하세요.", preferredStyle: UIAlertController.Style.alert)

            let okAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.cancel, handler: nil)
            
            alert.addAction(okAction)
            
            self.present(alert, animated: true)
        } else {
            indicator.startAnimating()
            Storage.storage().uploadPostDownloadURL(postImages: selectedImage) { urlStrings, error in
                if let e = error {
                    print(e.localizedDescription)
                    
                } else {
                    guard let urlArray = urlStrings else { return }
                    
                    PostAPI().uploadPost(urlArray: urlArray, content: self.contentTextView.text, postVC: self)
                }
            }
        }
    }
    
    func didUploadPostSuccess() {
        indicator.stopAnimating()
        self.tabBarController?.selectedIndex = 0
    }
    
    func didUploadPostFailure() {
        indicator.stopAnimating()
        let alert = UIAlertController(title: "공유 실패", message: "공유에 실패하였습니다.\n다시 시도하세요.", preferredStyle: UIAlertController.Style.alert)

        let okAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.cancel, handler: nil)
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true)
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
