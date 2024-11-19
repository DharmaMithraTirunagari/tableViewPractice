//
//  SongCell.swift
//  tableViewPractice
//
//  Created by Srikanth Kyatham on 11/18/24.
//

import UIKit

class SongCell: UITableViewCell {

    @IBOutlet weak var songImageView: UIImageView!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(with title: String, subtitle: String, imageName: String) {
            titleLabel.text = title
            subtitleLabel.text = subtitle
//            songImageView.image = UIImage(named: imageName)  // Assuming image is in assets
        songImageView.image = UIImage(named: imageName) ?? UIImage(systemName: "music.note")
        }

}
