//
//  Currency.swift
//  Cyrpto-MVVM
//
//  Created by DenizCagilligecit on 17.12.2020.
//  Copyright © 2020 Deniz Cagilligecit. All rights reserved.
//

import Foundation

struct Rates: Decodable {
    let rates: [String:Currency]
 
}


struct Currency: Decodable {
      var name: String
      var unit: String
      var value: Double
  }
