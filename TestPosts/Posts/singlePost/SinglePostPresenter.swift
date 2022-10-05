//
//  SinglePostPresenter.swift
//  TestPosts
//
//  Created by fintech on 05/10/2022.
//

import Foundation
protocol SinglePostPresentationLogic {
    func displayPost(post: Post)
}
class SinglePostPresenter {
    var view: SinglePostDisplayLogic
    init(view: SinglePostDisplayLogic) {
        self.view = view
    }
}
extension SinglePostPresenter: SinglePostPresentationLogic {
    func displayPost(post: Post) {
        view.displayPost(post: post)
    }
    
    
}
