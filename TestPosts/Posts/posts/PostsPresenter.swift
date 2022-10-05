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
}
class PostsPresenter {
    var view: PostsDisplayLogic
    init(view: PostsDisplayLogic) {
        self.view = view
    }
}
extension PostsPresenter: PostsPresentationLogic {
    func selectSinglePost() {
        view.selectSinglePost()
    }
    
    func notifyGetPostsFromApi() {
        view.displayPosts()
    }
    
    
}
