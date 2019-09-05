//
//  ViewController.swift
//  CustomAlert
//
//  Created by Ngoc on 8/26/19.
//  Copyright © 2019 Ngoc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emojiLabel: UILabel!
    
    
    @IBOutlet weak var lblMoney: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AlertViewController
        vc.callBack = { text in
            self.lblMoney.text = text
        }
    }
    
    
    @IBAction func onClicksubscribe(_ sender: Any) {
        
    }
    

}

