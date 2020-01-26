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
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 160
        loadProducts()
    }
    
    // MARK: - Custom Methods
    func loadProducts() {
        ProductController.getProducts(for: currentPage) { (products) in
            self.products = products
        }
    }
    
    func loadMoreProducts() {
        ProductController.getProducts(for: currentPage) { (newProducts) in
            self.products.append(contentsOf: newProducts)
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as? ProductTableViewCell else { return UITableViewCell() }
        let product = products[indexPath.row]
        cell.product = product
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == products.count - 1 {
            currentPage += 1
            loadMoreProducts()
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toProductDetailVC" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                let destination = segue.destination as? ProductDetailViewController else { return }
            destination.product = products[indexPath.row]
        }
    }
}
