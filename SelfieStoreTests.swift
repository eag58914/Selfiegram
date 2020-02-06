//
//  SelfieStoreTests.swift
//  SelfiegramTests
//
//  Created by Elco Garcia on 2/6/20.
//  Copyright © 2020 Elco Garcia. All rights reserved.
//

@testable import Selfiegram
import UIKit

// a helper function function tp create images with text being used as the image content
func createImage(text: String)->UIImage
{
    //start a drawing canvas
    UIGraphicsBeginImageContext(CGSize(width: 100, height: 100))
    
    //close the canvas after we return from this function
    defer {
        UIGraphicsEndImageContext()
    }
    //create label
    let label = UILabel
        (frame: CGRect(x: 0,y: 0, width: 100,height: 100))
    label.font = UIFont.systemFontSize(ofSize: 50)
    label.text = text
    //Draw the label in the current drawing context
    label.drawHierarchy(in: label.frame, afterScreenUpdates: true)
    //return the image
    
    return UIGraphicsGetImageFromCurrentImageContext()!
}

