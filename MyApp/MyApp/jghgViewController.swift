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

public class jghgViewController : UIViewController, iCarouselDelegate, iCarouselDataSource {

    @IBOutlet weak var carousel: iCarousel!
    @IBOutlet var root: UIView!

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Setting Config Carousel
        self.carousel.type = iCarouselType.Custom
        
        //getting URL
        let url = FutureServices.getURL("equipo")
        NSLog("This is the URL \(url)")
        
        FutureServices.getWsUrl("posiciones", sucess: {(data) -> Void in
            
            NSLog("Data \(data.count)")
            
        }, failure: {(error) -> Void in
                
            NSLog("Error getting Teams... \(error)")
                
        })

        
        
    }
    
    public override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    //iCarousel Methods
    public  func carousel(carousel: iCarousel!, viewForItemAtIndex index: Int, reusingView view: UIView?) -> UIView! {
        return self.setupTeamCellView(view, index: index)
    }
    
    public  func carousel(carousel: iCarousel!, placeholderViewAtIndex index: Int, reusingView view: UIView!) -> UIView! {
        return self.setupTeamCellView(view, index: index)
    }
    
    public  func numberOfPlaceholdersInCarousel(carousel: iCarousel!) -> Int {
        return 4 //Not sure if this is needed
    }
    
    public func setupTeamCellView( view : UIView?, index : Int ) -> UIView {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        var cell : SBTVTeamCell
        
        if ( view == nil ) {
            cell = SBTVTeamCell.create()
        }
        else {
            cell = view as! SBTVTeamCell
        }
        
        
        return cell
        
    }
    
    
    public func carousel(carousel: iCarousel!, itemTransformForOffset offset: CGFloat, baseTransform transform: CATransform3D) -> CATransform3D {
        if (UIDevice.currentDevice().userInterfaceIdiom == .Pad){
            
            let _itemWidth : CGFloat = 276.0
            let _itemHeight : CGFloat = 310.0
            
            let spacing : CGFloat = 0.95
            let absOffset = fabs(offset)
            
            let xScale = 1.0 - ( absOffset / CGFloat(6.0) )
            let yScale = 1.0 - ( absOffset / CGFloat(6.0) )
            
            var newtransform = CATransform3DTranslate(
                transform,
                (_itemWidth * offset * spacing) - ( (_itemWidth - _itemWidth * xScale) * (offset > 0 ? 1 : -1) ),
                (_itemHeight - _itemHeight * yScale ) / -2.0,
                _itemWidth * -0.3 * absOffset)
            
            newtransform = CATransform3DScale(newtransform, xScale, yScale, 1.0)
            
            return newtransform
            
        }else{
            
            
            let _itemWidth : CGFloat = 150.0
            let _itemHeight : CGFloat = 230.0
            
            
            let spacing : CGFloat = 0.95
            let absOffset = fabs(offset)
            
            let xScale = 1.0 - ( absOffset / CGFloat(6.0) )
            let yScale = 1.0 - ( absOffset / CGFloat(6.0) )
            
            var newtransform = CATransform3DTranslate(
                transform,
                (_itemWidth * offset * spacing) - ( (_itemWidth - _itemWidth * xScale) * (offset > 0 ? 1 : -1) ),
                (_itemHeight - _itemHeight * yScale ) / -2.0,
                _itemWidth * -0.3 * absOffset)
            
            newtransform = CATransform3DScale(newtransform, xScale, yScale, 1.0)
            
            return newtransform
            
        }
        
    }
    
    public func carousel(carousel: iCarousel!, valueForOption option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        
        switch(option) {
        case .Wrap:
            return 1.0
        case .Spacing:
            return value * 0.85
        case .FadeMax:
            return value
        case .ShowBackfaces:
            return 0.0
        case .FadeMinAlpha:
            return value
        case .FadeMin:
            return value
        case .FadeRange:
            return value
        case
        .Angle
        ,.Arc
        ,.Tilt
        ,.OffsetMultiplier:
            return value
        case
        .Radius:
            return 10
        case .VisibleItems,
        .Count:
            return 32 //Still don't get how this number works if you know plase enlighten me
        }
        
    }
    
    public func numberOfItemsInCarousel(carousel: iCarousel!) -> Int {
        return 20
    }
    
    public func carousel(carousel: iCarousel!, didSelectItemAtIndex index: Int) {
    
    }
    
}