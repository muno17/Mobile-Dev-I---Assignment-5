//
//  ViewController.swift
//  Assignment 5
//
//  Created by Daniel Muñoz on 1/29/26.
//

import UIKit

struct StoryEvent {
    init(_ ques: String, _ o_one:String, _ o_two: String, _ i_one: Int, _ i_two: Int, _ e: Bool, _ s: Bool) {
        question = ques
        option_one = o_one
        option_two = o_two
        nextIndexOne = i_one
        nextIndexTwo = i_two
        ender = e
        survived = s
    }
    
    var question: String
    var option_one: String
    var option_two: String
    var nextIndexOne: Int
    var nextIndexTwo: Int
    var ender: Bool
    var survived: Bool
}


class ViewController: UIViewController {

    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    
    @IBOutlet weak var storyLabel: UILabel!
    
    var storyIndex : Int = 0
    var reset : Bool = false
    
    let events = [
        StoryEvent("Exoplanet Raf III is on the horizon.  The Raffians are known to be unfriendly.  Do you stay onboard or do you get on the ship heading down for a risky exploration?",
                  "Stay on board",
                  "Jump into the ship", //0
                   1, 2, false, false),
        StoryEvent("You see the ship slowly drift away.  At the same time, you see what looks like an enemy Rafian spacecraft flying in your direction.  What do you do?",
                  "Hide in a closet",
                  "Grab a gun just to be safe", 3, 4, false, false), //1
        StoryEvent("You get anxious as you slowly descend to Raf III.  You decide to eat a snack to calm your nerves.  What do you eat?",
                  "Flaming Hot Cheetohs",
                  "An apple", 5, 6, false, false), //2
        StoryEvent("You feel safe in here. It sounds like the Rafians are attempting to commandeer your ship.  You must act now to save your crew.",
                   "Rush out and ambush the Rafian infiltrators",
                   "Keep being a coward and stay quiet in the closet", 7, 8, false, false), //3
        StoryEvent("You grab the nearest laser rifle and run towards the ship's main entrance.  When you round the last corner, you are hit instantly and crumble to the ground.  You are too late.", "", "",
                   0,0, true, false), //4 end false
        StoryEvent("Good choice, you are now extremely energized and ready for anything.  Your ship lands safely and the doors open, you walk out and admire the beauty of Raf III.  There is a group of Rafian officers walking towards your ship.  What do you do?",
                   "Shoot them, they are not your friends",
                   "Smile and wave", 9,10, false, false), //5
        StoryEvent("THE APPLE WAS POISONED. You slowly collapse and everything starts to fade away. You were almost there.", "", "", 0, 0, true, false), //6 end false
        StoryEvent("You try to be a hero and bust out of the closet firing.  Its not use, they already sensed that you were there and fired first.  You drop to the ground as you feel a heaviness in your chest.  They got you.", "", "", 0, 0, true, false), // 7 end false
        StoryEvent("You hear the Rafians scavenge the ship.  Finally after a while its quiet again as it sounds like they have left. Do you feel its safe to come out now?",
                   "No, you don't trust the silence",
                   "Yes, you need to make sure everyone is ok", 11, 12, false, false), // 8
        StoryEvent("Bad move, the Rafians are much quicker than you and they absolutely blast you. You fade into oblivion.",
                   "", "", 0, 0, true, false), // 9 end false
        StoryEvent("The Rafians sense that you are friendly, they are incredibly trusting if they can sense it.  They offer you all sorts of goods and agree to form a pact with your people. You have done what no one thought was possible, your people are now safe in a new home.", "", "", 0, 0, true, true), // 10 end true
        StoryEvent("You are crippled by fear.  You dont think it will ever be safe to come out.  Hours and days go by while you slowly fade away.  You have caused your own downfall.", "","", 0,0, true, false), // 11 end false
        StoryEvent("You emerge out of the closet and see some friends who have been wounded.  You tend to their wounds, and in the end find that no one has been seriously hurt.  The Rafians delivered a stern warning to not approach their planet.  You have survived to live another day, and to continue onwards to the next destination.", "","", 0, 0, true, true) // 12 end true
    ]
    
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
        if (reset){
            reset = false
            storyIndex = 0
            Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        } else if (userAnswer == events[storyIndex].option_one) {
            storyIndex = events[storyIndex].nextIndexOne
        } else {
            storyIndex = events[storyIndex].nextIndexTwo
        }
        checkStatus()
    }

    
    // if the option selected
    @objc func checkStatus() {
        if (events[storyIndex].ender) {
            storyLabel.text = events[storyIndex].question
            option1.backgroundColor = UIColor.clear
            option2.backgroundColor = UIColor.clear
            option1.setTitle((events[storyIndex].option_one), for: .normal)
            option2.setTitle((events[storyIndex].option_two), for: .normal)
            Timer.scheduledTimer(timeInterval: 8, target: self, selector: #selector(endGame), userInfo: nil, repeats: false)
        } else {
            Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        }
    }
    
    
    // update the storyline and events based on option selected
    @objc func updateUI() {
        // load next part of story
        storyLabel.text = events[storyIndex].question
        option1.setTitle((events[storyIndex].option_one), for: .normal)
        option2.setTitle((events[storyIndex].option_two), for: .normal)
        
        option1.backgroundColor = UIColor(named: "SpacePurple")
        option2.backgroundColor = UIColor(named: "SpacePurple")
        
        option1.isEnabled = true
        option2.isEnabled = true
    }
    
    
    // display result depending on status of survived
    @objc func endGame() {
        option2.setTitle("Play Again", for: .normal)
        option2.backgroundColor = UIColor(named: "SpacePurple")
        option2.isEnabled = true
        reset = true
        
        if (events[storyIndex].survived) {
            storyLabel.text = "Your quest will continue for years to come. \nCONGRATULATIONS"
        } else {
            storyLabel.text = "You have made some terrible choices, but none worse than your last one. \nGAME OVER."
        }
    }
}

