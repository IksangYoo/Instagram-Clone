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
    let threshold: CGFloat = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        let cellNib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "homeCell")
        PostAPI().getPost(homeVC: self)
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
    
    func didSuccess(postResult: [PostResult]) {
        posts = postResult
        
        
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
//extension HomeViewController {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//            let currentOffset = scrollView.contentOffset.y
//            let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
//
//            // 스크롤뷰의 맨 아래에서 100 떨어진 곳에 도달했는지 확인
//            if maximumOffset - currentOffset <= threshold {
//                // 실행할 함수 호출
//                myFunction()
//            }
//        }
//
//        func myFunction() {
//            // 맨 아래에서 100 떨어진 곳에 도달했을 때 실행할 코드 작성
//            print("스크롤이 맨 아래에서 100 떨어진 곳에 도달했습니다.")
//        }
//    }
