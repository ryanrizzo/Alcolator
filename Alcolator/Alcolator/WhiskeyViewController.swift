//
//  WhiskeyViewController.swift
//  Alcolator
//
//  Created by Ryan Rizzo on 6/17/16.
//  Copyright © 2016 Ryan Rizzo. All rights reserved.
//

import UIKit

class WhiskeyViewController: ViewController {
    
    override func buttonPressed(sender: UIButton) {
        self.beerPercentTextField.resignFirstResponder()
        
        let numberOfBeers = self.beerCountSlider.value
        let ouncesInOneBeerGlass = 12.floatValue
        
        let alcoholPercentageOfBeer = (self.beerPercentTextField.text! as NSString).floatValue / 100
        let ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer
        
        let ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
        
        let ouncesInOneWhiskeyGlass = 1.floatValue  // a 1oz shot
        let alcoholPercentageOfWhiskey = 0.4.floatValue  // 40% is average
        
        let ouncesOfAlcoholPerWhiskeyGlass = ouncesInOneWhiskeyGlass * alcoholPercentageOfWhiskey;
        let numberOfWhiskeyGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal / ouncesOfAlcoholPerWhiskeyGlass;
        
        var beerText = String()
        let wholeBeer = Int(numberOfBeers)
        if (wholeBeer == 1) {
            beerText = NSLocalizedString("beer", comment: "singular beer");
        } else {
            beerText = NSLocalizedString("beers", comment: "plural of beer");
        }
        
        var whiskeyText = String()
        
        if (numberOfWhiskeyGlassesForEquivalentAlcoholAmount == 1) {
            whiskeyText = NSLocalizedString("shot",  comment: "singular shot");
        } else {
            whiskeyText = NSLocalizedString("shots",  comment: "plural of shot");
        }
        
        let wholeNumber = Int(numberOfWhiskeyGlassesForEquivalentAlcoholAmount)
        
        let resultText = "\(wholeBeer) \(beerText) (with \((self.beerPercentTextField.text! as NSString).floatValue)% alcohol) contains as much alcohol as \(wholeNumber) \(whiskeyText) of whiskey."
        self.resultLabel.text = resultText;
        
        
    }
    
    override func sliderValueDidChange(sender: UISlider) {
        self.beerPercentTextField.resignFirstResponder()
        
        let numberOfBeers = self.beerCountSlider.value
        let ouncesInOneBeerGlass = 12.floatValue
        
        let alcoholPercentageOfBeer = (self.beerPercentTextField.text! as NSString).floatValue / 100
        let ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer
        
        let ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
        
        let ouncesInOneWhiskeyGlass = 1.floatValue  // a 1oz shot
        let alcoholPercentageOfWhiskey = 0.4.floatValue  // 40% is average
        
        let ouncesOfAlcoholPerWhiskeyGlass = ouncesInOneWhiskeyGlass * alcoholPercentageOfWhiskey;
        let numberOfWhiskeyGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal / ouncesOfAlcoholPerWhiskeyGlass;
        
        var whiskeyText = String()
        
        if (numberOfWhiskeyGlassesForEquivalentAlcoholAmount == 1) {
            whiskeyText = NSLocalizedString("shot",  comment: "singular shot");
        } else {
            whiskeyText = NSLocalizedString("shots",  comment: "plural of shot");
        }
        
        let wholeNumber = Int(numberOfWhiskeyGlassesForEquivalentAlcoholAmount)
        
        self.navigationItem.title = "Whiskey (\(numberOfWhiskeyGlassesForEquivalentAlcoholAmount) \(whiskeyText))"
        
        self.tabBarItem.badgeValue = "\(wholeNumber)"
    }
    
    
    
}
