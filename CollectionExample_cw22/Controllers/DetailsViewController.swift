//
//  DetailsViewController.swift
//  CollectionExample_cw22
//
//  Created by Sergey Intern  on 12/19/17.
//  Copyright © 2017 Sergey Intern . All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet private weak var ibImageView: UIImageView!
    
    var fruit: Fruit?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = fruit?.name
        ibImageView.image  = fruit?.image
    }
    
}
