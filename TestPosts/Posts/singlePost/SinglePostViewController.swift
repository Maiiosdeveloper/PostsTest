//
//  SinglePostViewController.swift
//  TestPosts
//
//  Created by fintech on 05/10/2022.
//

import UIKit
protocol SinglePostProtocol {
    func fillPost(with post: Post?)
}
protocol SinglePostDisplayLogic {
    func displayPost(post: Post)
}
class SinglePostViewController: UIViewController {

    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    var interactor: SinglePostBusinessLogic?
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //interactor?.getSinglePost(postId: postId)
        fillPostsData()
        print(post!)
    }

    func fillPostsData() {
        if let post{
            titleLabel.text = post.title
            descLabel.text = post.body
            userIdLabel.text = "user Id: \(post.userID)"
            var tagString = "Tags: "
            
                for tag in post.tags{
                    tagString.append("\(tag)\n")
                }
            tagsLabel.text = tagString
           }
        
        
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        interactor?.goBackToAllPosts()
    }
    init(post: Post?){
        super.init(nibName: nil, bundle: nil)
        guard let post else { return }
        self.post = post
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension SinglePostViewController: SinglePostDisplayLogic {
    func displayPost(post: Post) {
        titleLabel.text = post.title
        descLabel.text = post.body
        print("=====mai\(titleLabel.text)")
    }
    
    
}

