//
//  ViewController.swift
//  Lesson_2.4_ColorizedApp
//
//  Created by Chorrs on 29.09.23.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func setColor(_ color: UIColor)
}

final class SettingsViewController: UIViewController {
    
    @IBOutlet weak var colorizedView: UIView!
    
    @IBOutlet weak var redTracker: UILabel!
    @IBOutlet weak var greenTracker: UILabel!
    @IBOutlet weak var blueTracker: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    var backgroundColorFromFirstVC: UIColor!

    
    weak var delegate: SettingsViewControllerDelegate!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        colorizedView.layer.cornerRadius = 15
        minimumTrackColorsForSliders()
        
        navigationItem.hidesBackButton = true
        
        colorizedView.backgroundColor = backgroundColorFromFirstVC
        
        installTrackersValues()
        
        setTrackerFormat(tracker: redTracker, slider: redSlider)
        setTrackerFormat(tracker: greenTracker, slider: greenSlider)
        setTrackerFormat(tracker: blueTracker, slider: blueSlider)

    }
    
    @IBAction func redSliderAction() {
        setTrackerFormat(tracker: redTracker, slider: redSlider)
        installSlidersBackgroungColor()
    }
    
    @IBAction func greenSliderAction() {
       setTrackerFormat(tracker: greenTracker, slider: greenSlider)
        installSlidersBackgroungColor()
    }
    
    @IBAction func blueSliderAction() {
        setTrackerFormat(tracker: blueTracker, slider: blueSlider)
        installSlidersBackgroungColor()
    }
    
    private func minimumTrackColorsForSliders() {
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
    }
    
    private func installSlidersBackgroungColor() {
        colorizedView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
        
        delegate.setColor(UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1))
    }
    
    private func setTrackerFormat(tracker: UILabel, slider: UISlider ) {
        tracker.text = String(format: "%.2f", slider.value)
    }
    
    private func installTrackersValues() {
        let ciiColor = CIColor(color: backgroundColorFromFirstVC)
        redSlider.value = Float(ciiColor.red)
        greenSlider.value = Float(ciiColor.green)
        blueSlider.value = Float(ciiColor.blue)
    }
    
    @IBAction func doneButtonPressed() {
        dismiss(animated: true)
    }
    
    
}

