//
//  TableViewCell.swift
//  DesafioTabBarBF348
//
//  Created by Ricardo Massaki on 30/03/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var personImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    static let identifier: String = "TableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        personImageView.tintColor = .black
        selectionStyle = .none
        
    }
    
    func setupCell(user: User) {
        personImageView.image = user.image
        nameLabel.text = user.name
    }
}
