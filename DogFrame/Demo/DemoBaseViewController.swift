//
//  DemoBaseViewController.swift
//  DogFrame
//
//  Created by 解杨 on 16/3/18.
//  Copyright © 2016年 解杨. All rights reserved.
//

import Foundation
import UIKit


class LabelView:UIView,NSCopying{
    
    var label:UILabel = UILabel()

    
    
    init(text:String){
        
        super.init(frame: SizeMakeRect(0, height: 0))

        
        padding=(3,3,3,3)
        label.flexHBySuper()
        label.text=text
        label.textColor = UIColor(red: 100.0/255, green: 100.0/255, blue: 100.0/255, alpha: 1)
        VLayout(view: label)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        padding=(3,3,3,3)
        label.flexHBySuper()
        label.text=""
        label.textColor = UIColor(red: 100.0/255, green: 100.0/255, blue: 100.0/255, alpha: 1)
        VLayout(view: label)
    }
    
    func copyWithZone(zone: NSZone) -> AnyObject {
        return DemoView(text: label.text!)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLabelTest(text:String){
        label.text = text
        label.sizeToFit()
    }
    
    func labelCenter(){
        
        hAlignType = .HAlignMiddle
        vAlignType = .VAlignCenter
    }
    
    func labelCorner(){
        
        hAlignType = .HAlignLeft
        vAlignType = .VAlignTop
    }
}


class DemoView:UIView,NSCopying{
    var descView=LabelView(text: "")
    var showView=LabelView(text: "view")
    init(text:String){
        super.init(frame: SizeMakeRect(0, height: 0))
        flexHBySuper()
        flexVBySuper()
        backgroundColor=UIWhiteColor
        
        descView.setLabelTest(text)
        padding=(3,3,3,3)

        showView.label.frame.origin=CGPointMake(3, 3)
        showView.label.alignIgnore()
        showView.label.sizeToFit()
        showView.layer.borderWidth=0.5
        showView.layer.borderColor=UIColor(red: 150.0/255, green: 150.0/255, blue: 150.0/255, alpha: 1).CGColor
        showView.flexVBySuper()
        showView.flexHBySuper()
        
        descView.flexVBySuper()
        descView.flexHBySuper()
        
        HLayout([descView,showView])
    }
    
    func copyWithZone(zone: NSZone) -> AnyObject {
        let view:DemoView = DemoView(text: descView.label.text!)
        
        let tempArchive:NSData=NSKeyedArchiver.archivedDataWithRootObject(showView)
        view.showView=NSKeyedUnarchiver.unarchiveObjectWithData(tempArchive) as!LabelView

        return view
    }
    
    func setDemoName(text:String){
        descView.setLabelTest(text)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

class DemoBaseViewController:UIViewController{
 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = UIRectEdge.None
    }
    
    override func viewWillLayoutSubviews() {
        
        view.Layout()
        
    }
    
    func checkAlignOrientation(){
        if UIDevice.currentDevice().orientation.isLandscape {
            view.alignInfo.1 = .AlignH
        } else {
            view.alignInfo.1 = .AlignV
        }
    }

}