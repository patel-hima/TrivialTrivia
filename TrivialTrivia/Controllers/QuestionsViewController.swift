//
//  QuestionsViewController.swift
//  TrivialTrivia
//
//  Created by Hima Patel on 2022-09-01.
//

import UIKit

class QuestionsViewController: UIViewController {

    
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var triviaProgress: UIProgressView!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var btnOptionOne: UIButton!
    @IBOutlet weak var btnOptionTwo: UIButton!
    @IBOutlet weak var btnOptionthree: UIButton!
    @IBOutlet weak var btnOptionFour: UIButton!

    var questionsData = QuestionsData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshUI()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnExitPressed(_ sender: UIButton){
        self.performSegue(withIdentifier: "questionstoHome", sender: self)
    }
    @IBAction func answerSelected(_ sender: UIButton) {
        
        let userSelection = sender.currentTitle
        
        if questionsData.verifySelection(for: userSelection!){
            sender.tintColor = UIColor(hex: "4AA96C")
            sender.backgroundColor = UIColor(hex: "4AA96C")
        } else {
            sender.tintColor = UIColor(hex: "f55c47")
            sender.backgroundColor = UIColor(hex: "f55c47")
        }
        
        
        
        let endOfTrivia = !questionsData.questionProgression()
        if endOfTrivia{
            
            self.performSegue(withIdentifier: "questionsToResult", sender: self)}

        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(refreshUI), userInfo: nil, repeats: false)
    }
    
    @objc func refreshUI(){
        
        lblQuestion.text = questionsData.getQuestionLabel()
        btnOptionOne.setTitle(questionsData.getOp(op:"One"), for: .normal)
        btnOptionTwo.setTitle(questionsData.getOp(op:"Two"), for: .normal)
        btnOptionthree.setTitle(questionsData.getOp(op:"Three"), for: .normal)
        btnOptionFour.setTitle(questionsData.getOp(op:"Four"), for: .normal)
        triviaProgress.progress = questionsData.getTriviaProgress()
        lblScore.text = "Score: \(questionsData.getScore())"
        
        btnOptionOne.tintColor = UIColor(hex: "00c49d")
        btnOptionOne.backgroundColor = UIColor(hex: "00c49d")
        btnOptionTwo.tintColor = UIColor(hex: "2dc4b6")
        btnOptionTwo.backgroundColor = UIColor(hex: "2dc4b6")
        btnOptionthree.tintColor = UIColor(hex: "0090aa")
        btnOptionthree.backgroundColor = UIColor(hex: "0090aa")
        btnOptionFour.tintColor = UIColor(hex: "4a84a6")
        btnOptionFour.backgroundColor = UIColor(hex: "4a84a6")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "questionsToResult") {
                let vc = segue.destination as! ResultsViewController
            vc.score = questionsData.getScore()
            vc.noOfQue = questionsData.getNoOfQuestions()
            }
    }
}


//MARK: - UI Color Extension

extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbColorValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbColorValue)
        
        let r = (rgbColorValue & 0xff0000) >> 16
        let g = (rgbColorValue & 0xff00) >> 8
        let b = rgbColorValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}
