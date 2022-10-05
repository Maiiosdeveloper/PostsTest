//
//  SinglePostViewController.swift
//  TestPosts
//
//  Created by fintech on 05/10/2022.
//

import UIKit
protocol SinglePostDisplayLogic {
    func displayPost(post: Post)
}
class SinglePostViewController: UIViewController {

    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    var interactor: SinglePostBusinessLogic?
    var postId: Int?
    override func viewDidLoad() {
        super.viewDidLoad()

        interactor?.getSinglePost(postId: postId)
        
    }

    init(postId: Int?){
        super.init(nibName: nil, bundle: nil)
        guard let postId else { return }
        self.postId = postId
        
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
