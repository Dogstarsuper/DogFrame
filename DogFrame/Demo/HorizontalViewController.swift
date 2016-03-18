//
//  HorizontalViewController.swift
//  DogFrame
//
//  Created by 解杨 on 16/3/18.
//  Copyright © 2016年 解杨. All rights reserved.
//

import Foundation
import UIKit

class HorizontalViewController: DemoBaseViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title="Horizontal"
        view.backgroundColor=UIBlackColor
        view.gapV=0.5
        view.gapH=0.5
        initUI()
        
        checkAlignOrientation()
        
    }
    
    func initUI(){
        
        //top demo
        let layouttopview=getDemoView( "Top(default)")
        
        //center demo
        let layoutcenterview=getDemoView("Center")
        layoutcenterview.showView.vAlignType = .VAlignCenter
        
        //bottom demo
        let layoutbottomview=getDemoView("Bottom")
        layoutbottomview.showView.vAlignType = .VAlignBottom
        
        view.VLayout([
            layouttopview,
            layoutcenterview,
            layoutbottomview
            ])
        
    }
    
    func getDemoView(text:String)->DemoView{
        
        let demoview=DemoView(text: text)
        
        let redview=LabelView(frame: SizeMakeRect(20,height: 40))
        redview.setLabelTest("red")
        redview.backgroundColor=UIColor.redColor()
        
        let blueview=LabelView(frame: SizeMakeRect(20,height: 40))
        blueview.setLabelTest("blue")
        blueview.backgroundColor=UIColor.blueColor()
        
        let greenview=LabelView(frame: SizeMakeRect(20,height: 40))
        greenview.setLabelTest("green")
        greenview.backgroundColor=UIColor.greenColor()
        
        demoview.showView.HLayout([redview,blueview,greenview])
        demoview.showView.hAlignType = .HAlignMiddle
        
        return demoview
    }

    
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator){
        checkAlignOrientation()
        
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
    }
    
    
}