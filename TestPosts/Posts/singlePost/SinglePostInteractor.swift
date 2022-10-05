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
}
class SinglePostInteractor {
    var presenter: SinglePostPresentationLogic
    init(presenter: SinglePostPresentationLogic) {
        self.presenter = presenter
    }
}
extension SinglePostInteractor: SinglePostBusinessLogic {
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
