//
//  ProductCell.swift
//  MiniShop
//
//  Created by Alexander Karpenko on 3/22/18.
//  Copyright © 2018 Alexander Karpenko. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var detailsLabel: UILabel!
    @IBOutlet weak private var priceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(title: String, details: String, price: String) {
        titleLabel.text = title
        detailsLabel.text = details
        priceLabel.text = price
    }

}
