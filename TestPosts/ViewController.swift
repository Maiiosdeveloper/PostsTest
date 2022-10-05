//
//  ViewController.swift
//  TestPosts
//
//  Created by fintech on 05/10/2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let request = AF.request(BASE_URL)
            // 2
        request.responseDecodable(of: [Post].self) { (response) in
          guard let posts = response.value else { return }
          print(posts)
        }
    }


}

