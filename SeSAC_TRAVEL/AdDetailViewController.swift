//
//  AdDetailViewController.swift
//  SeSAC_TRAVEL
//
//  Created by 전민돌 on 7/15/25.
//

import UIKit

class AdDetailViewController: UIViewController {

    @IBOutlet var adScriptLabel: UILabel!
    
    var adDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    func configure() {
        adScriptLabel.text = adDescription
        adScriptLabel.font = .boldSystemFont(ofSize: 25)
        adScriptLabel.textAlignment = .center
        adScriptLabel.numberOfLines = 3
    }
    
    @IBAction func xButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
