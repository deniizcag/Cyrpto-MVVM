//
//  ViewController.swift
//  Cyrpto-MVVM
//
//  Created by DenizCagilligecit on 17.12.2020.
//  Copyright © 2020 Deniz Cagilligecit. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    var currencyViewModel : CurrencyListViewModel!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    
        return currencyViewModel.currencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CyrptoCellID", for: indexPath) as! CyrptoCell
        cell.set(currency: currencyViewModel.currencies[indexPath.row])
        
        return cell
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        callViewModeltoUpdateUI()
    }
    
    
    func configureTableView() {
      
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    func callViewModeltoUpdateUI() {
        currencyViewModel = CurrencyListViewModel()
      
        tableView.reloadData()
        
        currencyViewModel.bind = {
            DispatchQueue.main.async {
                self.tableView.reloadData()

            }
        }
    }
    

}

