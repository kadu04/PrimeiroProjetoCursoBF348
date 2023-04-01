//
//  SelectionViewController.swift
//  NotificationCenterProtocol
//
//  Created by Ricardo Massaki on 31/03/23.
//

import UIKit

protocol SelectionViewControllerProtocol: AnyObject {
    func tappedMacbook()
    func tappedImac()
}

class SelectionViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var macbookButton: UIButton!
    
    @IBOutlet weak var imacButton: UIButton!
    
    
    weak var delegate: SelectionViewControllerProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func tappedMacbookButton(_ sender: UIButton) {
//        NotificationCenter.default.post(name: .macbook, object: nil)
        delegate?.tappedMacbook()
        // trabalhando com NavigationViewController -> para a tela voltar
        // navigationController?.popViewController(animated: true)
        // trabalhando com Modal -> para a tela voltar
        dismiss(animated: true)
    }
    
    @IBAction func tappedImacButton(_ sender: UIButton) {
//        NotificationCenter.default.post(name: .imac, object: nil)
        delegate?.tappedImac()
        // trabalhando com NavigationViewController -> para a tela voltar
        // navigationController?.popViewController(animated: true)
        // trabalhando com Modal -> para a tela voltar
        dismiss(animated: true)
    }
}
