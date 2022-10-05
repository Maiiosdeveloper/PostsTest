//
//  PostTableViewCell.swift
//  TestPosts
//
//  Created by fintech on 05/10/2022.
//

import UIKit

protocol PostTableViewCellProtocol {
    func fillPostData(with post: Post?)
}
class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension PostTableViewCell: PostTableViewCellProtocol {
    func fillPostData(with post: Post?) {
        titleLabel.text = post?.title ?? ""
        descLabel.text = post?.body ?? ""
    }
    
    
}
