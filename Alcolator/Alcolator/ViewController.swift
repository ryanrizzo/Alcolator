//
//  ViewController.swift
//  Alcolator
//
//  Created by Ryan Rizzo on 6/16/16.
//  Copyright © 2016 Ryan Rizzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var beerPercentTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func textFieldDidChange(sender: UITextField) {
        let enteredText = sender.text
        let enteredNumber = (enteredText! as NSString).floatValue
        if (enteredNumber == 0){
            sender.text = nil;
        }
    }
    
    @IBOutlet weak var beerCountSlider: UISlider!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func sliderValueDidChange(sender: UISlider) {
        print("Slider valie changed to \(sender.value)")
        self.beerPercentTextField.resignFirstResponder()
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        
        self.beerPercentTextField.resignFirstResponder()
        
        //calculate how much alcohol is in the beers
        let numberOfBeers = self.beerCountSlider.value
        let ouncesInOneBeerGlass = 12.floatValue
        let alcoholPercentageOfBeer = (self.beerPercentTextField.text! as NSString).floatValue / 100
        let ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer
        let ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers
        
        //wine equivalence calculations
        let ouncesInOneWineGlass = 5.floatValue
        let alcoholPercentageOfWine = 0.13.floatValue
        let ouncesOfAlcoholPerWineGlass = ouncesInOneWineGlass * alcoholPercentageOfWine
        let numberOfWineGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal / ouncesOfAlcoholPerWineGlass
        
        var beerText = String()
        
        if (numberOfBeers == 1) {
            beerText = NSLocalizedString("beer", comment: "singular beer")
        } else {
            beerText = NSLocalizedString("beers", comment: "plural of beer")
        }
        
        var wineText = String()
        
        if (numberOfWineGlassesForEquivalentAlcoholAmount == 1) {
            wineText = NSLocalizedString("glass", comment: "singular glass")
        } else {
            wineText = NSLocalizedString("glasses", comment: "plural of glass")
        }
        
        //generate result text, display it on label
        let resultText = "\(numberOfBeers) \(beerText) (with \((self.beerPercentTextField.text! as NSString).floatValue)% alchol) contains as much alcohol as \(numberOfWineGlassesForEquivalentAlcoholAmount) \(wineText) of wine"
        self.resultLabel.text = resultText
    }
    
    @IBAction func tapGestureDidFire(sender: UITapGestureRecognizer) {
        self.beerPercentTextField.resignFirstResponder()
    }
    
}

