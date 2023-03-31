//
//  TabBarController.swift
//  DesafioTabBarBF348
//
//  Created by Ricardo Massaki on 30/03/23.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    func configItems() {
        guard let items = tabBar.items else { return }
        items[0].title = "Tela 01"
        items[0].image = UIImage(named: "apple.logo")
    }
    
    func configTabBar() {
        tabBar.layer.borderWidth = 0.5
        tabBar.layer.borderColor = UIColor.black.cgColor
        tabBar.backgroundColor = .white
    }
    

}
