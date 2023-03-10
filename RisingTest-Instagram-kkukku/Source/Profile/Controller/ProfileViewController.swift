//
//  ProfileViewController.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/07.
//

import UIKit

class ProfileViewController: UIViewController {
    let currentUser = CurrentUser.shared
    @IBOutlet weak var optionButton: UIBarButtonItem!
    @IBOutlet weak var plusButton: UIBarButtonItem!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var usernameButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        registerXib()
        print(UserDefaults.standard.string(forKey: "email"))
        print(UserDefaults.standard.string(forKey: "password"))
        print(UserDefaults.standard.string(forKey: "jwt"))
    }
    
//    @IBAction func logout(_ sender: UIButton) {
//
//        UserDefaults.standard.set(nil, forKey: "email")
//        UserDefaults.standard.set(nil, forKey: "password")
//        UserDefaults.standard.set(nil, forKey: "jwt")
//
//        let storyboard : UIStoryboard = UIStoryboard(name: "LoginSignUp", bundle: nil)
//        guard let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginVC") as? UINavigationController else { return }
//
//        if let window = UIApplication.shared.windows.first {
//            window.rootViewController = loginVC
//            UIView.transition(with: window, duration: 1, options: .transitionCrossDissolve ,animations: nil)
//        }
//    }
    
    func setupNavigation() {
        let image1 = UIImage(named: "plus")?.withRenderingMode(.alwaysOriginal)
        let image2 = UIImage(named: "option")?.withRenderingMode(.alwaysOriginal)
        
        plusButton.image = image1
        optionButton.image = image2
        usernameButton.setTitle("kkukku", for: .normal)
    }
    
    func registerXib() {
        let topNib = UINib(nibName: "TopSectionCollectionViewCell", bundle: nil)
        collectionView.register(topNib, forCellWithReuseIdentifier: "topCell")
    }
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    // 섹션 개수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    // 섹션별 셋 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 5
        } else {
            return 3
        }
        
    }
    
    // 각 섹션의 셀
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topCell", for: indexPath) as? TopSectionCollectionViewCell else { return UICollectionViewCell()}
        
            return cell
            
        } else if indexPath.section == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topCell", for: indexPath) as? TopSectionCollectionViewCell else { return UICollectionViewCell()}
        
            return cell
            
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topCell", for: indexPath) as? TopSectionCollectionViewCell else { return UICollectionViewCell()}
        
            return cell
            
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            
            return CGSize(width: view.frame.width, height: 200)
        } else if indexPath.section == 1 {
            return CGSize(width: 100, height: 100)
        } else {
            return CGSize(width: 200, height: 200)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
}
