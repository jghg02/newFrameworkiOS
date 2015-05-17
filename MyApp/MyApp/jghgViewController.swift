//
//  jghgViewController.swift
//  MyApp
//
//  Created by Josue Hernandez on 5/16/15.
//  Copyright (c) 2015 Josue Hernandez. All rights reserved.
//

import Foundation
import UIKit
import FutureFramework

public class jghgViewController : UIViewController {

    @IBOutlet weak var carousel: iCarousel!

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        //getting URL
        let url = FutureServices.getURL("equipo")
        NSLog("This is the URL \(url)")
        
        FutureServices.getWsUrl("posiciones", sucess: {(data) -> Void in
            
            NSLog("Data \(data.count)")
            
        }, failure: {(error) -> Void in
                
            NSLog("Erro getting Teams... \(error)")
                
        })

        
    }
    
    public override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
}