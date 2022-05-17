//
//  ShowSearchTableViewCell.swift
//  GetMyShows
//
//  Created by Nirvaid Rathore on 14/04/22.
//

import UIKit

class ShowSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var showLanguageLabel: UILabel!
    @IBOutlet weak var showGenereLabel: UILabel!
    @IBOutlet weak var showImageView: UIImageView!
    @IBOutlet weak var showNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.layer.cornerRadius = 8.0
        contentView.backgroundColor = UIColor.clear
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.clear.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    func configure(displayShow : DisplayShows){
        self.showNameLabel.text = displayShow.name
        self.showLanguageLabel.text = displayShow.language
        
        if (displayShow.genere.isEmpty){
            self.showGenereLabel.text = "N/A"
        } else {
            var genereString = String()
        
            for (index, element) in displayShow.genere.enumerated() {
                print("Item \(index): \(element)")
                if(index == 0 ){
                    genereString = element
                }else{
                    genereString = genereString + " , " + element
                }
            }
            self.showGenereLabel.text = genereString
        }
        
        self.showImageView.setImageFromUrl(displayShow.url) { [weak self] in
            self?.setNeedsLayout()
        }
    }
    
}
