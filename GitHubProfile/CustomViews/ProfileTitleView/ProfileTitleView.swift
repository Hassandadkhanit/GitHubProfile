//
//  ProfileTitleView.swift
//  GitHubProfile
//
//  Created by Hassan dad khan on 16/01/2023.
//

import UIKit
import Combine
enum ProfileTitleIdentifier: String {
    case Overview
    case Repositories
    case Projects
    case Stars
}

protocol ProfileTitleViewDelegate {
    func screenTapped(sender: UIButton,identifier: String, selectedIndex: Int, previousIndex: Int)
}
@IBDesignable
class ProfileTitleView: UIView {

    @IBOutlet weak var screenButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBOutlet weak var backgroundView: UIView!
    var view: UIView?
    var identifier : String = ""
    var delegate: ProfileTitleViewDelegate?
    static var selectedIndex: Int = 0
    static var previousIndex: Int = 0
    
    @IBInspectable var identifierValue : String {
        get {
            return identifier
        }
        set{
            identifier = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupXib()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupXib()
    }
    
    private func setupXib() {
        view = loadViewFromNib()
        view?.frame = bounds
        view?.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        view?.translatesAutoresizingMaskIntoConstraints = true
        addSubview(view ?? UIView())
        
    }
    private func loadViewFromNib() -> UIView{
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return nibView
    }
    
     func isSelected(at selected: Bool) {
        self.backgroundView.backgroundColor = selected ? .black : .white
        self.titleLabel.textColor = selected ? .white : .black
        self.valueLabel.textColor = selected ? .white : .black
    }

    //MARK: - IB Actions

    @IBAction func screenTapped(_ sender: UIButton) {
        ProfileTitleView.previousIndex = ProfileTitleView.selectedIndex
        
        switch identifier {
        case ProfileTitleIdentifier.Overview.rawValue:
            ProfileTitleView.selectedIndex = 0
        case ProfileTitleIdentifier.Repositories.rawValue:
            ProfileTitleView.selectedIndex = 1
        case ProfileTitleIdentifier.Projects.rawValue:
            ProfileTitleView.selectedIndex = 2
        case ProfileTitleIdentifier.Stars.rawValue:
            ProfileTitleView.selectedIndex = 3
        default:
            print("not found!")
        }
        
        delegate?.screenTapped(sender: sender, identifier: self.identifier, selectedIndex: ProfileTitleView.selectedIndex, previousIndex: ProfileTitleView.previousIndex)
    }
    
}
