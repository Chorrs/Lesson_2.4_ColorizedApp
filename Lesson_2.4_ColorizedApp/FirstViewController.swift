//
//  FirstViewController.swift
//  Lesson_2.4_ColorizedApp
//
//  Created by Chorrs on 19.10.23.
//

import UIKit

final class FirstViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let firstVC = segue.destination as? SettingsViewController else { return }
        firstVC.delegate = self
        firstVC.backgroundColorFromFirstVC = view.backgroundColor
        
    }
    
    @IBAction func settingsButtomPressed() {
        performSegue(withIdentifier: "show", sender: nil)
    }

}

extension FirstViewController: SettingsViewControllerDelegate {
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
    
}
