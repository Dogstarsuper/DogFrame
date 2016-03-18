//
//  VerticalViewController.swift
//  DogFrame
//
//  Created by 解杨 on 16/3/17.
//  Copyright © 2016年 解杨. All rights reserved.
//

import Foundation
import UIKit

class VerticalViewController: DemoBaseViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title="Vertical"
        view.backgroundColor=UIBlackColor
        view.gapV=0.5
        view.gapH=0.5
        initUI()
        
        checkAlignOrientation()

    }
    
    
    func initUI(){
        
        //left demo
        let layoutleftview=getDemoView( "Left(default)")
        
        //middle demo
        let layoutmiddleview=getDemoView("Middle")
        layoutmiddleview.showView.hAlignType = .HAlignMiddle
        
        //right demo
        let layoutrightview=getDemoView("Right")
        layoutrightview.showView.hAlignType = .HAlignRight
        
        view.VLayout([
            layoutleftview,
            layoutmiddleview,
            layoutrightview
            ])
        
    }
    
    func getDemoView(text:String)->DemoView{
        
        let demoview=DemoView(text: text)
        
        let redview=LabelView(frame: SizeMakeRect(50,height: 30))
        redview.setLabelTest("red")
        redview.backgroundColor=UIColor.redColor()
        redview.labelCenter()
        
        let blueview=LabelView(frame: SizeMakeRect(50,height: 20))
        blueview.setLabelTest("blue")
        blueview.backgroundColor=UIColor.blueColor()
        blueview.labelCenter()
        
        let greenview=LabelView(frame: SizeMakeRect(50,height: 20))
        greenview.setLabelTest("green")
        greenview.backgroundColor=UIColor.greenColor()
        greenview.labelCenter()
        
        demoview.showView.VLayout([redview,blueview,greenview])
        demoview.showView.vAlignType = .VAlignBottom
        
        return demoview
    }

    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator){
        checkAlignOrientation()
        
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
    }
    

}