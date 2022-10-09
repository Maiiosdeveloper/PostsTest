//
//  SinglePostInteractor.swift
//  TestPosts
//
//  Created by fintech on 05/10/2022.
//

import Foundation
import Alamofire
protocol SinglePostBusinessLogic {
    func getSinglePost(postId: Int?)
    func goBackToAllPosts()
}
protocol SinglePostDataStore {
    var dataStore: Post? { get }
}
class SinglePostInteractor {
    var presenter: SinglePostPresentationLogic
    var delegate: SinglePostProtocol?
    var post: Post?
    init(presenter: SinglePostPresentationLogic, delegate: SinglePostProtocol, post: Post?) {
        self.presenter = presenter
        self.delegate = delegate
        self.post = post
    }
}
extension SinglePostInteractor: SinglePostBusinessLogic {
    func goBackToAllPosts() {
        delegate?.fillPost(with: post)
    }
    
    func getSinglePost(postId: Int?) {
        guard let postId else { return}
        let url = BASE_URL+"/\(postId)"
        print("======+url:\(url)")
        let request = AF.request(url)
        request.responseDecodable(of: Post.self) { (response) in
            
            guard let post = response.value else { return}
            print("======+\(post)")
            self.presenter.displayPost(post: post)
        }
    }
    
    
}
extension SinglePostInteractor: SinglePostDataStore {
    var dataStore: Post? {
        post
    }
    
    
}
