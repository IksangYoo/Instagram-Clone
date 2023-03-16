//
//  AccountViewController.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/16.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "SettingsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "settingCell")
    }
    @IBAction func goBack(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension AccountViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 16
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath) as? SettingsTableViewCell else { return UITableViewCell() }
        cell.updateAccoutUI(row: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 15 {
            performSegue(withIdentifier: "goToDelete", sender: nil)
        }
    }
}
