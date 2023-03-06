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
        datePicker.addTarget(self, action: #selector(calculateAge), for: .valueChanged)
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
    
    @objc func calculateAge(sender: UIDatePicker) {
        let today = Date()
        let calendar = Calendar.current
        let birthDate = sender.date
        let ageComponents = calendar.dateComponents([.year, .month, .day], from: birthDate, to: today)
        var age = ageComponents.year ?? 0
        
        if let birthMonth = ageComponents.month, let birthDay = ageComponents.day {
            if birthMonth < 0 || (birthMonth == 0 && birthDay < 0) {
                age -= 1
            }
        }
        
        label.text = "생일(\(age)세)"
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
