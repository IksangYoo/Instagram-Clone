//
//  SearchViewController.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/12.
//

import UIKit


class SearchViewController: UIViewController {

    @IBOutlet weak var cancelButton: UIButton!
    var searchedUser = [SearchUserResult?]()
    
    @IBOutlet weak var historyView: UIView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var searchTextFiled: DebounceTextFiled!
    var userID = 0
    
    override func viewDidLoad() {
        setTextField()
        setTableView()
    }
    
    func setTableView() {
        let nib = UINib(nibName: "SearchTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "searchCell")
    }
    
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
        
        searchTextFiled.debounce(delay: 1) { text in
            SearchAPI().search(searchText: text!, searchVC: self)
            print("debounce")
        }
    }
    
    func didSuccess(response: SearchResponse) {
        searchedUser = response.result
        tableView.reloadData()
    }
    
    @IBAction func cancelSearch(_ sender: UIButton) {
        searchTextFiled.text = ""
        cancelButton.setImage(UIImage(named: "add2"), for: .normal)
        cancelButton.setTitle("", for: .normal)
        historyView.isHidden = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToUserProfile" {
            let destinationVC = segue.destination as! UserProfileViewController
            destinationVC.userID = userID
        }
    }
}

//MARK: - UITextFieldDelegate
extension SearchViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.setImage(nil, for: .normal)
        historyView.isHidden = true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.setImage(nil, for: .normal)
        historyView.isHidden = true
    }
}

//MARK: - UITableViewDelegate
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
        
        cell.updateUI(with: searchedUser[indexPath.row]!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        userID = (searchedUser[indexPath.row]?.userId)!
        performSegue(withIdentifier: "goToUserProfile", sender: self)
    }
}
