//
//  SearchViewController.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/12.
//

import UIKit

protocol updateTableViewProtocol {
    func updateTableView()
}

class SearchViewController: UIViewController {

    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var cancelButton: UIButton!

    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var searchTextFiled: DebounceTextFiled!
    
    var delegate : updateTableViewProtocol?
    
    override func viewDidLoad() {
        setTextField()
        setTableView()
        print("search")
        secondView.isHidden = true
    }
    
    func setTableView() {
        let nib = UINib(nibName: "SearchTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "searchCell")
    }
    
    func setTextField() {
        let resultVC = self.storyboard?.instantiateViewController(withIdentifier: "resultVC") as! SearchResultViewController
      
        searchTextFiled.delegate = self
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        leftView.backgroundColor = .clear

        searchTextFiled.leftView = leftView
        searchTextFiled.leftViewMode = .always
        
        searchTextFiled.attributedPlaceholder = NSAttributedString(
            string: "유저 검색",
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        
        searchTextFiled.debounce(delay: 1) { text in
            SearchAPI().search(searchText: text!, resultVC: resultVC)
            self.delegate?.updateTableView()
        }
    }
    
    @IBAction func cancelSearch(_ sender: UIButton) {
        searchTextFiled.text = ""
        cancelButton.setImage(UIImage(named: "add2"), for: .normal)
        cancelButton.setTitle("", for: .normal)
        secondView.isHidden = true
    }
}

//MARK: - UITextFieldDelegate
extension SearchViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.setImage(nil, for: .normal)
        secondView.isHidden = false
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
