//
//  ProductListViewModel.swift
//  MiniShop
//
//  Created by Alexander Karpenko on 3/23/18.
//  Copyright © 2018 Alexander Karpenko. All rights reserved.
//

import Foundation

public class ProductListViewModel {
    // working with the data
    var provider: ProductDataProvider
    public var products = [ProductViewModel]()

    public init(provider: ProductDataProvider) {
        self.provider = provider
    }

    public func downloadProducts(completion: @escaping (Error?) -> Void) {
        provider.downloadProducts { [weak self] error, data in
            if let products = data {
                self?.products = products.map { ProductViewModel(model: $0) }
            }
            completion(error)
        }
    }

    public var maxPrice: Int {
        return products.map { $0.model.price }.max() ?? 0
    }

    public var minPrice: Int {
        return products.map { $0.model.price }.min() ?? 0
    }

    public var avgPrice: Int {
        let cnt = products.count
        guard cnt > 0 else { return 0 }
        let sum = products
            .map { $0.model.price }
            .reduce(0, + )
        return sum / cnt
    }
}

extension ProductListViewModel: ProductListDataSource {
    
    public func sectionCount() -> Int {
        return 1
    }
    
    public func itemsCount() -> Int {
        return products.count
    }
    
    public func item(byIndex index: Int) -> ProductViewModel {
        return products[index]
    }
}
