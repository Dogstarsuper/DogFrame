//
//  FlexViewController.swift
//  DogFrame
//
//  Created by 解杨 on 16/3/18.
//  Copyright © 2016年 解杨. All rights reserved.
//

import Foundation
import UIKit

class FlexViewController:DemoBaseViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.title="Flex"
        view.backgroundColor=UIBlackColor
        view.gapV=0.5
        view.gapH=0.5
        initUI()
        checkAlignOrientation()
    }
    
    func initUI(){
        
        let gapVDemo=getDemoView("gapV(default:0)")
        gapVDemo.showView.gapV=10
        gapVDemo.showView.setLabelTest("view gapV:10")
        
        let gapHDemo=getDemoView("gapH(default:0)")
        gapHDemo.showView.gapH=10
        gapHDemo.showView.alignInfo.1 = .AlignH
        gapHDemo.showView.setLabelTest("view gapH:10")
        
        view.VLayout([gapVDemo,
            gapHDemo
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
