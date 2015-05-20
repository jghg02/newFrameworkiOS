//
//  AutolayoutUtils.swift
//  SBTVNuncheeTrivia
//
//  Created by Franklin Cruz on 10/24/14.
//  Copyright (c) 2014 Smartbox TV. All rights reserved.
//

import UIKit

@objc public class FillConstraints {
    public var top : NSLayoutConstraint!
    public var left : NSLayoutConstraint!
    public var bottom : NSLayoutConstraint!
    public var right : NSLayoutConstraint!
}

@objc public class CenterConstraints {
    public var width : NSLayoutConstraint!
    public var height : NSLayoutConstraint!
    public var horizontalCenter : NSLayoutConstraint!
    public var verticalCenter : NSLayoutConstraint!
}

@objc public class AllConstraints {
    public var top : NSLayoutConstraint?
    public var left : NSLayoutConstraint?
    public var bottom : NSLayoutConstraint?
    public var right : NSLayoutConstraint?
    public var width : NSLayoutConstraint?
    public var height : NSLayoutConstraint?
}

@objc public class AutolayoutUtils: NSObject {
   
    public class func addView( view : UIView, topMargin : CGFloat?, leftMargin : CGFloat?, bottomMargin : CGFloat?, rightMargin : CGFloat?, width : CGFloat?, height : CGFloat?, toContainer container : UIView ) -> AllConstraints {
        
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        container.addSubview(view)
        
        var top : NSLayoutConstraint?
        var bottom : NSLayoutConstraint?
        var left : NSLayoutConstraint?
        var right : NSLayoutConstraint?
        
        var widthConstraint : NSLayoutConstraint?
        var heightConstraint : NSLayoutConstraint?
        
        if topMargin != nil {
            top = NSLayoutConstraint(
                item: view,
                attribute: NSLayoutAttribute.Top,
                relatedBy: NSLayoutRelation.Equal,
                toItem: container,
                attribute: NSLayoutAttribute.Top,
                multiplier: 1.0,
                constant: topMargin!
            )
            container.addConstraint(top!);
        }
        
        if leftMargin != nil {
            left = NSLayoutConstraint(
                item: view,
                attribute: NSLayoutAttribute.Leading,
                relatedBy: NSLayoutRelation.Equal,
                toItem: container,
                attribute: NSLayoutAttribute.Leading,
                multiplier: 1.0,
                constant: leftMargin!
            )
            container.addConstraint(left!);
        }
        
        if bottomMargin != nil {
            bottom = NSLayoutConstraint(
                item: view,
                attribute: NSLayoutAttribute.Bottom,
                relatedBy: NSLayoutRelation.Equal,
                toItem: container,
                attribute: NSLayoutAttribute.Bottom,
                multiplier: 1.0,
                constant: bottomMargin!
            )
            container.addConstraint(bottom!);
        }
        
        if rightMargin != nil {
            right = NSLayoutConstraint(
                item: view,
                attribute: NSLayoutAttribute.Trailing,
                relatedBy: NSLayoutRelation.Equal,
                toItem: container,
                attribute: NSLayoutAttribute.Trailing,
                multiplier: 1.0,
                constant: rightMargin!
            )
            container.addConstraint(right!);
        }

        if height != nil {
            heightConstraint = NSLayoutConstraint(
                item: view,
                attribute: NSLayoutAttribute.Height,
                relatedBy: NSLayoutRelation.Equal,
                toItem: nil,
                attribute: NSLayoutAttribute.NotAnAttribute,
                multiplier: 1.0,
                constant: height!
            )
            container.addConstraint(heightConstraint!);
        }
        
        if width != nil {
            widthConstraint = NSLayoutConstraint(
                item: view,
                attribute: NSLayoutAttribute.Width,
                relatedBy: NSLayoutRelation.Equal,
                toItem: nil,
                attribute: NSLayoutAttribute.NotAnAttribute,
                multiplier: 1.0,
                constant: width!
            )
            
            container.addConstraint(widthConstraint!);
        }
        
        
        let constraints = AllConstraints()
        constraints.top = top
        constraints.left = left
        constraints.bottom = bottom
        constraints.right = right
        constraints.width = widthConstraint
        constraints.height = heightConstraint
        
        return constraints
    }
    
    public class func fillContainer( container : UIView, view : UIView ) -> FillConstraints {
        let top = NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: container,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1.0,
            constant: 0.0
        )
        
        let right = NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.Trailing,
            relatedBy: NSLayoutRelation.Equal,
            toItem: container,
            attribute: NSLayoutAttribute.Trailing,
            multiplier: 1.0,
            constant: 0.0
        )
        
        let bottom = NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: container,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: 0.0
        )
        
        let left = NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: container,
            attribute: NSLayoutAttribute.Leading,
            multiplier: 1.0,
            constant: 0.0
        )
        
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        container.addSubview(view)
        
        container.addConstraint(top);
        container.addConstraint(left);
        container.addConstraint(bottom);
        container.addConstraint(right);
        
        let constraints = FillConstraints()
        constraints.top = top
        constraints.left = left
        constraints.bottom = bottom
        constraints.right = right
        
        return constraints
    }
    
    public class func fillContainer( container : UIView, view : UIView, margin : UIEdgeInsets ) -> FillConstraints {
        let top = NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: container,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1.0,
            constant: margin.top
        )
        
        let right = NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.Trailing,
            relatedBy: NSLayoutRelation.Equal,
            toItem: container,
            attribute: NSLayoutAttribute.Trailing,
            multiplier: 1.0,
            constant: margin.right
        )
        
        let bottom = NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: container,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: margin.bottom
        )
        
        let left = NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: container,
            attribute: NSLayoutAttribute.Leading,
            multiplier: 1.0,
            constant: margin.left
        )
        
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        container.addSubview(view)
        
        container.addConstraint(top);
        container.addConstraint(left);
        container.addConstraint(bottom);
        container.addConstraint(right);
        
        let constraints = FillConstraints()
        constraints.top = top
        constraints.left = left
        constraints.bottom = bottom
        constraints.right = right
        
        return constraints
    }
    
    public class func centerView( view : UIView, inContainer : UIView, withSize : CGSize ) -> CenterConstraints {
        
        let centerYConstraint = NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.CenterY,
            relatedBy: NSLayoutRelation.Equal,
            toItem: inContainer,
            attribute: NSLayoutAttribute.CenterY,
            multiplier: 1.0,
            constant: 0.0
        )
        
        let centerXConstraint = NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: inContainer,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1.0,
            constant: 0.0
        )
        
        let heightConstraint = NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1.0,
            constant: withSize.height
        )
        
        let widthConstraint = NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1.0,
            constant: withSize.width
        )
        
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        inContainer.addSubview(view)
        
        inContainer.addConstraint(centerXConstraint);
        inContainer.addConstraint(centerYConstraint);
        inContainer.addConstraint(heightConstraint);
        inContainer.addConstraint(widthConstraint);
        
        let constraints = CenterConstraints()
        constraints.width = widthConstraint
        constraints.height = heightConstraint
        constraints.horizontalCenter = centerXConstraint
        constraints.verticalCenter = centerYConstraint
        
        return constraints
    }
}
