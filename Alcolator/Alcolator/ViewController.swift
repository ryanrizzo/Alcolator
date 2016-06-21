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
        print("Slider value changed to \(sender.value)")
        self.beerPercentTextField.resignFirstResponder()
        
        //calculate how much alcohol is in the beers
        let numberOfBeers = CGFloat(self.beerCountSlider.value)
        let ouncesInOneBeerGlass: CGFloat = 12
        let alcoholPercentageOfBeer = CGFloat((self.beerPercentTextField.text! as NSString).floatValue / 100)
        let ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer
        let ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers
        
        //wine equivalence calculations
        let ouncesInOneWineGlass: CGFloat = 5.0
        let alcoholPercentageOfWine: CGFloat = 0.13
        let ouncesOfAlcoholPerWineGlass = ouncesInOneWineGlass * alcoholPercentageOfWine
        let numberOfWineGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal / ouncesOfAlcoholPerWineGlass
        
        var wineText = String()
        
        if (numberOfWineGlassesForEquivalentAlcoholAmount == 1) {
            wineText = NSLocalizedString("glass", comment: "singular glass")
        } else {
            wineText = NSLocalizedString("glasses", comment: "plural of glass")
        }
        
        self.navigationItem.title = "Wine (\(Int(numberOfWineGlassesForEquivalentAlcoholAmount)) \(wineText))"
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        
        self.beerPercentTextField.resignFirstResponder()
        
        //calculate how much alcohol is in the beers
        let numberOfBeers = CGFloat(self.beerCountSlider.value)
        let ouncesInOneBeerGlass: CGFloat = 12.0
        let alcoholPercentageOfBeer = CGFloat((self.beerPercentTextField.text! as NSString).floatValue / 100)
        let ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer
        let ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers
        
        //wine equivalence calculations
        let ouncesInOneWineGlass: CGFloat = 5.0
        let alcoholPercentageOfWine: CGFloat = 0.13
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
        let resultText = "\(Int(numberOfBeers)) \(beerText) (with \((self.beerPercentTextField.text! as NSString).floatValue))% alcohol) contains as much alcohol as \(Int(numberOfWineGlassesForEquivalentAlcoholAmount)) \(wineText) of wine"
        self.resultLabel.text = resultText
    }
    
    @IBAction func tapGestureDidFire(sender: UITapGestureRecognizer) {
        self.beerPercentTextField.resignFirstResponder()
    }
    
}

