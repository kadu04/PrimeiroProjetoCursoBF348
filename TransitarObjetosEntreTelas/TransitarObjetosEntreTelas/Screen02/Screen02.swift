//
//  Screen02.swift
//  TransitarObjetosEntreTelas
//
//  Created by Ricardo Massaki on 14/03/23.
//

import UIKit

class Screen02: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var lastNameLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var profissionLabel: UILabel!
    
    var ricardo: Pessoa?

    override func viewDidLoad() {
        super.viewDidLoad()
        configScreen02()
    }
        
    func configScreen02() {
        view.backgroundColor = .systemMint
        nameLabel.layer.cornerRadius = 10
        lastNameLabel.layer.cornerRadius = 10
        ageLabel.layer.cornerRadius = 10
        profissionLabel.layer.cornerRadius = 10
        
        nameLabel.clipsToBounds = true
        lastNameLabel.clipsToBounds = true
        ageLabel.clipsToBounds = true
        profissionLabel.clipsToBounds = true
        
        nameLabel.text = ricardo?.nome
        lastNameLabel.text = ricardo?.sobrenome
        ageLabel.text = ricardo?.idade
        profissionLabel.text = ricardo?.profissao
    }
}
