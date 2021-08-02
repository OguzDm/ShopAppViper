//
//  LoginPresenter.swift
//  GeliyoViper
//
//  Created by Oguz Demırhan on 2.08.2021.
//

import Foundation
protocol LoginPresenterInterface {
    func viewDidload()
}

final class LoginPresenter {
    weak var view: LoginViewInterface?
    init(view: LoginViewInterface?) {
        self.view = view
    }
}

extension LoginPresenter: LoginPresenterInterface {
    
    func viewDidload() {
        view?.prepareUI()
    }
}
