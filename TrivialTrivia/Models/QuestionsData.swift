//
//  QuestionsData.swift
//  TrivialTrivia
//
//  Created by Hima Patel on 2022-09-01.
//
import Foundation

struct QuestionsData {
    var score = 0
    var questionNo = 0
    let questions = [
        Questions(que: "Find the sum of 111 + 222 + 333", ans: "666", opOne: "700", opTwo: "666", opThree: "670", opFour: "606"),
        Questions(que: "Subtract 457 from 832", ans: "375", opOne: "375", opTwo: "389", opThree: "296", opFour: "325"),
        Questions(que: "50 times 5 is equal to", ans: "250", opOne: "2500", opTwo: "505", opThree: "500", opFour: "250"),
        Questions(que: "90 ÷ 10", ans: "9", opOne: "9", opTwo: "10", opThree: "0", opFour: "90"),
        Questions(que: "Simplify: 26 + 32 - 12", ans: "46", opOne: "0", opTwo: "32", opThree: "56", opFour: "46"),
        Questions(que: "Find the product of 72 × 3", ans: "216", opOne: "216", opTwo: "7320", opThree: "106", opFour: "372"),
        Questions(que: "Solve : 200 – (96 ÷ 4)", ans: "176", opOne: "105", opTwo: "176", opThree: "26", opFour: "16"),
        Questions(que: "Solve: 24 + 4 ÷ 4", ans: "25", opOne: "25", opTwo: "6", opThree: "28", opFour: "7"),
        Questions(que: "Simplify : 3 + 6 x (5 + 4) ÷ 3 - 7", ans: "14", opOne: "11", opTwo: "14", opThree: "15", opFour: "16"),
        Questions(que: "Simplify :150 ÷ (6 + 3 x 8) - 5", ans: "0", opOne: "2", opTwo: "5", opThree: "0", opFour: "8"),
    ]
    
    mutating func verifySelection(for userSelection: String) -> Bool{
        let answer = questions[questionNo].ans
        if userSelection == answer{
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func getQuestionLabel() -> String{
        return questions[questionNo].que
    }
    
    func getTriviaProgress() -> Float{
        return Float(questionNo + 1)/Float(questions.count)
    }
    
    func getOp(op: String) -> String{
        switch(op){
        case "One" : return questions[questionNo].opOne
        case "Two" : return questions[questionNo].opTwo
        case "Three" : return questions[questionNo].opThree
        case "Four" : return questions[questionNo].opFour
        default:
            return "out of options"
        }
    }
    
    mutating func questionProgression() -> Bool{
        if questionNo + 1 < questions.count{
            questionNo += 1
            return true
        } else {
            questionNo = 0
            return false
        }
    }
    
    func getNoOfQuestions() -> Int {
        return questions.count
    }
    
    func getScore() -> Int{
        return score
    }
}
