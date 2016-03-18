//
//  PaddingViewController.swift
//  DogFrame
//
//  Created by 解杨 on 16/3/18.
//  Copyright © 2016年 解杨. All rights reserved.
//

import Foundation
import UIKit

class PaddingViewController:DemoBaseViewController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.padding=(10,10,10,10)
        navigationItem.title="Padding"
        view.backgroundColor=UIWhiteColor
        initUI()
    }
    
    func initUI(){
        
        let infolabel=UILabel()
        infolabel.flexHBySuper()
        infolabel.text="Padding default:(0,0,0,0)"
        
        
        let backview=LabelView(text:"view")
        backview.padding=(20,20,20,20)
        backview.setLabelTest("view padding:\(backview.padding)")
//        backview.label.alignIgnore()
        backview.label.sizeToFit()
        backview.layer.borderWidth=0.5
        backview.layer.borderWidth=0.5
        backview.layer.borderColor=DogFrameBorderColor.CGColor
        backview.flexHBySuper()
        backview.flexVBySuper()
        
        let redview=LabelView(text:"red")
        redview.padding=(30,5,5,5)
        redview.setLabelTest("red padding:\(redview.padding)")
//        redview.label.alignIgnore()
        redview.label.sizeToFit()
        redview.layer.borderWidth=0.5
        redview.flexHBySuper()
        redview.flexVBySuper()
        redview.backgroundColor=UIColor.redColor()
        backview.VLayout(view: redview)
        
        let blueview=LabelView(text:"blue")
        blueview.layer.borderWidth=0.5
        blueview.flexHBySuper()
        blueview.flexVBySuper()
        blueview.backgroundColor=UIColor.blueColor()
        redview.VLayout(view: blueview)
        
        
        view.VLayout([infolabel,
            UIView.getHFlexView(height: 20),
            backview])
        
    }
}

