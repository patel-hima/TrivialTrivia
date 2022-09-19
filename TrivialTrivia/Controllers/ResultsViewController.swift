//
//  ResultsViewController.swift
//  TrivialTrivia
//
//  Created by Hima Patel on 2022-09-18.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var lblCompletionMessage: UILabel!
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var lblCongrats: UILabel!
    var score : Int = 0
    var noOfQue : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        lblScore.text = "\(score)/\(noOfQue)"
        switch((Double(score)/Double(noOfQue))*100){
        case 0...40 : lblCompletionMessage.text = "Don't give up, practice hard and come back stronger!"
            lblCongrats.text = "uh-oh"
        case 41...80 : lblCompletionMessage.text = "Good Job! Don't stop here, you are capable of greater things!"
        case 81...100 : lblCompletionMessage.text = "You are a true genius, Keep going!"
            default : lblCompletionMessage.text = "The quiz is successfully completed."
        }
    }
    
    @IBAction func btnHomePressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "resultsToHome", sender: self)
    }
}
