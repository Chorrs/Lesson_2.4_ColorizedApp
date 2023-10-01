//
//  ViewController.swift
//  Lesson_2.4_ColorizedApp
//
//  Created by Chorrs on 29.09.23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var colorizedView: UIView!
    
    @IBOutlet weak var redTracker: UILabel!
    @IBOutlet weak var greenTracker: UILabel!
    @IBOutlet weak var blueTracker: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    
    @IBOutlet weak var ь: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorizedView.layer.cornerRadius = 15
        
        minimumTrackColorsForSliders()
        
    }
    
    @IBAction func redSliderAction() {
        redTracker.text = String(format: "%.2f", redSlider.value)
        installSlidersBackgroungColor()
    }
    
    @IBAction func greenSliderAction() {
        greenTracker.text = String(format: "%.2f", greenSlider.value)
        installSlidersBackgroungColor()
    }
    
    @IBAction func blueSliderAction() {
        blueTracker.text = String(format: "%.2f", blueSlider.value)
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
    }
}

