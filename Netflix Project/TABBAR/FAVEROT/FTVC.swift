//
//  FTVC.swift
//  Netflix Project
//
//  Created by Manimaran on 2/10/23.
//

import UIKit

class FTVC: UITableViewCell {
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var likebtn: UIButton!
    
    @IBOutlet weak var likeimage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func heartbtn(_ sender: Any) {
        
    }
}
