//
//  PostsPresenter.swift
//  TestPosts
//
//  Created by fintech on 05/10/2022.
//

import Foundation
protocol PostsPresentationLogic {
    func notifyGetPostsFromApi()
    func selectSinglePost()
    func fillPostFromSinglePostScreen(post: Post?)
}
class PostsPresenter {
    var view: PostsDisplayLogic
    init(view: PostsDisplayLogic) {
        self.view = view
    }
}
extension PostsPresenter: PostsPresentationLogic {
    func fillPostFromSinglePostScreen(post: Post?) {
        view.fillPostFromSinglePostScreen(post: post)
    }
    
    func selectSinglePost() {
        view.selectSinglePost()
    }
    
    func notifyGetPostsFromApi() {
        view.displayPosts()
    }
    
    
}
