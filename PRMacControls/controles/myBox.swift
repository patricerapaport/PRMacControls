//
//  myBox.swift
//  testinput
//
//  Created by Patrice Rapaport on 01/10/2017.
//  Copyright © 2017 Patrice Rapaport. All rights reserved.
//

@IBDesignable open class cmyBox: NSBox {
    var ctrls: [cmyControl]=[]
    @IBInspectable override open var fillColor: NSColor  {
        didSet {
            fillColor = .white
            layer?.backgroundColor = fillColor.cgColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.wantsLayer = true
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.wantsLayer = true
    }
    
    override open func prepareForInterfaceBuilder() {
        layer?.backgroundColor = fillColor.cgColor
    }
    
    override open func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
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
