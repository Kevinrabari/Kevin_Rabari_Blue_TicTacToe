//
//  Kevin_TableViewCell.swift
//  Kevin_Rabari_Blue_TicTacToe
//
//  Created by Kevin Rabari on 2022-02-07.
//

import UIKit

class Kevin_TableViewCell: UITableViewCell {
    
    
    //Mark:- Class Variable
    var gameData : GameData?
    
    //Mark-Outlets
    
    @IBOutlet weak var winLossImage: UIImageView!
    
    @IBOutlet weak var whoWon: UILabel!
    
    
    @IBOutlet weak var dateTimeLable: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
