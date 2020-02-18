//
//  UIView+Constraints.swift
//  NikeExercise-AppleRSS
//
//  Created by itimotin on 2/18/20.
//  Copyright © 2020 IKT. All rights reserved.
//

import UIKit

extension UIView {
    func addConstaints(top: CGFloat?, right: CGFloat?, bottom: CGFloat?, left: CGFloat?, width: CGFloat?, height: CGFloat?) {
        translatesAutoresizingMaskIntoConstraints = false
        if top != nil { self.addConstaint(top: top!) }
        if right != nil { self.addConstaint(right: right!) }
        if left != nil { self.addConstaint(left: left!) }
        if bottom != nil { self.addConstaint(bottom: bottom!) }
        if width != nil { self.addConstaint(width: width!) }
        if height != nil { self.addConstaint(height: height!) }
        
    }
    
    
    
    func addConstaintsToSuperview(leadingOffset: CGFloat, topOffset: CGFloat) {

        guard superview != nil else {
            return
        }

        translatesAutoresizingMaskIntoConstraints = false

        leadingAnchor.constraint(equalTo: superview!.leadingAnchor,
                                 constant: leadingOffset).isActive = true

        topAnchor.constraint(equalTo: superview!.topAnchor,
                             constant: topOffset).isActive = true
    }

   
    func addConstaints(height: CGFloat, width: CGFloat) {

        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    func addConstaint(top offset: CGFloat) {
        guard superview != nil else { return }
        topAnchor.constraint(equalTo: superview!.topAnchor, constant: offset).isActive = true
    }
    func addConstaint(bottom offset: CGFloat) {
        guard superview != nil else { return }
        bottomAnchor.constraint(equalTo: superview!.bottomAnchor, constant: offset).isActive = true
    }
    func addConstaint(right offset: CGFloat) {
        guard superview != nil else { return }
        rightAnchor.constraint(equalTo: superview!.rightAnchor, constant: offset).isActive = true
    }
    func addConstaint(left offset: CGFloat) {
        guard superview != nil else { return }
        leftAnchor.constraint(equalTo: superview!.leftAnchor, constant: offset).isActive = true
    }
    func addConstaint(width offset: CGFloat) {
        guard superview != nil else { return }
        widthAnchor.constraint(equalTo: superview!.widthAnchor, constant: offset).isActive = true
    }
    func addConstaint(height offset: CGFloat) {
        guard superview != nil else { return }
        heightAnchor.constraint(equalTo: superview!.heightAnchor, constant: offset).isActive = true
    }
}

