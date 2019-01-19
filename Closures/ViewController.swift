//
//  ViewController.swift
//  Closures
//
//  Created by Saleh Enam Shohag on 19/1/19.
//  Copyright © 2019 Nazia Afroz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        iamGlobalFunction()
        iamNestedWithinGlobal()
        
        
        print("======Closures=====")
        let cl = Closures.init()
        cl.runClosure()
        cl.takesClosure(function: {(a: Int, b: Int) -> Int in
            return a + b
        }, anotherParam: 12)
    }


}

