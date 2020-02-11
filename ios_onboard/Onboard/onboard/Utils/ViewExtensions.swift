//
//  ViewExtensions.swift
//  onboard
//
//  Created by Job Getabu on 10/02/2020.
//  Copyright © 2020 Hacela. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
  
  /* Usage Example
   * bgView.addBottomRoundedEdge(desiredCurve: 1.5)
   */
    func addBottomRoundedEdge(desiredCurve: CGFloat?) {
        let offset: CGFloat = self.frame.width / desiredCurve!
        let bounds: CGRect = self.bounds
        
        let rectBounds: CGRect = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width, height: bounds.size.height / 2)
        let rectPath: UIBezierPath = UIBezierPath(rect: rectBounds)
        let ovalBounds: CGRect = CGRect(x: bounds.origin.x - offset / 2, y: bounds.origin.y, width: bounds.size.width + offset, height: bounds.size.height)
        let ovalPath: UIBezierPath = UIBezierPath(ovalIn: ovalBounds)
        rectPath.append(ovalPath)
        
        // Create the shape layer and set its path
        let maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = rectPath.cgPath
        
        // Set the newly created shape layer as the mask for the view's layer
        self.layer.mask = maskLayer
    }
    
    func addTopRoundedEdge(desiredCurve: CGFloat?) {
        self.layer.cornerRadius = 25
        //layerMaxXMaxYCorner – lower right corner
        //layerMaxXMinYCorner – top right corner
        //layerMinXMaxYCorner – lower left corner
        //layerMinXMinYCorner – top left corner
        
        self.clipsToBounds = true
        layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    func addTopCurve(curveSize: Int = 70)  {
        
        let bounds: CGRect = self.bounds
        let radii = self.layer.frame.width / 8
        
        let rectBounds: CGRect = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width, height: bounds.size.height / 2)
        let rectPath: UIBezierPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topRight, .topLeft], cornerRadii: CGSize(width:radii,height:radii))
        
        
    
               
               // Create the shape layer and set its path
               let maskLayer: CAShapeLayer = CAShapeLayer()
               maskLayer.frame = bounds
               maskLayer.path = rectPath.cgPath
               
               // Set the newly created shape layer as the mask for the view's layer
               self.layer.mask = maskLayer
    }
    
    func roundCorners(cornerRadius: Double) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
    
    

    @IBDesignable class CurvedHeaderView: UIView {

        @IBInspectable var curveHeight:CGFloat = 50.0
        
        var curvedLayer = CAShapeLayer()
        
        override func draw(_ rect: CGRect) {
            
            let path = UIBezierPath()
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addArc(withCenter: CGPoint(x: CGFloat(rect.width) - curveHeight, y: rect.height), radius: curveHeight, startAngle: 0, endAngle: 1.5 * CGFloat.pi, clockwise: false)
            path.addLine(to: CGPoint(x: curveHeight, y: rect.height - curveHeight))
            path.addArc(withCenter: CGPoint(x: curveHeight, y: rect.height - (curveHeight * 2.0)), radius: curveHeight, startAngle: 0, endAngle:  CGFloat.pi, clockwise: true)
            
            path.close()
            
            curvedLayer.path = path.cgPath
            curvedLayer.fillColor = UIColor(red: 8/255, green: 95/255, blue: 189/255, alpha: 1.0).cgColor
            curvedLayer.frame = rect
            
            self.layer.insertSublayer(curvedLayer, at: 0)
            
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowRadius = 10.0
            self.layer.shadowOpacity = 0.7
        }
        
    }

}
