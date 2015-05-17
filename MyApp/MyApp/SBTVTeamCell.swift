//
//  SBTVTeamCell.swift
//  MovistarPeru
//
//  Created by Franklin Cruz on 3/2/15.
//  Copyright (c) 2015 SmartboxTV. All rights reserved.
//

import UIKit

public class SBTVTeamCell: UIView {
    
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var checkImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    public class func create() -> SBTVTeamCell {
        
        
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            
            let nibName = "SBTVTeamCell"
            let nib = NSBundle.mainBundle().loadNibNamed(nibName, owner: nil, options: nil)
            let view = nib?.first as! SBTVTeamCell
            
            var frame:CGRect =  view.frame
            frame.size.width = 276
            frame.size.height = 280
            view.frame = frame
            
            var layer = view.flagImageView.layer
            layer.shadowOffset = CGSizeMake(1,1)
            layer.shadowColor = UIColor.blackColor().CGColor
            layer.shadowRadius = 2.0
            //layer.shadowOpacity = 0.25
            layer.shadowPath = UIBezierPath(roundedRect: layer.bounds, cornerRadius: 25).CGPath
            
            
            
            //view.nameLabel.font = UIFont(name: FONT_CONDENSED, size: view.nameLabel.font.pointSize)
            return view
            
            
            
        }
        else {
            let nibName = "SBTVTeamCell"
            let nib = NSBundle.mainBundle().loadNibNamed(nibName, owner: nil, options: nil)
            let view = nib?.first as! SBTVTeamCell
            var layer = view.flagImageView.layer
            
            
            var frame:CGRect =  view.frame
            frame.size.width = 150
            frame.size.height = 200
            view.frame = frame
            
            view.layoutIfNeeded()
            
            layer.shadowOffset = CGSizeMake(1,1)
            layer.shadowColor = UIColor.blackColor().CGColor
            layer.shadowRadius = 2.0
            //layer.shadowOpacity = 0.25
            layer.shadowPath = UIBezierPath(roundedRect: view.flagImageView.frame, cornerRadius: 25).CGPath
            
            
            view.nameLabel.font = UIFont(name: "Regular-Boldt", size: 15)
            return view
            
            
            
        }
        
    }
    
}
