//
//  ShowSearchViewController.swift
//  GetMyShows
//
//  Created by Nirvaid Rathore on 14/04/22.
//

import UIKit

protocol ShowSearchViewDelegate {
    func updateState(states : States)
}

final class ShowSearchViewController: UIViewController {
    var viewModel : ShowSearchViewModelType?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBar.delegate = self
        self.tableView.delegate = self
        self.tableView.dataSource = self.viewModel?.showSearchDataSource
        self.tableView.register(UINib(nibName: String(describing: ShowSearchTableViewCell.self), bundle: Bundle(for: ShowSearchTableViewCell.self)), forCellReuseIdentifier: String(describing: ShowSearchTableViewCell.self))
        
        self.viewModel?.viewControllerDelegate = self
        // Do any additional setup after loading the view.
    }
    
    convenience init(viewModel : ShowSearchViewModelType){
        self.init(nibName: String(describing: ShowSearchViewController.self),
                       bundle: Bundle(for: ShowSearchViewController.self))
        self.viewModel = viewModel
    }
}

extension ShowSearchViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel?.showSelected(atIndex: indexPath)
    }
}

extension ShowSearchViewController : ShowSearchViewDelegate {
    func updateState(states: States) {
        switch states {
        case .Loading:
            print("Loading")
        case .Success:
            print("Success")
            updateSuccess()
        case .Failure:
            print("Failure")
        }
    }
    
    func updateSuccess() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension ShowSearchViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("search btn clicked")
        self.searchBar.resignFirstResponder()
        
        guard let seachString = searchBar.text else {return}
        
        self.viewModel?.searchShows(searchString: seachString)
    }
}
