//
//  ViewController.swift
//  ShopApp
//
//  Created by Alisher on 2/3/21.
//  Copyright © 2021 Alisher. All rights reserved.
//

import UIKit
struct Product {
    var image: UIImage
    var title: String
    var description: String
    var price: String
}

var products: [Product] = [
    Product(image: UIImage(named: "bread")!, title: "Bread", description: "Common bread", price: "$2.99"),
    Product(image: UIImage(named: "milk")!, title: "Milk", description: "Common milk", price: "$1.99"),
    Product(image: UIImage(named: "potato")!, title: "Potato", description: "Common potato", price: "$4.99"),
    Product(image: UIImage(named: "banana")!, title: "Banana", description: "Common banana", price: "$3.99"),
]

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var segmentedControlButton: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isHidden = false
        collectionView.isHidden = true
        configure()
    }
    
    func configure() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(MyTableViewCell.nib, forCellReuseIdentifier: MyTableViewCell.identifier)
        tableView.tableFooterView = UIView()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(MyCollectionViewCell.nib, forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
    }

    @IBAction func changeView(_ sender: UISegmentedControl) {
        if collectionView.isHidden {
            tableView.isHidden = true
            collectionView.isHidden = false
        } else {
            tableView.isHidden = false
            collectionView.isHidden = true
        }
    }
    
    
    @IBAction func goToCart(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "cart") as! CartViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
        cell.cellTitle.text = products[indexPath.row].title
        cell.cellDescription.text = products[indexPath.row].description
        cell.cellPrice.text = "Price: \(products[indexPath.row].price)"
        cell.cellImage.image = products[indexPath.row].image
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "detail") as! DetailViewController
        vc.pTitle = products[indexPath.row].title
        vc.pDescription = products[indexPath.row].description
        vc.pPrice = products[indexPath.row].price
        vc.pImage = products[indexPath.row].image
        self.navigationController?.pushViewController(vc, animated: true)
    }
}



extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        cell.cellTitle.text = products[indexPath.row].title
        cell.cellDescription.text = products[indexPath.row].description
        cell.cellPrice.text = "Price: \(products[indexPath.row].price)"
        cell.cellImage.image = products[indexPath.row].image
        
        if indexPath.item % 2 == 0 {
            cell.backgroundColor = .gray
        }else{
            cell.backgroundColor = .yellow
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "detail") as! DetailViewController
        vc.pTitle = products[indexPath.row].title
        vc.pDescription = products[indexPath.row].description
        vc.pPrice = products[indexPath.row].price
        vc.pImage = products[indexPath.row].image
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        /*let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size: CGFloat = (collectionView.frame.size.width - space) / 2.0
        return CGSize(width: size, height: 120)*/
        let wid = self.view.bounds.width / 2
        return CGSize(width: wid, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
