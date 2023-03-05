//
//  BirthdayViewController.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/05.
//

import UIKit

class BirthdayViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var birthTF: CustomTextField!
    let label = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextField()
        setDatePicker()
        
    }
    
    @IBAction func goBack(_ sender: UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    private func setTextField() {
        birthTF.delegate = self
        birthTF.tintColor = .clear
        addLabel()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 M월 d일"
        let dateString = formatter.string(from: Date())
        birthTF.text = dateString
    }
    
    private func setDatePicker() {
        datePicker.locale = Locale(identifier: "ko_KR")
        datePicker.backgroundColor = #colorLiteral(red: 0.207462132, green: 0.278716892, blue: 0.3330567181, alpha: 1)
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
    }
}

extension BirthdayViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("sdfsdf")
    }
    
    private func addLabel() {
        birthTF.addSubview(label)
        
        // Set label text
        label.text = "생일(0세)"
        // Set label font and color
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.white
        // Enable Auto Layout
        label.translatesAutoresizingMaskIntoConstraints = false
        // Align label to the top left corner of text field
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: birthTF.topAnchor, constant: 12),
            label.leadingAnchor.constraint(equalTo: birthTF.leadingAnchor, constant: 15)
        ])
    }
}
