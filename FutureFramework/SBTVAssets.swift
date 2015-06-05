//
//  SBTVAssets.swift
//  SBTVNuncheeServices
//
//  Created by Franklin Cruz on 11/28/14.
//  Copyright (c) 2014 Smartbox TV. All rights reserved.
//

import UIKit

@objc public class SBTVAssets: NSObject {

    struct StaticData {
        static var frameworkBundle : NSBundle?
        static var sharedInstance : SBTVAssets?
    }
    
    public class func shared() -> SBTVAssets {
        if StaticData.sharedInstance == nil {
            StaticData.sharedInstance = SBTVAssets()
        }
        
        return StaticData.sharedInstance!
    }
    
    public class func setShared(shared : SBTVAssets) {
        StaticData.sharedInstance = shared
    }

    public func getInternalImage( name : String, type : String ) -> UIImage? {
        if let path = SBTVAssets.frameworkBundle()?.pathForResource(name, ofType: type) {
            return UIImage(contentsOfFile: path)
        }
        
        return nil
    }
    
    public func shadowOverlay() -> UIImage? {
        return getInternalImage("shadow-image", type: "png")
    }
    
    public func nuncheeLogo() -> UIImage? {
        if let path = SBTVAssets.frameworkBundle()?.pathForResource("rocket", ofType: "png") {
            return UIImage(contentsOfFile: path)
        }
        
        return nil
    }

    public func placeholderChannel() -> UIImage? {
        if let path = SBTVAssets.frameworkBundle()?.pathForResource("placeholder_370", ofType: "jpg") {
            return UIImage(contentsOfFile: path)
        }
        
        return nil
    }
    
    public func placeholderPoster() -> UIImage? {
        if let path = SBTVAssets.frameworkBundle()?.pathForResource("placeholder_240", ofType: "jpg") {
            return UIImage(contentsOfFile: path)
        }
        
        return nil
    }
    
    public func placeholderMedium() -> UIImage? {
        if let path = SBTVAssets.frameworkBundle()?.pathForResource("placeholder_370", ofType: "jpg") {
            return UIImage(contentsOfFile: path)
        }
        
        return nil
    }
    
    public func placeholderBackdrop() -> UIImage? {
        if let path = SBTVAssets.frameworkBundle()?.pathForResource("placeholder_1024", ofType: "jpg") {
            return UIImage(contentsOfFile: path)
        }
        
        return nil
    }
    
    class func frameworkBundle() -> NSBundle? {
        if( StaticData.frameworkBundle == nil ) {
            let path = NSBundle.mainBundle().resourcePath
            let frameworkPath = path?.stringByAppendingPathComponent("Frameworks/FutureFramework.framework")
            
            StaticData.frameworkBundle = NSBundle(path: frameworkPath!)
        }
        
        return StaticData.frameworkBundle!
    }
    
}
