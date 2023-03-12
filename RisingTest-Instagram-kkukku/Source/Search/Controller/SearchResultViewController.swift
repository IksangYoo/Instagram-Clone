//
//  SearchResultViewController.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/12.
//

import UIKit

class SearchResultViewController: UIViewController, updateTableViewProtocol{
    
    func updateTableView() {
        print("delegate")
    }
    
    
    @IBOutlet var tableView: UITableView!
    
    let searchVC = SearchViewController()
    var searchedUser = [SearchUserResult?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        searchVC.delegate = self
        print("viewdid")
    }
    

    
    func setTableView() {
        let nib = UINib(nibName: "SearchResultTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "resultCell")
    }

    func didSuccess(response: SearchResponse) {
        searchedUser = response.result
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        print("----->user \(searchedUser)")
    }

    func didFailure() {

    }
    
}

extension SearchResultViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath) as? SearchResultTableViewCell else { return UITableViewCell() }
        
        cell.updateUI(with: searchedUser[indexPath.row]!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
