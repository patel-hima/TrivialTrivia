//
//  ViewController.swift
//  TrivialTrivia
//
//  Created by Hima Patel on 2022-08-29.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
     
    @IBAction func btnStartPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "homeToQuestions", sender: self)
    }
}

