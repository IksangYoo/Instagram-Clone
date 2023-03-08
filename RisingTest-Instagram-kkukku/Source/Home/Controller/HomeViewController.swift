//
//  HomeViewController.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/06.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var heartButton: UIBarButtonItem!
    @IBOutlet weak var dmButtom: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        let cellNib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "homeCell")
    }
    
    
    func setNavigation() {
        let image1 = UIImage(named: "Instragram")?.withRenderingMode(.alwaysOriginal)
        let image2 = UIImage(named: "heart")?.withRenderingMode(.alwaysOriginal)
        let image3 = UIImage(named: "dmIcon")?.withRenderingMode(.alwaysOriginal)
        let instaButton = UIBarButtonItem(image: image1, style: .plain, target: self, action: nil)
        
        navigationItem.leftBarButtonItem = instaButton
        dmButtom.image = image3
        heartButton.image = image2
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! HomeTableViewCell
        return cell
    }
    
    
}
