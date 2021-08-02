//
//  GeliyoTabBarController.swift
//  GeliyoViper
//
//  Created by Oguz Demırhan on 2.08.2021.
//

import UIKit

class GeliyoTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).withAlphaComponent(0.5)
        tabBar.unselectedItemTintColor = .gray.withAlphaComponent(0.5)
        tabBar.tintColor = .yellow
        geliyoTabbar()
    }
    
    private func geliyoTabbar() {
        let productNav = UINavigationController()
        let productVC = ProductRouter.createModule(navigationController: productNav)
        productNav.viewControllers = [productVC]
        let secondVC = SecondViewController()
        let nav2 = templateNavigationController(image: UIImage(systemName: "circle.grid.3x3.fill")!, rootViewController: secondVC)
        let ThirdVC = ThirdViewController()
        let nav3 = templateNavigationController(image: UIImage(systemName: "bell")!, rootViewController: ThirdVC)
        let ProfileVC = ProfileViewController()
        let nav4 = templateNavigationController(image: UIImage(systemName: "person.fill")!, rootViewController: ProfileVC)
        self.addChild(productNav)
        self.addChild(nav2)
        self.addChild(nav3)
        self.addChild(nav4)
        productNav.tabBarItem.image = UIImage(systemName: "house")
    }
    
    private func templateNavigationController(image:UIImage,rootViewController: UIViewController) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        
        return nav
    }
}
