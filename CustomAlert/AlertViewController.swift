//
//  AlertViewController.swift
//  CustomAlert
//
//  Created by Ngoc on 8/26/19.
//  Copyright © 2019 Ngoc. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {
    
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var numPadVIew: UIView!
    
    
    
    var callBack: ((String) -> Void)?
    
    var temp = ""
    var result:Int = 0
    var maxValue = 9999999999
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView() {
        numPadVIew.layer.masksToBounds = true
        numPadVIew.layer.cornerRadius = 20
        addNumpadConstrain()
    }
    
    fileprivate func addNumpadConstrain() {
        if self.view.bounds.width >= 500 {
            numPadVIew.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
            numPadVIew.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive = true
            numPadVIew.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5, constant: 0).isActive = true
            numPadVIew.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5, constant: 0).isActive = true
        } else {
            numPadVIew.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
            numPadVIew.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive = true
            numPadVIew.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5, constant: 0).isActive = true
            numPadVIew.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.75, constant: 0).isActive = true
        }
    }
    
    
    @IBAction func onClickNumber(_ sender: UIButton) {
        if result <= maxValue{
            temp += sender.currentTitle!
            if let number = Int(temp) {
                if number > maxValue {
                    result = maxValue
                    changeColorWhenWrong()
                } else {
                    result = number
                }
            }
            lblResult.text = "\(result.delimiter)"
        }
    }
    
    @IBAction func deleteOne(_ sender: Any) {
        temp = "\(result)"
        temp.removeLast()
        result = Int(temp) ?? 0
        lblResult.text = "\(result.delimiter)"
    }
    
    @IBAction func deleteAll(_ sender: Any) {
        temp = ""
        result = 0
        lblResult.text = "\(result)"
    }
    
    @IBAction func didTapCanel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
 
    @IBAction func didTapAction(_ sender: Any) {
        
        if lblResult.text != "" {
            callBack?(lblResult.text!)
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clickOutOfView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func changeColorWhenWrong(){
        lblResult.textColor = UIColor.red
        Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(changeColorBlack), userInfo: nil, repeats: false)
    }
    
    @objc func changeColorBlack() {
        lblResult.textColor = UIColor.black
    }
}
