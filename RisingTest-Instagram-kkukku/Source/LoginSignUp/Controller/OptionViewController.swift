//
//  OptionViewController.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/06.
//

import UIKit

protocol optionVCDelegate {
    func setProfileImageView(image: UIImage)
    func deleteProfileImageView()
}

class OptionViewController: UIViewController {
    
    @IBOutlet weak var selectView: UIView!
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var deleteView: UIView!
    let imagePickerController = UIImagePickerController()
    var delegate: optionVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickerController.delegate = self
        addGesture()
    }
    
    @IBAction func dismissButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    func addGesture() {
        let selectTapGesture = UITapGestureRecognizer(target: self, action: #selector(selectPhoto(_:)))
        let cameraTapGesture = UITapGestureRecognizer(target: self, action: #selector(takePhoto(_:)))
        let deleteTapGesture = UITapGestureRecognizer(target: self, action: #selector(deletePhoto(_:)))
        selectView.addGestureRecognizer(selectTapGesture)
        cameraView.addGestureRecognizer(cameraTapGesture)
        deleteView.addGestureRecognizer(deleteTapGesture)
    }
    @objc func selectPhoto(_ sender: UITapGestureRecognizer) {
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @objc func takePhoto(_ sender: UITapGestureRecognizer) {
        imagePickerController.sourceType = .camera
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @objc func deletePhoto(_ sender: UITapGestureRecognizer) {
        delegate?.deleteProfileImageView()
        dismiss(animated: true)
    }
    
    func dismissModalView() {
        dismiss(animated: true)
    }
}

extension OptionViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[.originalImage] as? UIImage {
            print(pickedImage)
            delegate?.setProfileImageView(image: pickedImage)
          }
        dismiss(animated: true)
        dismissModalView()
    }
}
