//
//  popoverController.swift
//  testinput
//
//  Created by Patrice Rapaport on 20/09/2017.
//  Copyright © 2017 Patrice Rapaport. All rights reserved.
//

class popoverController: NSViewController {
    @IBOutlet weak var label: NSTextField!
    
    override public init(nibName: NSNib.Name?, bundle: Bundle?) {
        //super.init(nibName: nibName, bundle: bundle)
        let nibname = NSNib.Name("popoverController")
        let selfBundle = Bundle(for: popoverController.self)
        super.init(nibName: nibname, bundle: selfBundle)
        //let bundleURL = selfBundle.url(forResource: "PRMacControls", withExtension: "bundle")
        //let bundle = Bundle(url: bundleURL!)
        //super.init(nibName: nibname, bundle: bundle)
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    func setLabel (msg: String) -> CGRect {
        label.stringValue = msg
        
        let width = 2+label.fittingSize.width
        let height = 2+label.fittingSize.height
        
        let viewFrame = view.frame
        let viewWidth = 10+width
        let viewHeight = 10+height
        let newViewFrame = CGRect(origin: viewFrame.origin, size: CGSize(width:viewWidth, height:viewHeight))
        return newViewFrame
    }
}
