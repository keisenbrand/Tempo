//
//  ViewController.swift
//  Tempo
//
//  Created by Katherine Rose Eisenbrand on 1/30/18.
//  Copyright © 2018 Katherine Rose Eisenbrand. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var userIDLabel: UILabel!
    @IBOutlet weak var brandsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        TempoService.shared.getCurrentUser { user in
            if let user = user {
                self.configure(user)
            }
        }
    }
    
    func configure(_ user: User) { // 2
        self.usernameLabel.text = user.username
        self.userIDLabel.text = user.userID
        self.brandsLabel.text = user.brands[0].brandName
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

