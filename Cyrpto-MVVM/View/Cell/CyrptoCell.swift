//
//  CyrptoCell.swift
//  Cyrpto-MVVM
//
//  Created by DenizCagilligecit on 17.12.2020.
//  Copyright © 2020 Deniz Cagilligecit. All rights reserved.
//

import UIKit

class CyrptoCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var unit: UILabel!
    @IBOutlet weak var price: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func set(currency: Currency) {
        name.text = currency.name
        unit.text = currency.unit
        price.text = String(format: "%.2f",currency.value)
    }
}
