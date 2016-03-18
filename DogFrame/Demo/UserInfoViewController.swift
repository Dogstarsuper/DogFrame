//
//  UserInfoViewController.swift
//  DogFrame
//
//  Created by 解杨 on 16/3/18.
//  Copyright © 2016年 解杨. All rights reserved.
//

import Foundation
import UIKit

class UserDemoViewController:UIViewController{
    
    
    var button:UIButton = UIButton()
    var userlogo:UIView=UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = UIRectEdge.None
        navigationItem.title="User"
        view.backgroundColor=UIWhiteColor
        initUI()

    }
    
    func initUI(){
        
        view.padding=(8,8,8,8)
        view.gapV=8
        view.backgroundColor=UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        //        view.backgroundColor=UIColor.redColor()
        
        func border(view:UIView){
            view.layer.borderWidth=0.5
            view.layer.borderColor=UIColor.grayColor().CGColor
        }
        
        func getLabel(text:String)->UILabel{
            let label=UILabel(frame: CGRectMake(0,0,0,20))
            label.text=String(text)
            label.font=UIFont.systemFontOfSize(20)
            label.textColor=UIColor.blackColor()
            return label
        }
        
        let userview=UIView.getHFlexView(height: 0)
        userview.vAlignType = .VAlignCenter
        //        userview.hAlignType = .HAlignRight
        userview.flexVBySub()
        userview.gapH=8
        userview.gapV=8
        userview.padding=(8,9,8,9)
        userview.tag=1
        border(userview)
        
        //        let userlogo=UIView.getView(CGSize(width: 60, height: 60))
        userlogo.frame.size=CGSize(width: 60, height: 60)
        userlogo.backgroundColor=UIColor.blueColor()
        let namelabel=getLabel("姓名")
        //        namelabel.flexHBySuper()
        let infolabel=getLabel("Info")
        //        infolabel.flexHBySuper()
        
        let testview=UIView.getFlexView()
        testview.alignInfo.0 = AlignType.AlignIgnore
        //        userview .HLayout(objs:[
        ////            testview,
        //            userlogo,
        //            ])
        userview .HLayout(objs:[
            userlogo,
            [
                namelabel,
                infolabel]])
        //        userview.subviews[1].vAlignType = .VAlignCenter
        
                view.VLayout(view: userview)
        
        for index in 0...3{
            
            let cell=UIView.getHFlexView(height: 40)
            border(cell)
            cell.layer.cornerRadius=3
            cell.backgroundColor=UIColor.whiteColor()
            
            let namelabel=getLabel(String(index))
            namelabel.flexHBySuper()
            namelabel.flexVBySuper()
            
            cell.padding=(0,9,0,9)
            cell.HLayout([namelabel])
            
                        view .VLayout(view: cell)
        }
        
        //        let button=UIButton(frame: CGRectMake(0,0,100,40))
        button.frame=CGRectMake(0,0,100,40)
        //        button.alignInfo.0 = .AlignSelf
        //        button.alignInfo.0 = .AlignIgnore
//        button.alignIgnore()
        button.layer.cornerRadius=3
        button.backgroundColor=UIColor.blueColor()
        button.setTitle("press", forState: .Normal)
        button.setTitle("highlight", forState: .Highlighted)
        button.addTarget(self, action: Selector("buttonPress"), forControlEvents: .TouchUpInside)
        
        let field=UITextField(frame: CGRectMake(0,0,200,40))
        field.alignInfo.0 = .AlignSelf
        field.backgroundColor=UIColor.whiteColor()
        field.flexHBySuper()
        border(field)
        view.VLayout(view: field)
        view.VLayout(view: button)
        
    }
    
    func buttonPress()
    {
        button.enabled=false
        
        self.view.setNeedsUpdateConstraints()
        //        self.view.updateConstraintsIfNeeded()
        
        UIView.animateWithDuration(1, delay:0.01,
            options:UIViewAnimationOptions.TransitionNone, animations:
            {
                //                var width:CGFloat=200
                //                var height:CGFloat=100
                //                if(self.userlogo.frame.width==200)
                //                {
                //                    width=60
                //                    height=60
                //                }
                //
                //                self.userlogo.frame=CGRectMake(0, 0, width, height)
                
                //                let offview=UIView.getHFlexView(height: 10)
                //
                //                self.userlogo.superview?.insertSubview(offview, atIndex: 0)
                
                self.userlogo.superview?.hAlignType = .HAlignRight
                
                self.view.layoutIfNeeded()
                //                ()-> Void in
                //在动画中，数字块有一个角度的旋转。
                //                tile.layer.setAffineTransform(CGAffineTransformMakeRotation(90))
            },
            completion:{
                (finished:Bool) -> Void in
                //                UIView.animateWithDuration(1, animations:{
                //                    ()-> Void in
                //                    //完成动画时，数字块复原
                //                    tile.layer.setAffineTransform(CGAffineTransformIdentity)
                self.button.enabled=true
        })
        //        })
    }

    
    override func viewWillLayoutSubviews() {
        
        view.Layout()
        
    }

}
