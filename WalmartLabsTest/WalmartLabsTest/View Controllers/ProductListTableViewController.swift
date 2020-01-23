//
//  ProductListTableViewController.swift
//  WalmartLabsTest
//
//  Created by Bethany Bellio on 1/20/20.
//  Copyright © 2020 Bethany Bellio. All rights reserved.
//

import UIKit

class ProductListTableViewController: UITableViewController {
    // MARK: - Properties and Global Variables
    var products: [Product] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    var currentPage = 1
//    var keepFetching = true
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.prefetchDataSource = self
        loadProducts()
    }
    
    // MARK: - Custom Methods
    func loadProducts() {
        ProductController.getProducts(for: currentPage) { (products) in
            self.products = products
            print(products.count)
        }
    }
    
    func loadMoreProducts() {
        ProductController.getProducts(for: currentPage) { (newProducts) in
            self.products.append(contentsOf: newProducts)
//            self.keepFetching = false
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath)
        let product = products[indexPath.row]
        cell.textLabel?.text = product.productName
        cell.detailTextLabel?.text = product.price
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == products.count - 1 {
            currentPage += 1
            loadMoreProducts()
        }
    }
    
//    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let yOffset = scrollView.contentOffset.y
//        let contentHeight = scrollView.contentSize.height
//        if yOffset > contentHeight - scrollView.frame.height {
//            if keepFetching {
//                currentPage += 1
//                loadMoreProducts()
//            }
//        }
//    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toProductDetailVC" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                let destination = segue.destination as? ProductDetailViewController else { return }
            destination.product = products[indexPath.row]
        }
    }
}

//extension ProductListTableViewController: UITableViewDataSourcePrefetching {
//    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
//        for indexPath in indexPaths {
//
//        }
//    }
//}
