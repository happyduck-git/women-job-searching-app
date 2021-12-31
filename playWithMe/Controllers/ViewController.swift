//
//  ViewController.swift
//  playWithMe
//
//  Created by HappyDuck on 2021/08/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func trainingInfoBtnPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToTrainInfo", sender: self)
    }
    
    @IBAction func openRecruitBtnPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToRecruitInfo", sender: self)
    }
    


//MARK: - UITextFieldDelegate

//    extension ViewController: UITextFieldDelegate {
//
//    }
}
