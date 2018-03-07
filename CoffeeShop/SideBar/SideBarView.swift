//
//  SideBarView.swift
//  CoffeeShop
//
//  Created by TuanVi Phan on 10/29/17.
//  Copyright © 2017 TuanVi Phan. All rights reserved.
//

import UIKit
import Stevia

class SideBarView: UIView {
    
    // MARK: create variables
    let backgroundView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "backgroundCoffee")
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.frame = CGRect.zero
        tableView.register(MenuDetailTableViewCell.self, forCellReuseIdentifier: "SideBarCell")
        tableView.alwaysBounceVertical = false
        tableView.backgroundColor = UIColor.clear
        tableView.separatorColor = UIColor.clear
        tableView.allowsSelection = true
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    // MARK: life cycle
    convenience init() {
        self.init(frame: CGRect.zero)
        
        render()
    }
    
    private func render() {
        sv(
            backgroundView,
            tableView
        )
        
        backgroundView.fillContainer()
        
        tableView.Top == self.CenterY - 100
        tableView.Left == self.Left
        tableView.Right == self.Right
        tableView.Bottom == self.Bottom
    }
}
