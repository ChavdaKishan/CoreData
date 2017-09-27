//
//  MyCell.swift
//  CoreDataDemo
//
//  Created by iFlame on 9/26/17.
//  Copyright © 2017 iflame. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell
{
    @IBOutlet weak var Lbl1: UILabel!
    @IBOutlet weak var Lbl2: UILabel!
    @IBOutlet weak var Lbl3: UILabel!
    @IBOutlet weak var Lbl4: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
}
