//
//  AFShaddowView.swift
//  resevation
//
//  Created by mac on 7/31/19.
//  Copyright © 2019 alaa. All rights reserved.
//


import UIKit

class AFShadowView: UIView {
    
    override var bounds: CGRect {
        didSet {
            setupShadow()
        }
    }
    
    var cornerRadius: CGFloat?
    var shadowOffset = CGSize(width: 0, height: 2)
    var shadowRadius: CGFloat = 8
    var shadowOpacity: Float = 0.15
    
    init(cornerRadius: CGFloat) {
        super.init(frame: .zero)
        self.cornerRadius = cornerRadius
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupShadow() {
        let cr = cornerRadius ?? 8
        self.layer.cornerRadius = cr
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: cr, height: cr)).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
}
