//
//  PostsViewController.swift
//  TestPosts
//
//  Created by fintech on 05/10/2022.
//

import UIKit
protocol PostsDisplayLogic {
    func displayPosts()
    func selectSinglePost()
    func fillPostFromSinglePostScreen(post: Post?)
}
class PostsViewController: UIViewController {

    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var postsTableView: UITableView!
    var interactor: PostsBusinessLogic?
    var router: ( PostsRoutingLogic & PostsDataPassing )?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configurePostsTableView()
        interactor!.fetchPosts()
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    func configurePostsTableView() {
        postsTableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "PostTableViewCell")
        postsTableView.delegate = self
        postsTableView.dataSource = self
    }
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
extension PostsViewController: PostsDisplayLogic {
    func fillPostFromSinglePostScreen(post: Post?) {
        nameLabel.text = post?.title
        descLabel.text = post?.body
        userIdLabel.text = "userID: \(post?.userID)"
    }
    
    func selectSinglePost() {
        //router?.routeToSinglePost(post: <#Post#>)
    }
    
    func displayPosts() {
        print("=============countM:\(interactor?.postsCount ?? 0)")
        postsTableView.reloadData()
    }
    
    
}
extension PostsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //router?.routeToSinglePost(post: router?.dataStore?.postSelected)
        
        router?.routeToSinglePost(index: indexPath.row)
//        interactor?.didSelectPost(at: indexPath.row)
    }
}
extension PostsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("=============count:\(interactor?.postsCount ?? 0)")
        return interactor?.postsCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        interactor?.fillPostCell(for: cell, row: indexPath.row)
        return cell
    }
    
    
}
extension PostsViewController: SinglePostProtocol {
    func fillPost(with post: Post?) {
        print("0000000000")
        nameLabel.text = post?.title
        descLabel.text = post?.body
        userIdLabel.text = "userID: \(post?.userID)"
    }
    
    
}
