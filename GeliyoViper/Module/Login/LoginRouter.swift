//
//  LoginRouter.swift
//  GeliyoViper
//
//  Created by Oguz Demırhan on 2.08.2021.
//

import Foundation
import UIKit

final class LoginRouter {
    
    static func createModule() -> LoginViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
        let presenter = LoginPresenter(view: view)
        view.presenter = presenter
        return view
    }
}
