//
//  ResultViewController.swift
//  playWithMe
//
//  Created by HappyDuck on 2021/08/02.
//

import UIKit

class ResultViewController: UIViewController, UITextFieldDelegate {
  
    
    @IBOutlet var searchTextField: UITextField!
    
    var dataManager = DataManager()
    var clubManager = ClubManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self

    }
    
    @IBAction func clubListBtnPressed(_ sender: UIButton) {
        clubManager.performRequest(urlString: clubManager.clubDataUrl)
        
    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
       
        searchTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something here"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let city = searchTextField.text {
            dataManager.fetchData(cityName: city)
        }
        
        searchTextField.text = ""
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
