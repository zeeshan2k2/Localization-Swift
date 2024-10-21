//
//  ViewController.swift
//  Localization
//
//  Created by ali on 30/09/2024.
//

import UIKit


let localizeUserDefaultKey = "localizeUserDefaultKey"
var localizeDefaultLanguage = "en"

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLbl: UILabel!
    
    @IBOutlet weak var enBtn: UIButton!
    
    @IBOutlet weak var tkBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        localizeDefaultLanguage = UserDefaults.standard.string(forKey: localizeUserDefaultKey) ?? "en"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        refreshLanguage()
    }
    
    private func refreshLanguage() {
        displayLbl.text = "message".translated()
    }
    
    @IBAction func englishButtonTapped(_ sender: Any) {
        localizeDefaultLanguage = "en"
        UserDefaults.standard.setValue(localizeDefaultLanguage, forKey: localizeUserDefaultKey)
        refreshLanguage()
    }
    
    @IBAction func turkishButtonTapped(_ sender: Any) {
        localizeDefaultLanguage = "tr"
        UserDefaults.standard.setValue(localizeDefaultLanguage, forKey: localizeUserDefaultKey)
        refreshLanguage()
    }
}



extension String {
    func translated() -> String {
        if let path = Bundle.main.path(forResource: localizeDefaultLanguage, ofType: "lproj"), let bundle = Bundle(path: path) {
            return NSLocalizedString(self, bundle: bundle, comment: "")
        }
        
        return ""
    }
}


