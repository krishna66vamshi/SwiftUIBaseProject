//
//  CustomCorner.swift
//  FirebaseLogin-Kavsoft
//
//  Created by vamsi on 24/06/21.
//

import SwiftUI

struct CustomCorner: Shape {
    
    var corner :UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii:  CGSize(width: 20, height: 20))
        return Path(path.cgPath)
    }
}
