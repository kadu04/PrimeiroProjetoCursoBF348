//
//  NameTableViewCell.swift
//  PrimeiroProjetoTableViewBF348
//
//  Created by Ricardo Massaki on 15/03/23.
//

import UIKit

// Receitinha de bolo !!
//Criar a celula
//Criar identifier
//Add identifier na xib
//Criar metodo na Nib
//Criar os elementos e fazer as suas ligacoes
//Configurar Elementos
//Criar metodo de Setup!!!!!

class NameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    static let identifier: String = "NameTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    // awakeFromNib -> É o ciclo de vida da célula -> como se fosse um viewDidLoad
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(name: String) {
        nameLabel.text = name
    }

    // setSelected -> serve para você fazer uma animação, ou interação com a célula. Praticamente NUNCA vai usar, pq dá muito trabalho para configurar. Por esse motivo, pode excluir.
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }
    
}
