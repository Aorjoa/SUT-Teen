//
//  ViewController.swift
//  SUT-Teen
//
//  Created by Bhuridech Sudsee on 4/24/2560 BE.
//  Copyright © 2560 Bhuridech Sudsee. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var ref: FIRDatabaseReference!
        ref = FIRDatabase.database().reference(withPath: "/")
        ref.keepSynced(true);
        ref.child("announce").observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            for element in snapshot.children {
                let child = element as! FIRDataSnapshot
                let dataDict = child.value as! NSDictionary
                print(dataDict.value(forKey: "msgtype"))
            }
        }) { (error) in
            print(error.localizedDescription)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

