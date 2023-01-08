//
//  BaseViewController.swift
//  BookMyShowDemo
//
//  Created by Neosoft on 08/01/23.
//

import UIKit

// MARK: - BaseViewController
class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setTitle(title: Constants.navigationTitle, subtitle: Constants.navigationSubTitle)
    }
    
    func showAlert(title: String = Constants.appName, message: String = "", actionTitle: String = Constants.okAlerTitle) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
