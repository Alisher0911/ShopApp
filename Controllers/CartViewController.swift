//
//  CartViewController.swift
//  ShopApp
//
//  Created by Alisher on 2/7/21.
//  Copyright © 2021 Alisher. All rights reserved.
//

import UIKit

var cartProducts = [Product]()

class CartViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(CartTableViewCell.nib, forCellReuseIdentifier: CartTableViewCell.identifier)
        tableView.tableFooterView = UIView()
    }
    
    @IBAction func buyButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Operation", message: "Operation successfully finished", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default) { (alert) in
        }
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.identifier, for: indexPath) as! CartTableViewCell
        cell.cellTitle.text = cartProducts[indexPath.row].title
        cell.cellDescription.text = cartProducts[indexPath.row].description
        cell.cellPrice.text = "\(cartProducts[indexPath.row].price)"
        cell.cellImage.image = cartProducts[indexPath.row].image
        return cell
    }
}
