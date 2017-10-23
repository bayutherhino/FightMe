//
//  Helper.swift
//  FightMe
//
//  Created by bayu dhanubroto on 12/10/17.
//  Copyright © 2017 Bayu. All rights reserved.
//

import Foundation
import UIKit

class Helper:NSObject {
    
    func randomBetween (num1: CGFloat, num2:CGFloat) -> CGFloat {
        
        return CGFloat(arc4random())/CGFloat(UINT32_MAX) * abs(num1 - num2) + min(num1, num2)
        
    }
    
    func getRandomCoor (width: Int32, height: Int32, isLeft: Bool) -> CGPoint {
        
        let x = arc4random_uniform(UInt32(width/2))
        let y = arc4random_uniform(UInt32(height/2))
        
        let rand = Helper().randomBetween(num1:1, num2:8)
        var coor : CGPoint!
        
        switch rand {
        case 1...4:
            
            if isLeft {
                coor = CGPoint(x: -CGFloat(x), y: -CGFloat(y))
            } else {
                coor = CGPoint(x: CGFloat(x), y: -CGFloat(y))
            }
            
        case 5...8:
            
            if isLeft {
                coor = CGPoint(x: -CGFloat(x), y: CGFloat(y))
            } else {
                coor = CGPoint(x: CGFloat(x), y: CGFloat(y))
            }
            
        default:
            
            if isLeft {
                coor = CGPoint(x: -CGFloat(x), y: -CGFloat(y))
            } else {
                coor = CGPoint(x: CGFloat(x), y: -CGFloat(y))
            }
        }
        
        
        return coor
    }
    
}
