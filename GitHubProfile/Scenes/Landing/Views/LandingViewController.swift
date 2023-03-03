//
//  LandingViewController.swift
//  GitHubProfile
//
//  Created by Hassan dad khan on 29/06/2022.
//

import UIKit
import Combine

class LandingViewController: BaseViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    private var viewModel : LandingViewModelProtocol?
    var subscription = Set<AnyCancellable>()

    init(viewModel: LandingViewModelProtocol = LandingViewModel()) {
        super.init(nibName: String(describing: LandingViewController.self), bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Binding Publishers
        self.bindViewModel()
            
        
    }
    //MARK: - Bindings
    func bindViewModel() {
        viewModel?.isLoadingResultPublisher
            .assign(to: \.isLoading, on: self)
            .store(in: &subscription)
        
        bindUser()
        
    }
    func bindUser() {
      _ =  viewModel?.userPublisher
            .receive(on: RunLoop.main)
            .sink { _ in
                
            }
            .store(in: &subscription)

      _ =  viewModel?.userResultPublisher
            .sink(receiveValue: { [weak self] result in
                switch result {
                case .failure(let error):
                    self?.showErrorMessage(errorMessage: error.localizedDescription)
                    break
                case .success(let user):
                    if let userData = user {
                        self?.navigationController?.openProfileVC(user: userData)
                    }
                    break
                case .none:
                    print("none")
                }
            }).store(in: &subscription)
        
    }
   
    //MARK: - API Calling
    func getUserData() {
        viewModel?.getUserData(userName: usernameTextField.text ?? "")
    }
    //MARK: -  IBAction
    @IBAction func submitTapped(_ sender: UIButton) {
        if viewModel?.isUsernameValid(userName: usernameTextField.text ?? "") ?? false {
            self.getUserData()
        } else {
            self.showErrorMessage(errorMessage: "Username is not valid!")
        }
    }
    
}
