//
//  PostConfigurator.swift
//  TestPosts
//
//  Created by fintech on 05/10/2022.
//

import Foundation
class PostConfigurator {
    static func posts() -> PostsViewController {
        let view = PostsViewController()
        let presenter = PostsPresenter(view: view)
        let interactor = PostsInteractor(presenter: presenter)
        let router = PostsRouter(viewController: view)
        view.interactor = interactor
        view.router = router
        router.dataStorePosts = interactor
        return view
    }
    static func singlePost(post: Post?,delegate: SinglePostProtocol) -> SinglePostViewController {
        let view = SinglePostViewController(post: post)
        let presenter = SinglePostPresenter(view: view)
        let interactor = SinglePostInteractor(presenter: presenter, delegate: delegate, post: post)
    
        interactor.delegate = delegate
        view.interactor = interactor
        
        return view
    }
}
