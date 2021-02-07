//
//  DetailViewController.swift
//  ShopApp
//
//  Created by Alisher on 2/7/21.
//  Copyright © 2021 Alisher. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    
    var pTitle = ""
    var pDescription = ""
    var pPrice = ""
    var pImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productTitle.text = pTitle
        productDescription.text = pDescription
        productPrice.text = pPrice
        productImage.image = pImage
    }
    
    
    @IBAction func addToCart(_ sender: Any) {
        cartProducts.append(Product(image: self.pImage, title: self.pTitle, description: self.pDescription, price: self.pPrice))
    }
}
