//
//  myBox.swift
//  testinput
//
//  Created by Patrice Rapaport on 01/10/2017.
//  Copyright © 2017 Patrice Rapaport. All rights reserved.
//

@IBDesignable open class cmyBox: NSBox {
    var ctrls: [cmyControl]=[]
    @IBInspectable public var backgroundColor: NSColor = .white {
        didSet {
            self.fillColor = backgroundColor
            layer?.backgroundColor = fillColor.cgColor
            wantsLayer = true
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        boxType = .custom
        fillColor = .white
        self.wantsLayer = true
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        boxType = .custom
        fillColor = .white
        self.wantsLayer = true
    }
    
    override open func prepareForInterfaceBuilder() {
        layer?.backgroundColor = fillColor.cgColor
    }
    
    override open var isHidden: Bool {
        get {
            return super.isHidden
        }
        set (visible) {
            if ctrls.count > 0 {
                for index in 0...ctrls.count - 1 {
                    ctrls[index].ctrl.isHidden = visible
                }
            }
            super.isHidden = visible
        }
    }
    
    func addControl (_ ctrl: cmyControl) {
        ctrls.append(ctrl)
    }
}
