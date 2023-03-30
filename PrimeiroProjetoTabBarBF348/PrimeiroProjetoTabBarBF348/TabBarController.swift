//
//  TabBarController.swift
//  PrimeiroProjetoTabBarBF348
//
//  Created by Ricardo Massaki on 30/03/23.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configItems()
        configTabBar()
    }
    
    func configItems() {
        
        guard let items = tabBar.items else { return }
        items[0].title = "Tela 01"
        items[0].image = UIImage(systemName: "square.and.arrow.up.on.square.fill")
        
        items[0].title = "Tela 02"
        items[0].image = UIImage(systemName: "circle.tophalf.filled")
        
        items[0].title = "Tela 03"
        items[0].image = UIImage(systemName: "circle.righthalf.filled")
    }
    
    func configTabBar() {
        tabBar.layer.borderWidth = 2.0
        tabBar.layer.borderColor = UIColor.black.cgColor
        tabBar.backgroundColor = .white
    }
    
}
