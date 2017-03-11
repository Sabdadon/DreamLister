//
//  MainVC.swift
//  DreamLister
//
//  Created by sabarish sridhar on 09/03/17.
//  Copyright © 2017 sabarish. All rights reserved.
//

import UIKit

class MainVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    
}

t
