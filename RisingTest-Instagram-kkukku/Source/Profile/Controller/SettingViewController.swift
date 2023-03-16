//
//  SettingViewController.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/16.
//

import UIKit

class SettingViewController: UIViewController {
    let currentUser = CurrentUser.shared
    
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "SettingsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "settingCell")
        logoutButton.setTitle("\(currentUser.userInfo!.userName!) 로그아웃", for: .normal)
    }
    

    @IBAction func logout(_ sender: UIButton) {
        UserDefaults.standard.set(nil, forKey: "email")
        UserDefaults.standard.set(nil, forKey: "password")
        UserDefaults.standard.set(nil, forKey: "jwt")
        
        let storyboard : UIStoryboard = UIStoryboard(name: "LoginSignUp", bundle: nil)
        guard let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginVC") as? UINavigationController else { return }
        
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = loginVC
            UIView.transition(with: window, duration: 1, options: .transitionCrossDissolve ,animations: nil)
        }
        
    }
    @IBAction func goBack(_ sender: UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }
}

//MARK: - UITableViewDelegate
extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath) as? SettingsTableViewCell else { return UITableViewCell() }
        cell.updateUI(row: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 6 {
            performSegue(withIdentifier: "goToAccout", sender: nil)
        }
    }
}
