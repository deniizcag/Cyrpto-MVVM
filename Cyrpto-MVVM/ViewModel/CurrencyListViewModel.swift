//
//  CurrencyViewModel.swift
//  Cyrpto-MVVM
//
//  Created by DenizCagilligecit on 17.12.2020.
//  Copyright © 2020 Deniz Cagilligecit. All rights reserved.
//

import Foundation

class CurrencyListViewModel : NSObject{
    private(set) var currencies =  [Currency]() {
        didSet {
            self.bind()
        }
    }
    
    
    var bind :() -> () = { }
    
    override init() {
        super.init()
        fetchCurrencyData()
    }
    
    func fetchCurrencyData() {
        var arr = [Currency]()
        NetworkManager.shared.getCurrencies { (result) in
            switch result {
            case .success(let currencies):
                
                
                for i in currencies.values {
                    arr.append(i)
                }
                
                
                self.currencies = arr
            case .failure(let error):
                print(error.rawValue)
                
            }
            
        }
    }
    
}
