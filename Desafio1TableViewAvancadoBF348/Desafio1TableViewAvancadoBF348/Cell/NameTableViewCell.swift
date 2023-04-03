//
//  NameTableViewCell.swift
//  Desafio1TableViewAvancadoBF348
//
//  Created by Ricardo Massaki on 20/03/23.
//

import UIKit

class NameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var faceImageView: UIImageView!
    
    static let identifier: String = "NameTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func setupCell(data: User) {
        nameLabel.text = data.name
        faceImageView.image = data.image
        
    }
}
