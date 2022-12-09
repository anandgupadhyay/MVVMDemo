//
//  DeveloperVM.swift
//  DeveloperVM
//
//  Created by Anand 9/12/22
//  Copyright © 2022 Anand All rights reserved.
//

import Foundation

class DeveloperVM {
    
    //MARK: Outputs
    
    //The variables value can only be set from view model.
    private (set) var name, joiningDate, income, location, image, rating: String!
    private (set) var isAvilable: Bool!
    
    //Data Model of the ViewModel
    private var developer: Developer! = nil
    
    ////MARK: Input to View Model
    var markFavorite: () -> () = { }
    
    //Communication type - 1 using functions
    func viewDidLoad()
    {
        print("2 - DeveloperVM is informed of the view load")
        configureDataModel(data: developerData())
        print("3 - Data Model of view model is configured by passing developer data to configureDataModel(data:)")
        configureOutput()
        
        //Communication type - 2 using closures
        markFavorite = { [weak self] in
            print("2 - View Model is informed of favorite button press via closure.")
            guard let _self = self else { return }
            print("3 - View Model changes the state of favorite selction.")
            _self.isAvilable = !_self.isAvilable
        }
    }
    
    
    //Consider this as a data providing API request in general app environment.
    private func developerData() -> [String: Any] {
        return self.getDev()
    }
    
    //Configure the data model required for the UI population.
    private func configureDataModel(data: [String: Any]) {
        developer = Developer(data: data)
    }
    
    //Configure the output properties that are to be accessed by the view.
    private func configureOutput() {
        print("4 - Outputs of view model are configured and stored in respective properties.")
        //attch data to UI or relative assigners
    }
    
    
}

extension DeveloperVM{
    
    static func getDev() -> [String: Any] {
        let dateFormatter = DateFormatter()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let releaseDate = dateFormatter.date(from: "2017-11-17") as Any
        return ["name": "Anand Upadhyay", "joiningDate": releaseDate, "income": "INR 100000"  ,"isAvilable": false , "location": "Zack Synder" , "image": "", "rating": 9.2]
    }
    
    //Process raw date data for output.
    private func releaseDisplayDataForDeveloper() -> String {
        print("5 - Data of Developer Joining date processed for display woth proper date format.")
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter.string(from: developer.joiningDate)
    }
    
    //Process raw rating data for output.
    private func ratingDisplayDataForDeveloper() -> String {
        print("6 - Rating is processed for display.")
        return "\(developer.rating)/10.0"
    }
}

