//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // initiating CoinManager obgect
    let coinManager = CoinManager()

    @IBOutlet weak var bitcoinLebel: UILabel!
    @IBOutlet weak var curencyLabel: UILabel!
    @IBOutlet weak var curencyPicker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // setting UIViewController as datasourse for the picker
        curencyPicker.dataSource = self
        // setting IUViewController as delegate for curencyPicker
        curencyPicker.delegate = self
        
    }


}


//MARK: - UIPickerViewDataSource
// Extending with UIPicker protocol to pass data from UIViewController to UIPickerView
extension ViewController: UIPickerViewDataSource {
    // Defining numbers of columns
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // Defining number of rows
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // number of rows are taken from coinManager currency array lengs
        return coinManager.currencyArray.count
    }
    
    
}


//MARK: - UIPickerVewDeligate
// Adding PickerView protocol to add titles and detect interaction with it
extension ViewController: UIPickerViewDelegate{
    //Method will return title of row, take it from coinManager
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    // Method return row number that was selected
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurency = coinManager.currencyArray[row]
        coinManager.CoinPrice(for: selectedCurency)
    }
}
