//
//  AdventureLogic.swift
//  Assignment 5
//
//  Created by Daniel Muñoz on 2/1/26.
//

import Foundation

struct AdventureLogic {
    var storyIndex : Int = 0
    var reset : Bool = false
    
    let events = [
        StoryEvent("Exoplanet Raf III is on the horizon. The Raffians are known to be unfriendly. Do you stay onboard or do you get on the vessel heading down for a risky exploration?",
                   "Stay on board",
                   "Jump into the ship", //0
                   1, 2, false, false),
        StoryEvent("You see the ship slowly drift away. At the same time, you see what looks like an enemy Rafian spacecraft flying in your direction. What do you do?",
                   "Hide in a closet",
                   "Grab a gun just to be safe", 3, 14, false, false), //1
        StoryEvent("You get anxious as you slowly descend to Raf III. You decide to eat a snack to calm your nerves. What do you eat?",
                   "Flaming Hot Cheetohs",
                   "An apple", 5, 13, false, false), //2
        StoryEvent("You feel safe in here. It sounds like the Rafians are attempting to commandeer your ship. You must act now to save your crew.",
                   "Rush out and ambush the Rafian infiltrators",
                   "Keep being a coward and stay quiet in the closet", 7, 8, false, false), //3
        StoryEvent("You grab the nearest laser rifle and run towards the ship's main entrance. When you round the last corner, you are hit instantly and crumble to the ground. You are too late.", "", "",
                   0, 0, true, false), //4 end false
        StoryEvent("Excellent choice, you are now extremely energized and ready for anything. Your ship lands safely and the doors open, you walk out and admire the beauty of Raf III. There is a group of Rafian officers walking towards your ship. What do you do?",
                   "Shoot them, they are not your friends",
                   "Smile and wave", 9, 10, false, false), //5
        StoryEvent("THE APPLE WAS POISONED. You slowly collapse and everything starts to fade away. You were almost there.", "", "", 0, 0, true, false), //6 end false
        StoryEvent("You try to be a hero and bust out of the closet firing. Its not use, they already sensed that you were there and fired first. You drop to the ground as you feel a heaviness in your chest. They got you.", "", "", 0, 0, true, false), // 7 end false
        StoryEvent("You hear the Rafians scavenge the ship. Finally after a while its quiet again as it sounds like they have left. Do you feel its safe to come out now?",
                   "No, you don't trust the silence",
                   "Yes, you need to make sure everyone is ok", 11, 12, false, false), // 8
        StoryEvent("Bad move, the Rafians are much quicker than you and they absolutely blast you. You fade into oblivion.",
                   "", "", 0, 0, true, false), // 9 end false
        StoryEvent("The Rafians sense that you are friendly, they are incredibly trusting if they can sense it. They offer you all sorts of goods and agree to form a pact with your people. You have done what no one thought was possible, your people are now safe in a new home.", "", "", 0, 0, true, true), // 10 end true
        StoryEvent("You are crippled by fear. You dont think it will ever be safe to come out. Hours and days go by while you slowly fade away. You have caused your own downfall.", "","", 0,0, true, false), // 11 end false
        StoryEvent("You emerge out of the closet and see some friends who have been wounded. You tend to their wounds, and in the end find that no one has been seriously hurt.  The Rafians delivered a stern warning to not approach their planet. You have survived to live another day, and to continue onwards to the next destination.", "","", 0, 0, true, true), // 12 end true
        StoryEvent("You take a bite of the apple. It tastes metallic and your vision blurs. You see a medical kit and a radio on the table. Which do you reach for?",
                   "Reach for Medkit",
                   "Reach for Radio", 15, 6, false, false), // 13
        StoryEvent("You grab the rifle. You see the Raffians cutting through the hull with a plasma torch! Do you take cover behind a heavy crate or fire blindly at the sparks?",
                   "Take Cover",
                   "Fire Blindly", 16, 4, false, false), // 14
        StoryEvent("The medkit had an antivenom! You feel your strength returning just as a Raffian enters the room. Do you try to hide behind the captain's chair or play dead on the floor?",
                   "Hide",
                   "Play Dead", 17, 18, false, false), // 15
        StoryEvent("From behind the crate, you have a clear shot at their power cells. Do you disable their ship's engine or aim for the soldiers' oxygen tanks?",
                   "Disable Engine",
                   "Aim for Tanks", 10, 9, false, false), // 16
        StoryEvent("You hid successfully, but the Raffians set the ship to self-destruct before leaving. You managed to reach an escape pod just in time. You are safe, but your mission is a failure including many deaths among your ship-mates.", "","", 0, 0, true, false), // 17 end false
        StoryEvent("The Raffians think you are a casualty and leave a peace offering on the table before departing. You eventually get up and head back to your spaceship to tell the others. A strange but successful first contact!", "","", 0, 0, true, true) // 18 end true
    ]
    
    func getStoryIndex() -> Int{
        return storyIndex
    }
    
    func getReset() -> Bool {
        return reset
    }
    
    func getTitle() -> String {
        return events[storyIndex].question
    }

    func getChoice1() -> String {
        return events[storyIndex].option_one
    }

    func getChoice2() -> String {
        return events[storyIndex].option_two
    }
    
    func getSurvived() -> Bool {
        return events[storyIndex].survived
    }
    
    func getEnder() -> Bool {
        return events[storyIndex].ender
    }
    
    mutating func setReset(_ r : Bool) {
        reset = r
    }
    
    mutating func setIndex(_ i : Int) {
        storyIndex = i
    }
    
    mutating func nextIndex(_ choice : String) {
        let currentEvent = events[storyIndex]
        
        if (choice == currentEvent.option_one) {
            storyIndex = currentEvent.nextIndexOne
        } else {
            storyIndex = currentEvent.nextIndexTwo
        }
    }
}
