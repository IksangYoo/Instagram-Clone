//
//  PostViewController.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/09.
//

import UIKit
import YPImagePicker

class PostViewController: UIViewController {
    
    var selectedImages : [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showImagePicker()
    }
  
    func showImagePicker() {
        var config = YPImagePickerConfiguration()
        config.library.maxNumberOfItems = 10
        config.albumName = "RisingTest"
        config.startOnScreen = YPPickerScreen.library
        config.isScrollToChangeModesEnabled = true
        config.screens = [.library, .photo, .video]
        
        let picker = YPImagePicker(configuration: config)

        picker.didFinishPicking { [unowned picker] items, cancelled in
            for item in items {
                switch item {
                case .photo(let photo):
                    let image = photo.image
                    self.selectedImages.append(image)
                case .video(let video):
                    print(video)
                }
            }
            
            self.performSegue(withIdentifier: "goToSetPost", sender: nil)
            picker.dismiss(animated: true, completion: nil)
        }
        present(picker, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? SetPostViewController {
            destinationVC.selectedImage = selectedImages
            }
    }
}
