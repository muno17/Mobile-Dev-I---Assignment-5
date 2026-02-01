//
//  StoryEvent.swift
//  Assignment 5
//
//  Created by Daniel Muñoz on 2/1/26.
//

import Foundation

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
