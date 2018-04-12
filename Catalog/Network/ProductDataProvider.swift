//
//  ProductDataProvider.swift
//  ProductCatalog
//
//  Created by Alexander Karpenko on 4/4/18.
//  Copyright © 2018 Alexander Karpenko. All rights reserved.
//

import Foundation
import MiniShop_Shared

public protocol ProductDataProvider {
    func downloadProducts(completion: @escaping (Error?, [Product]?) -> Void)
}
