//
//  SearchViewController.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/12.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextFiled: DebounceTextFiled!
    
    override func viewDidLoad() {
       setTextField()
        
    }
    
    
    func didSuccess() {
        
    }
    
    func didFailure() {
        
    }
    
    func setTableView
    
    func setTextField() {
        searchTextFiled.delegate = self
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        leftView.backgroundColor = .clear

        searchTextFiled.leftView = leftView
        searchTextFiled.leftViewMode = .always
        
        searchTextFiled.attributedPlaceholder = NSAttributedString(
            string: "유저 검색",
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        searchTextFiled.debounce(delay: 3) { text in
            SearchAPI().search(searchText: text!, searchVC: self)
            print("debounce")
        }
    }
    
    @IBAction func cancelSearch(_ sender: UIButton) {
        searchTextFiled.text = ""
        cancelButton.setImage(UIImage(named: "add2"), for: .normal)
        cancelButton.setTitle("", for: .normal)
    }
}

//MARK: - UITextFieldDelegate
extension SearchViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.setImage(nil, for: .normal)
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.setImage(nil, for: .normal)
    }
}

//MARK: - UITableViewDelegate
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
