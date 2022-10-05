//
//  PostsRouter.swift
//  TestPosts
//
//  Created by fintech on 05/10/2022.
//

import Foundation
protocol PostsRoutingLogic {
    func routeToSinglePost()
}
protocol PostsDataPassing {
    var dataStore: Int?{ get }
}
class PostsRouter {
    let viewController: PostsViewController
    init(viewController: PostsViewController) {
        self.viewController = viewController
    }
}

extension PostsRouter: PostsRoutingLogic {
    func routeToSinglePost() {
        let view = PostConfigurator.singlePost(postId: dataStore)
        viewController.navigationController?.pushViewController(view, animated: true)
    }
    
    
}
extension PostsRouter: PostsDataPassing {
    var dataStore: Int? {
        viewController.interactor?.postIdSelected
    }
    
    
}
