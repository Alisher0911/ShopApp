//
//  MyCollectionViewCell.swift
//  ShopApp
//
//  Created by Alisher on 2/5/21.
//  Copyright © 2021 Alisher. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellDescription: UILabel!
    @IBOutlet weak var cellPrice: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    
    static let identifier = String(describing: MyCollectionViewCell.self)
    static let nib = UINib(nibName: identifier, bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func addToCart(_ sender: Any) {
        cartProducts.append(Product(image: cellImage.image!, title: cellTitle.text!, description: cellDescription.text!, price: cellPrice.text!))
    }
}
