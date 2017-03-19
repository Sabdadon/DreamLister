//
//  ItemCell.swift
//  DreamLister
//
//  Created by sabarish sridhar on 11/03/17.
//  Copyright © 2017 sabarish. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var details: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var thumb: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    
    func configureCell(item: Item){
    
    title.text = item.title
        price.text = "$ \(item.price)"
        details.text = item.details
    }
}
