//
//  PostsRouter.swift
//  TestPosts
//
//  Created by fintech on 05/10/2022.
//

import Foundation
protocol PostsRoutingLogic {
    func routeToSinglePost()
    func routeToSinglePage(id: Int)
}
protocol PostsDataPassing{
    var dataStore: PostsDataStore? { get }
}
class PostsRouter {
    let viewController: PostsViewController
    var dataStorePosts: PostsDataStore?
    init(viewController: PostsViewController) {
        self.viewController = viewController
    }
}

extension PostsRouter: PostsRoutingLogic {
    func routeToSinglePage(id: Int) {
        let view = SinglePostViewController(postId: id)
        viewController.navigationController?.pushViewController(view, animated: true)
    }
    
    func routeToSinglePost() {
        print("==========\(dataStorePosts?.postIdSelected)")
        let view = PostConfigurator.singlePost(id: dataStorePosts?.postIdSelected)
        viewController.navigationController?.pushViewController(view, animated: true)
    }
    
    
}
extension PostsRouter: PostsDataPassing {
    var dataStore: PostsDataStore? {
        dataStorePosts
    }
    
    
}


