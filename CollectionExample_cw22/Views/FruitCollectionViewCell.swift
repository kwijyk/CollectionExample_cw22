//
//  FruitCollectionViewCell.swift
//  CollectionExample_cw22
//
//  Created by Sergey Intern  on 12/19/17.
//  Copyright © 2017 Sergey Intern . All rights reserved.
//

import UIKit

class FruitCollectionViewCell: UICollectionViewCell {

    static let reuseID = String(describing: FruitCollectionViewCell.self)
    static let nib = UINib(nibName: String(describing: FruitCollectionViewCell.self), bundle: nil)
    
    @IBOutlet private weak var ibImageView: UIImageView!
    @IBOutlet private weak var ibTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func update(name: String, image: UIImage) {
        ibImageView.image = image
        ibTitle.text = name
    }


}
