//
//  CartTableViewCell.swift
//  ShopApp
//
//  Created by Alisher on 2/7/21.
//  Copyright © 2021 Alisher. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    static let identifier = String(describing: CartTableViewCell.self)
    static let nib = UINib(nibName: identifier, bundle: nil)
    
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellDescription: UILabel!
    @IBOutlet weak var cellPrice: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
