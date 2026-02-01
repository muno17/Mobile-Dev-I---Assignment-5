//
//  ViewController.swift
//  Assignment 5
//
//  Created by Daniel Muñoz on 1/29/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    
    @IBOutlet weak var storyLabel: UILabel!
    
    var adventureLogic = AdventureLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }


    @IBAction func answerSubmitted(_ sender: UIButton) {
        // disable buttons so user can't click repeatedly
        option1.isEnabled = false
        option2.isEnabled = false
        let userAnswer = sender.titleLabel!.text!
        
        sender.backgroundColor = UIColor.lightGray
        if (adventureLogic.getReset()){
            adventureLogic.setReset(false)
            adventureLogic.setIndex(0)
            Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        } else {
            // This replaces the "messy" line!
            adventureLogic.nextIndex(userAnswer)
        }
        
        checkStatus()
    }

    
    // check whether the game continues or heads to endGame
    @objc func checkStatus() {
        if (adventureLogic.getEnder()) {
            updateText()
            option1.backgroundColor = UIColor.clear
            option2.backgroundColor = UIColor.clear
            Timer.scheduledTimer(timeInterval: 8, target: self, selector: #selector(endGame), userInfo: nil, repeats: false)
        } else {
            Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        }
    }
    
    
    // update the storyline and events based on option selected
    @objc func updateUI() {
        // load next part of story
        updateText()
        
        option1.backgroundColor = UIColor(named: "SpacePurple")
        option2.backgroundColor = UIColor(named: "SpacePurple")
        
        option1.isEnabled = true
        option2.isEnabled = true
    }
    
    func updateText() {
        storyLabel.text = adventureLogic.getTitle()
        option1.setTitle(adventureLogic.getChoice1(), for: .normal)
        option2.setTitle(adventureLogic.getChoice2(), for: .normal)
    }
    
    
    // display result depending on status of survived
    @objc func endGame() {
        option2.setTitle("Play Again", for: .normal)
        option2.backgroundColor = UIColor(named: "SpacePurple")
        option2.isEnabled = true
        adventureLogic.setReset(true)
        
        if (adventureLogic.getSurvived()) {
            storyLabel.text = "Your quest will continue for years to come. \nCONGRATULATIONS"
        } else {
            storyLabel.text = "You have made some terrible choices, but none worse than your last one. \nGAME OVER."
        }
    }
}

