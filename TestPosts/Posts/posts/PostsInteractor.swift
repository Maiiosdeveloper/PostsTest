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
    func didSelectPost(at row: Int)
    
}
protocol PostsDataStore {
    var postIdSelected: Int? { get }
}
class PostsInteractor {
    var presenter: PostsPresentationLogic
    var postsViewModel: [Post]?
    var postId: Int?
    init(presenter: PostsPresentationLogic) {
        self.presenter = presenter
    }
}
extension PostsInteractor: PostsBusinessLogic {
    func didSelectPost(at row: Int) {
        postId = postsViewModel?[row].id
        presenter.selectSinglePost()
    }
    
    func fillPostCell(for cell: PostTableViewCellProtocol, row: Int) {
        cell.fillPostData(with: postsViewModel?[row])
    }
    
    var postsCount: Int {
        return postsViewModel?.count ?? 0
    }
    func fetchPosts(){
            let request = AF.request(BASE_URL)
            request.responseDecodable(of: [Post].self) { (response) in
            
                guard let posts = response.value else { return}
                self.postsViewModel = posts
                self.presenter.notifyGetPostsFromApi()
            }
        
    }
}
extension PostsInteractor: PostsDataStore{
    var postIdSelected: Int? {
        postId
    }
    
    
}
   
    


