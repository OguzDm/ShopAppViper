//
//  LoginViewController.swift
//  Geliyo
//
//  Created by Oguz Demırhan on 30.07.2021.
//

import UIKit
protocol LoginViewInterface: AnyObject {
    func prepareUI()
}

class LoginViewController: UIViewController {
    
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    var presenter: LoginPresenterInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidload()
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        if mailTextField.text == "demo@geliyo.com" && passwordTextField.text == "123456**" {
            let mainTabController = GeliyoTabBarController()
            mainTabController.modalPresentationStyle = .fullScreen
            present(mainTabController, animated: true, completion: nil)
        }
        else {
            let alert = UIAlertController(title: "Hata", message: "Mail ya da şifre girişi hatalı", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}

extension LoginViewController: LoginViewInterface {
    func prepareUI() {
        mailTextField.makeRoundedAndShadow()
        passwordTextField.makeRoundedAndShadow()
        loginButton.layer.cornerRadius = loginButton.bounds.height / 2
    }
}


