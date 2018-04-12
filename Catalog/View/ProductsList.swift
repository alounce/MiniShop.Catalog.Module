//
//  ProductsList.swift
//  MiniShop
//
//  Created by Alexander Karpenko on 3/22/18.
//  Copyright © 2018 Alexander Karpenko. All rights reserved.
//

import UIKit
import MiniShop_Shared

public class ProductsList: UITableViewController, DataProviderClient {

    private var viewModel: ProductListViewModel!
    
    public func setProvider(_ provider: AnyObject) {
        if let provider = provider as? ProductDataProvider {
            self.viewModel = ProductListViewModel(provider: provider)
        }
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadData()
    }

    private func loadData() {
        viewModel.downloadProducts { [weak self] error in
            if let error = error {
                print("Error happened")
                print("\(error.localizedDescription)")
                return
            }
            self?.tableView.reloadData()
        }
    }

    @IBAction func tapRefresh(_ sender: Any) {
        loadData()
    }

    // MARK: - Table view data source

    override public func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sectionCount()
    }

    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.itemsCount()
    }

    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell",
                                                       for: indexPath) as? ProductCell else {
            fatalError("Cannot obtain ProductCell")
        }

        // Configure the cell...
        let product = viewModel.item(byIndex: indexPath.row)
        cell.configure(title: product.title, details: product.details, price: product.priceString)
        return cell
    }

    override public func tableView(_ tableView: UITableView,
                                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }

}
