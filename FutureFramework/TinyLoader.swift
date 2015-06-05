//
//  TinyLoader.swift
//  SBTVNuncheeServices
//
//  Created by Josue Hernandez on 6/3/15.
//  Copyright (c) 2015 Smartbox TV. All rights reserved.
//

import Foundation
import UIKit

@objc public class TinyLoader : UIView, Printable, DebugPrintable {
    
    struct StaticData {
        static var frameworkBundle : NSBundle?
    }
    
    @IBOutlet weak var logoView: UIImageView!
    @IBOutlet weak var popcornUIImage: UIImageView!
    @IBOutlet weak var mainView: UIView!
    
    var images: [UIImage]!
    var animation: CABasicAnimation!
    
    public var isAnimating: Bool!
    var status: Int = 100
    
    public var count : Int = 100
    
    var timer : NSTimer?
    

    public func endAnimationAndRemoveView() -> Void {
        
        self.isAnimating = false
        
        self.popcornUIImage.stopAnimating()
        self.popcornUIImage.animationImages = nil
        self.popcornUIImage.layer.removeAllAnimations()
        
        self.timer?.invalidate()
        
        UIView.animateWithDuration(0.3, delay: 0.0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            self.alpha = 0
            }, completion: {(completd) -> Void in
                self.removeFromSuperview()
        })
    }
    
    public class func createTinyLoaderinView(view: UIView, cancellable: Bool) ->TinyLoader?{
    
        NSLog("....Create a TINYLOADER....")
        
        let nib = TinyLoader.frameworkBundle()?.loadNibNamed("TinyLoader", owner: nil, options: nil)
        let loader = nib?.first as! TinyLoader?
        
        loader?.mainView.layer.cornerRadius = 5
        
        AutolayoutUtils.fillContainer(view, view: loader!)
        
        loader?.popcornUIImage.image = SBTVAssets.shared().getInternalImage("1", type: "png")
        
        loader?.images = [
            SBTVAssets.shared().getInternalImage("2", type: "png")!,
            SBTVAssets.shared().getInternalImage("3", type: "png")!,
            SBTVAssets.shared().getInternalImage("4", type: "png")!,
            SBTVAssets.shared().getInternalImage("5", type: "png")!,
            SBTVAssets.shared().getInternalImage("6", type: "png")!,
            SBTVAssets.shared().getInternalImage("7", type: "png")!,
            SBTVAssets.shared().getInternalImage("8", type: "png")!,
            SBTVAssets.shared().getInternalImage("9", type: "png")!,
            SBTVAssets.shared().getInternalImage("10", type: "png")!,
            SBTVAssets.shared().getInternalImage("11", type: "png")!,
            SBTVAssets.shared().getInternalImage("12", type: "png")!,
            SBTVAssets.shared().getInternalImage("13", type: "png")!,
            SBTVAssets.shared().getInternalImage("14", type: "png")!,
            SBTVAssets.shared().getInternalImage("15", type: "png")!,
            SBTVAssets.shared().getInternalImage("16", type: "png")!,
            SBTVAssets.shared().getInternalImage("17", type: "png")!,
            SBTVAssets.shared().getInternalImage("18", type: "png")!,
            SBTVAssets.shared().getInternalImage("19", type: "png")!,
        ]
        
        loader?.isAnimating = true
        loader?.status = -1
        
        loader?.hidden = false
        loader?.timer = NSTimer.scheduledTimerWithTimeInterval(0.05, target: loader!, selector:"updateAnimation", userInfo: nil, repeats: true)
        
        //loader?.logoView.image = SBTVNuncheeCoreConfig.shared().mainLogo
        
        return loader
    }
    
    public func updateAnimation() -> Void {
        self.update()
    }
    
    func update() {
        self.status = (status + 1) % self.images.count
        self.popcornUIImage.image = self.images[status]
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
