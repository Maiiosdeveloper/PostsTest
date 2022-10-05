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
}
class PostsViewController: UIViewController {

    @IBOutlet weak var postsTableView: UITableView!
    var interactor: ( PostsBusinessLogic & PostsDataStore)?
    var router: ( PostsRoutingLogic & PostsDataPassing )?
    override func viewDidLoad() {
        super.viewDidLoad()

        configurePostsTableView()
        interactor?.fetchPosts()
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
    func selectSinglePost() {
        router?.routeToSinglePost()
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
        interactor?.didSelectPost(at: indexPath.row)
    }
}
extension PostsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("=============count:\(interactor?.postsCount ?? 0)")
        return interactor?.postsCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
        interactor?.fillPostCell(for: cell, row: indexPath.row)
        return cell
    }
    
    
}
