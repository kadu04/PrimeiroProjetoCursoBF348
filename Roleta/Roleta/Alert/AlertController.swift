//
//  AlertController.swift
//  Roleta
//
//  Created by Ricardo Massaki on 02/04/23.
//

import UIKit

class AlertController {
    
    var controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(ok)
        controller.present(alertController, animated: true)
    }
}

