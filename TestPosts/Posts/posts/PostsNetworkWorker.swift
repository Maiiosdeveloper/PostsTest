//
//  PostsNetworkWorker.swift
//  TestPosts
//
//  Created by fintech on 05/10/2022.
//

import Foundation
import Alamofire
let BASE_URL = "https://jsonplaceholder.typicode.com/posts"
protocol PostsNetworkingLogic {
    func callPostsApi() -> [Post]?
}
class PostsNetworkWorker {
    
}
extension PostsNetworkWorker: PostsNetworkingLogic {
    func callPostsApi() -> [Post]? {
        var postsArray:[Post]? = nil
        let request = AF.request(BASE_URL)
        request.responseDecodable(of: [Post].self) { (response) in
            guard let posts = response.value else { return}
            postsArray = posts
        }
        return postsArray
    }
    
    
    
    
}
