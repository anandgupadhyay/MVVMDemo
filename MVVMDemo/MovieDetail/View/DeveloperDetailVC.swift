//
//  DeveloperDetailVC.swift
//  DeveloperDetailVC
//
//  Created by Anand Upadhyay on 09/12/22.
//  Copyright © 2012 Anand All rights reserved.
//

import UIKit

class DeveloperDetailVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var developerImageView: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var joiningDateLabel: UILabel!
    @IBOutlet weak var incomeLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var favButton: UIButton!
    
    private var viewModel = DeveloperVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1 - viewDidLoad() of DeveloperDetailVC called.")
        viewModel.viewDidLoad()
        setUpUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setUpUI() {
        nameLabel.text = viewModel.name
        joiningDateLabel.text = viewModel.joiningDate
        locationLabel.text = viewModel.location
        incomeLabel.text = viewModel.income
        ratingLabel.text = viewModel.rating
        developerImageView.image = UIImage(named: viewModel.image)
        setHeartButtonUI()
    }
    
    private func setHeartButtonUI() {
        let heartImage = viewModel.isAvilable ? UIImage("") : UIImage("")
        favButton.setImage(heartImage, for: .normal)
    }
    
    @IBAction func markMovieAsFav(_ sender: Any) {
        print("\n\n\n---------- Mark Favorite Button Press Flow ---------\n")
        print("1 - Mark movie as favorite button tap called in MovieDetailController.")
        viewModel.markFavorite()
        print("4 - Heart button UI is set as per user selection.")
        setHeartButtonUI()
    }
    
}

