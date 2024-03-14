//
//  MainViewController.swift
//  AutoTrackerApp
//
//  Created by OSIIOSdev on 05.03.2024.
//

import UIKit

final class MainViewController: UIViewController {
    // MARK: @IBOutlets
    @IBOutlet var userNameButtonItem: UIBarButtonItem!
    
    @IBOutlet var modelLabel: UILabel!
    @IBOutlet var VINLabel: UILabel!
    @IBOutlet var carDescriptionLabel: UILabel!
    @IBOutlet var VINDescriptionLabel: UILabel!
    
    @IBOutlet var changeDetailButton: UIButton!
    
    @IBOutlet var firstDetailNameLabel: UILabel!
    @IBOutlet var firstDetailArticleLabel: UILabel!
    @IBOutlet var firstDetailTimeReplaceLabel: UILabel!
    @IBOutlet var firstDetailReplaceUrgencyLabel: UILabel!
    
    @IBOutlet var secondDetailNameLabel: UILabel!
    @IBOutlet var secondDetailArticleLabel: UILabel!
    @IBOutlet var secondDetailTimeReplaceLabel: UILabel!
    @IBOutlet var secondDetailReplaceUrgencyLabel: UILabel!
    
    // MARK: - Private Properties
    var user = ""
    
    //MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBarFont(for: userNameButtonItem)
        userNameButtonItem.title = user
        
        setupLabelCounfiguration()
        
        setupButtonConfiguration(button: changeDetailButton)
    }
    
    // MARK: - @IBAction Methods
    @IBAction func detailsButtonPressed() {
        
    }
    
    // MARK: - Private Methods
    private func setupNavigationBarFont(for item: UIBarButtonItem) {
        let navBarAppearance = UINavigationBarAppearance()
        
        navBarAppearance.buttonAppearance.normal.titleTextAttributes = [.font: UIFont(name: "TTNorms-Medium", size: 18) ?? .systemFont(ofSize: 18)]
        navBarAppearance.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Colfax-Bold", size: 26) ?? .boldSystemFont(ofSize: 26)]
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
    }
    
    private func setupLabelCounfiguration() {
        let labels = [modelLabel, VINLabel, carDescriptionLabel, VINDescriptionLabel,
                      firstDetailNameLabel, firstDetailArticleLabel, firstDetailTimeReplaceLabel, firstDetailReplaceUrgencyLabel,
                      secondDetailNameLabel, secondDetailArticleLabel, secondDetailTimeReplaceLabel, secondDetailReplaceUrgencyLabel]
        
        for label in labels {
            switch label {
            case modelLabel, VINLabel, VINDescriptionLabel:
                label?.font = UIFont(name: "TTNorms-Regular", size: 18)
            case carDescriptionLabel:
                label?.font = UIFont(name: "TTNorms-Medium", size: 18)
            case firstDetailNameLabel, firstDetailArticleLabel, firstDetailTimeReplaceLabel, firstDetailReplaceUrgencyLabel, secondDetailNameLabel, secondDetailArticleLabel, secondDetailTimeReplaceLabel, secondDetailReplaceUrgencyLabel:
                label?.font = UIFont(name: "TTNorms-Regular", size: 13)
            default:
                return
            }
        }
    }
    
    private func setupButtonConfiguration(button: UIButton) {
        button.layer.cornerRadius = 15
        button.backgroundColor = #colorLiteral(red: 0.9725490212, green: 0.9725490212, blue: 0.9725490212, alpha: 1)
        button.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.5)
        button.layer.shadowOpacity = 0.25
        button.layer.shadowRadius = 5.0
        button.layer.masksToBounds = false
    }
}
