//
//  BaseViewController.swift
//  GitHubProfile
//
//  Created by Hassan dad khan on 07/02/2023.
//

import UIKit

class BaseViewController: UIViewController {
    
    var activityIndicator = UIActivityIndicatorView.init(style: .large)
    var isLoading = false {
        didSet {
            setLoader()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        // Do any additional setup after loading the view.
    }
    //MARK: - SetViews
    func setupViews () {
        DispatchQueue.main.async {
            self.activityIndicator.center = .init(x: UIScreen.main.bounds.width/2, y:  UIScreen.main.bounds.height/2)
            self.view.addSubview(self.activityIndicator)
        }
       

    }
    func setLoader()  {
        if isLoading {
            self.view.isUserInteractionEnabled = false
            self.activityIndicator.startAnimating()
        } else {
            self.activityIndicator.stopAnimating()
            self.view.isUserInteractionEnabled = true

        }
    }
    func showErrorMessage(errorMessage: String) {
        self.presentAlertWithTitleAndMessage(title: "",
                                             message: errorMessage, options: "OK",
                                             completion: { completion in
            print("OK Pressed")
        })
    }
    
    //MARK: - IB Action
    @IBAction func backTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}
