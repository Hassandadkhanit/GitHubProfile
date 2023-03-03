//
//  RepositoriesTableViewCell.swift
//  GitHubProfile
//
//  Created by Hassan dad khan on 21/02/2023.
//

import UIKit

class RepositoriesTableViewCell: UITableViewCell {
    @IBOutlet weak var forkView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visibilityLabel: UILabel!
    @IBOutlet weak var updatedDateTimeLabel: UILabel!
    @IBOutlet weak var forkLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var languageView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.titleLabel.font = UIFont.robotoBold(fontSize: 22)
        self.descLabel.font = UIFont.robotoRegular(fontSize: 16)
        self.forkLabel.font = UIFont.robotoRegular(fontSize: 16)
        self.updatedDateTimeLabel.font = UIFont.robotoRegular(fontSize: 16)
    }
   
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setData (repObj: RepoModel){
        titleLabel.text = repObj.name ?? ""
        descLabel.text = repObj.description ?? ""
        visibilityLabel.text = repObj.visibility ?? ""
        languageLabel.text = repObj.language ?? "(not found)"

        languageView.isHidden = repObj.language?.isBlank ?? false ? true : false

       
        forkLabel.text = "\(repObj.forks_count ?? 0)"
        updatedDateTimeLabel.text = "Updated on \(repObj.updated_at?.convertDate(fromFormate: Constants.dateFormate, toFormate: Constants.dateFormate2) ?? "")"

    }
    
}
