//
//  ViewController.swift
//  NotificationCenterProtocol
//
//  Created by Ricardo Massaki on 31/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var chooseButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configColorEndText()
        configObserver()
        configTableView()
        
    }
    
    func configObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateImac), name: .imac, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateMacbook), name: .macbook, object: nil)
    }
    
    func configTableView() {
        chooseButton.layer.cornerRadius = 14
    }
    
    @objc func updateImac() {
        logoImageView.image = UIImage(named: "imac_pro")
        nameLabel.text = "Imac das galáxias"
        view.backgroundColor = .systemCyan
    }
    
    @objc func updateMacbook() {
        logoImageView.image = UIImage(named: "macbook_pro")
        nameLabel.text = "MacBook Pro"
        view.backgroundColor = .systemRed
    }
    
    func configColorEndText() {
        view.backgroundColor = .black
        nameLabel.text = ""
    }
    
    
    
    
    @IBAction func tappedChooseButton(_ sender: UIButton) {
        // describing:  -> transformando o nome da classe (SelectionViewController) em um "String"
        // É bom usar o describing, para eliminar as "Strings mágicas"aí não precisa criar "Enuns"
        let vc = storyboard?.instantiateViewController(withIdentifier: String(describing: SelectionViewController.self)) as? SelectionViewController
        vc?.modalPresentationStyle = .fullScreen
        vc?.delegate = self
        present(vc ?? UIViewController(), animated: true)
    }
}

extension ViewController: SelectionViewControllerProtocol {
    func tappedMacbook() {
        logoImageView.image = UIImage(named: "macbook_pro")
        nameLabel.text = "MacBook Pro"
        view.backgroundColor = .systemRed
    }
    
    func tappedImac() {
        logoImageView.image = UIImage(named: "imac_pro")
        nameLabel.text = "Imac das galáxias"
        view.backgroundColor = .systemCyan
    }
    

}


