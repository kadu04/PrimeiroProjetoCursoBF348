//
//  EmptyTableViewCell.swift
//  Roleta
//
//  Created by Ricardo Massaki on 02/04/23.
//

import UIKit

class EmptyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    static let identifier: String = "EmptyTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        backgroundColor = .black
        titleLabel.numberOfLines = 0
        titleLabel.text = "Insira os participantes para iniciar uma roleta russa!"
        titleLabel.textColor = .white
    }
}
