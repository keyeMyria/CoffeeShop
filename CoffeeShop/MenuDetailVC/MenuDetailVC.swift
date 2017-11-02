//
//  MenuDetailVC.swift
//  CoffeeShop
//
//  Created by TuanVi Phan on 10/29/17.
//  Copyright © 2017 TuanVi Phan. All rights reserved.
//

import UIKit
import Stevia

private let kTableHeaderHeight: CGFloat = 200.0

class MenuDetailVC: UIViewController {
    
    // MARK: create variables
    let coffeeMenus = ["Choco Frappe", "Caramel Frappe", "Kick Frappe", "Cappuccino"]
    
    var headerView: UIView!
    let menuDetailView = MenuDetailView()
    
    var titleNav: String = ""
    
    //MARK: Lifecycle
    override func loadView() {
        view = menuDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = titleNav
        
        leftBarButtonItem()
        
        menuDetailView.tableView.tableHeaderView = menuDetailView.tableView.tableHeaderView
        
        headerView = menuDetailView.tableView.tableHeaderView
        menuDetailView.tableView.tableHeaderView = nil
        menuDetailView.tableView.addSubview(headerView)
        menuDetailView.tableView.contentInset = UIEdgeInsetsMake(kTableHeaderHeight, 0, 0, 0)
        menuDetailView.tableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)
        
        automaticallyAdjustsScrollViewInsets = false
        menuDetailView.tableView.dataSource = self
        menuDetailView.tableView.delegate = self
        
        updateHeaderView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.hidesBarsOnSwipe = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:WHITE]
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.tintColor = UIColor.white
        setStatusBarColor(UIBarStyle.blackTranslucent)
    }
    
    override func viewDidLayoutSubviews() {
        updateHeaderView()
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    // MARK: create functions
    // Left Bar Button Item
    private func leftBarButtonItem() {
        
        let leftButton = UIButton(type: .custom)
        leftButton.setImage(UIImage(named: "back")?.withRenderingMode(.alwaysTemplate), for: UIControlState())
        leftButton.tintColor = WHITE
        leftButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        leftButton.addTarget(self, action: #selector(self.leftButtonTapped), for: .touchUpInside)
        let leftBarButton = UIBarButtonItem(customView: leftButton)
        self.navigationItem.leftBarButtonItem = leftBarButton
    }
    
    @objc func leftButtonTapped(){
        navigationController?.popViewController(animated: true)
    }
    
    private func updateHeaderView() {
        
        var headerRect = CGRect(x: 0, y: -kTableHeaderHeight, width: menuDetailView.tableView.bounds.width, height: kTableHeaderHeight)
        
        headerRect.origin.y = menuDetailView.tableView.contentOffset.y
        headerRect.size.height = -menuDetailView.tableView.contentOffset.y
        
        headerView.frame = headerRect
    }
}

extension MenuDetailVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuDetailTVCell", for: indexPath) as! MenuDetailTableViewCell
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let productDetailVC = ProductDetailVC()
        self.navigationController?.pushViewController(productDetailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
