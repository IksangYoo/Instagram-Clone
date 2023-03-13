//
//  SearchHistoryViewController.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/13.
//

import UIKit

class SearchHistoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
    }
    
    func setTableView() {
        let nib = UINib(nibName: "SearchHistoryTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "historyCell")
        
        let header = UINib(nibName: "HistoryTableViewHeader", bundle: nil)
        tableView.register(header, forHeaderFooterViewReuseIdentifier: "HistoryTableViewHeader")
        
        //헤더 위쪽으로
//        tableView.contentInset = UIEdgeInsets(top: -30, left: 0, bottom: 0, right: 0)
    }
}

extension SearchHistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath) as? SearchHistoryTableViewCell else { return UITableViewCell() }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HistoryTableViewHeader")
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
}
