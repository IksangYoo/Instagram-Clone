//
//  PostDetailViewController.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/14.
//

import UIKit

class PostDetailViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var postId = 0
    var post : PostDetailResult?
    var comments : [CommentResult]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        print(postId)
        PostAPI().getPostByID(postID: postId, postDetailVC: self)
    }
     
    func setTableView() {
        let postDetailNib = UINib(nibName: "PostDetailTableViewCell", bundle: nil)
        tableView.register(postDetailNib, forCellReuseIdentifier: "postDetailCell")
        
        let commentNib = UINib(nibName: "CommentTableViewCell", bundle: nil)
        tableView.register(commentNib, forCellReuseIdentifier: "commentCell")
        
    }
    
    func didGetPostSuccess(result: PostDetailResult) {
        post = result
    }
    
    func didGetCommentSuccess(result: [CommentResult]) {
        comments = result
        tableView.reloadData()
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    
}

extension PostDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return comments?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let postDetailCell = tableView.dequeueReusableCell(withIdentifier: "postDetailCell", for: indexPath) as? PostDetailTableViewCell else { return UITableViewCell() }
            if let post = post {
                postDetailCell.updateUI(with: post)
            }
            
            return postDetailCell
        } else {
            guard let commentCell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as? CommentTableViewCell else { return UITableViewCell() }
            
            if let comments = comments {
                commentCell.updateUI(with: comments[indexPath.row])
            }
            
            return commentCell
        }
    }
    
    
}
