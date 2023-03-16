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
    var posts = [PostResult]()
    var page = 1
    var isLoadingPost = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        setTableView()
        self.tableView.refreshControl = UIRefreshControl()
        self.tableView.refreshControl?.addTarget(self, action: #selector(refreshPost), for: .valueChanged)
        
        PostAPI().getPost(homeVC: self)
    }
    
    @objc func refreshPost() {
        PostAPI().getPost(homeVC: self)
        page = 1
    }
    
    
    func setTableView() {
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
    
    func didSuccessGetDefaultPost(postResult: [PostResult]) {
        posts = postResult
        tableView.refreshControl?.endRefreshing()
        
        tableView.reloadData()
        
    }
    
    func didSuccessGetMorePost(result: [PostResult]) {
        for post in result {
            posts.append(post)
        }
        
        isLoadingPost = false
        
        tableView.reloadData()
    }
}

//MARK: - TableViewDelegate
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! HomeTableViewCell
        cell.updateCell(post: posts[indexPath.row])
        return cell
    }
}

//MARK: - TabelViewScrollDelegate
extension HomeViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.height, !isLoadingPost {
            isLoadingPost = true
            page += 1
            print("함수호충")
            print(page)
            //함수 호출
            PostAPI().getMorePost(page: page, homeVC: self)
        }
    }
}
