//
//  PostsRouter.swift
//  TestPosts
//
//  Created by fintech on 05/10/2022.
//

import Foundation
protocol PostsRoutingLogic {
    func routeToSinglePost(index:Int)
    
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
    
    func routeToSinglePost(index:Int) {
        let view = PostConfigurator.singlePost(post: dataStore?.posts?[index], delegate: viewController)
        viewController.navigationController?.pushViewController(view, animated: true)
    }
    
    
}
extension PostsRouter: PostsDataPassing {
    var dataStore: PostsDataStore? {
        dataStorePosts
    }
    
    
}


