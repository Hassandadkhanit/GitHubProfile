//
//  ProfileViewController.swift
//  GitHubProfile
//
//  Created by Hassan dad khan on 10/10/2022.
//

import UIKit
import Combine

class ProfileViewController: BaseViewController {

    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var FollowingsLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    var viewModel: ProfileViewModelProtocol?
    var subscription = Set<AnyCancellable>()

    //MARK: - Init
    init(viewModel: ProfileViewModelProtocol = ProfileViewModel()) {
        super.init(nibName: String(describing: ProfileViewController.self), bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.bindViewMode()
        // Do any additional setup after loading the view.
        self.setData()
        self.getRepoList()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    //MARK: - Setup
    func setData() {
        self.profileImageView.setImage(withUrl: self.viewModel?.user?.avatar_url ?? "", withPlaceHolder: "")
        self.nameLabel.text = self.viewModel?.user?.name ?? "(name)"
        self.companyLabel.text = self.viewModel?.user?.company ?? "(company)"
        self.locationLabel.text = self.viewModel?.user?.location ?? "(address)"
        self.emailLabel.text = self.viewModel?.user?.email ?? "(@email)"
        self.followersLabel.text = "Followers - \(self.viewModel?.user?.followers ?? 0)"
        self.FollowingsLabel.text = "Followings - \(self.viewModel?.user?.following ?? 0)"
    }
    
    
    func setupTableView() {
        self.tableView.register(UINib.init(nibName: String(describing: RepositoriesTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: RepositoriesTableViewCell.self))
        self.tableView.separatorStyle = .none
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    //MARK: - Bind ViewModel
    func bindViewMode () {
        self.bindUser()
        self.bindRepoList()
    }
    func bindRepoList() {
        
        viewModel?.isLoadingStatePublisher
            .assign(to: \.isLoading, on: self)
            .store(in: &subscription)
        
        viewModel?.repositoriesListPublisher
            .receive(on: RunLoop.main)
            .sink { [weak self] userResult in
                self?.tableView.reloadData()
            }
            .store(in: &subscription)
      _ =  viewModel?.repositoriesResultPublisher
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] result in
                switch result {
                case .failure(let error):
                    self?.showErrorMessage(errorMessage: error.localizedDescription)
                    break
                case.success(_):
                    break
                default:
                    print("none")
                }
            }).store(in: &subscription)
        
    }
    func bindUser() {
        viewModel?.userResultPublisher
            .receive(on: RunLoop.main)
            .sink { [weak self] RepoResult in
                self?.setData()
            }
            .store(in: &subscription)
    }
    //MARK: - API Calling
    func getRepoList() {
        self.viewModel?.getRepositoriesList(urlString: viewModel?.user?.repos_url ?? "")
    }
   //MARK: - IB Action
    
    @IBAction func profileTapped(_ sender: UIButton) {
        if let obj = self.viewModel?.user {
            guard let url = URL(string: obj.html_url ?? "") else {
                self.showErrorMessage(errorMessage: "URL is not valid!")
              return
            }
            Utilities.openUrl(url: url)
        }
    }
    
}
extension ProfileViewController: UITableViewDataSource,UITableViewDelegate {
    //MARK: - TableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.repositoriesList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RepositoriesTableViewCell.self), for: indexPath) as? RepositoriesTableViewCell {
            if let obj = self.viewModel?.repositoriesList?[indexPath.row] {
                cell.setData(repObj: obj)
                return cell
            }
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let obj = self.viewModel?.repositoriesList?[indexPath.row] {
            guard let url = URL(string: obj.svn_url ?? "") else {
                self.showErrorMessage(errorMessage: "URL is not valid!")
              return
            }
            Utilities.openUrl(url: url)
        }
    }
}
