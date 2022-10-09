//
//  PostsInteractor.swift
//  TestPosts
//
//  Created by fintech on 05/10/2022.
//

import Foundation
import Alamofire
protocol PostsBusinessLogic {
    var postsCount:Int { get }
    func fetchPosts()
    func fillPostCell(for cell: PostTableViewCellProtocol, row: Int)
    //func didSelectPost(at row: Int)
    
}
protocol PostsDataStore {
    var posts: [Post]? { get }
}
class PostsInteractor {
    var presenter: PostsPresentationLogic
   
    var postsViewModel: [Post]?
    init(presenter: PostsPresentationLogic) {
        self.presenter = presenter
    }
}
extension PostsInteractor: PostsBusinessLogic {
//    func didSelectPost(at row: Int) {
//        post = postsViewModel?[row]
//        presenter.selectSinglePost()
//    }
    
    func fillPostCell(for cell: PostTableViewCellProtocol, row: Int) {
        cell.fillPostData(with: postsViewModel?[row])
    }
    
    var postsCount: Int {
        return postsViewModel?.count ?? 0
    }
    func fetchPosts(){
            let request = AF.request(BASE_URL)
            request.responseDecodable(of: Welcome.self) { (response) in
                switch response.result {
                case .success(let data):
                    let posts = data.posts
                    self.postsViewModel = posts
                    self.presenter.notifyGetPostsFromApi()
                case .failure(let err):
                    print(err)
                }

            }
        
    }
}
extension PostsInteractor: PostsDataStore{
    var posts: [Post]? {
        postsViewModel
    }
    
    
    
}
extension PostsInteractor{
//    func fillPost(with post: Post?) {
//        presenter.fillPostFromSinglePostScreen(post: post)
//    }
    
    
}
    


