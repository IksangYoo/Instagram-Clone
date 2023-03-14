//
//  PostDetailViewController.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/14.
//

import UIKit

class PostDetailViewController: UIViewController {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var postCommentButton: UIButton!
    var postId = 0
    var post : PostDetailResult?
    var comments : [CommentResult]?
    let currentUser = CurrentUser.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setView()
        commentTextField.delegate = self
        print(postId)
        PostAPI().getPostByID(postID: postId, postDetailVC: self)
    }
     
    func setTableView() {
        let postDetailNib = UINib(nibName: "PostDetailTableViewCell", bundle: nil)
        tableView.register(postDetailNib, forCellReuseIdentifier: "postDetailCell")
        
        let commentNib = UINib(nibName: "CommentTableViewCell", bundle: nil)
        tableView.register(commentNib, forCellReuseIdentifier: "commentCell")
        
    }
    
    func setView() {
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        let url = URL(string: (currentUser.userInfo?.profileImage)!)
        
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        commentTextField.layer.cornerRadius = 20
        commentTextField.layer.borderColor = UIColor.lightGray.cgColor
        commentTextField.layer.borderWidth = 0.5
        commentTextField.leftView = leftView
        commentTextField.leftViewMode = .always
        postCommentButton.isEnabled = false
        profileImageView.kf.setImage(with: url!)
    }
    
    @IBAction func postComment(_ sender: UIButton) {
        CommentAPI().postComment(postID: postId, content: commentTextField.text!, postDetailVC: self)
        commentTextField.text = ""
    }
    func didGetPostSuccess(result: PostDetailResult) {
    
        post = result
        tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
    }
    
    func didGetCommentSuccess(result: [CommentResult]) {
        let section = 1
        let indexSet = IndexSet(integer: section)
        comments = result
        tableView.reloadSections(IndexSet(integer: 1), with: .automatic)
    }
    
    func didPostCommentSuccesss() {
        CommentAPI().getComment(postID: postId, page: 1, postDetailVC: self)
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

extension PostDetailViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text == "" {
            postCommentButton.isEnabled = false
        } else {
            postCommentButton.isEnabled = true
        }
    }
}
