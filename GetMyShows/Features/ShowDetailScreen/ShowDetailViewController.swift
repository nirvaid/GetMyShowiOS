//
//  ShowDetailViewController.swift
//  GetMyShows
//
//  Created by user220159 on 4/28/22.
//

import UIKit

protocol ShowDetailViewDelegate{
    func updateShowDetails(showDetail : DisplayShowDetails)
    var showDetailViewModel : ShowDetailViewModelType? {get set}
}

final class ShowDetailViewController: UIViewController , ShowDetailViewDelegate {
    var showDetailViewModel : ShowDetailViewModelType?
    
    @IBOutlet weak var showDescreptionLabel: UITextView!
    @IBOutlet weak var showStatusLabel: UILabel!
    @IBOutlet weak var showGeneresLabel: UILabel!
    @IBOutlet weak var showLanguageLabel: UILabel!
    @IBOutlet weak var showNameLabel: UILabel!
    @IBOutlet weak var showTypeLabel: UILabel!
    @IBOutlet weak var showImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showDetailViewModel?.viewControllerDelegate = self
        self.showDetailViewModel?.updateShowDetails()
        // Do any additional setup after loading the view.
    }
    
    convenience init(viewModel : ShowDetailViewModelType) {
        self.init(nibName: String(describing: ShowDetailViewController.self),
                  bundle: Bundle(for: ShowDetailViewController.self))
        self.showDetailViewModel = viewModel
    }
    
    func updateShowDetails(showDetail : DisplayShowDetails)  {
        self.showDescreptionLabel.text = showDetail.descreption
        self.showStatusLabel.text = showDetail.status
        self.showGeneresLabel.text = showDetail.genere.reduce("", { (result, next) -> String in
            if(result.isEmpty){
                return next
            }else{
                return result + " , " + next
            }
        })
        self.showLanguageLabel.text = showDetail.language
        self.showNameLabel.text = showDetail.name
        self.showTypeLabel.text = showDetail.type
        self.showImageView.setImageFromUrl(showDetail.url) { [weak self] in
            self?.view.setNeedsLayout()
        }
    }

}
