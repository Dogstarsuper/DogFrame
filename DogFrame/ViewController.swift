//
//  ViewController.swift
//  DogFrame
//
//  Created by 解杨 on 16/2/24.
//  Copyright © 2016年 解杨. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var button:UIButton = UIButton()
    var userlogo:UIView=UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.navigationBar.hidden=true
        edgesForExtendedLayout = UIRectEdge.None
        navigationItem.title="Test"
        view.backgroundColor=UIColor.whiteColor()
        view.flexHNone()
        view.flexVNone()
//        view.alignSub(AlignOrientation.AlignH)
        
        view.gapV=8
        view.padding=(10,10,10,10)
        
//        HAlignTest()
//        mixLayoutText()
//        HLayoutTest()
//        VLayoutTest()
//        singleViewTest()
        listTest()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        
        view.layout()
    }
    
    
    func singleViewTest()
    {
        let view1=UIView.getView(CGSize(width: 10,height: 100))
        view1.backgroundColor=UIColor.redColor()
        view1.flexHBySub()
        view1.tag=1
        
        view.VLayout(view: view1)
        
        
        let view11=UIView.getView(CGSize(width: 20, height: 10))
        view11.backgroundColor=UIColor.yellowColor()
        view11.tag=11
        let view12=UIView.getView(CGSize(width: 20, height: 10))
        view12.backgroundColor=UIColor.blueColor()
        view12.tag=12
        
        view1.VLayout([view11,view12])
    }
    
    
    func HLayoutTest(){
        
        let view1=UIView.getHFlexView(height:10)
        view1.backgroundColor=UIColor.redColor()
//        view1.flexHBySub()
        let view2=UIView.getHFlexView(height:20)
        view2.backgroundColor=UIColor.blueColor()
        
        view.HLayout([view1])
        
        view.tag=0
        view1.tag=1
        view2.tag=2
        
        
        
        let view11=UIView.getView(CGSize(width: 200, height: 5))
        view11.backgroundColor=UIColor.yellowColor()
//        view1.HLayout(view: view11)
        
    }
    
    func VLayoutTest(){
        
        let view1=UIView.getVFlexView(width:20)
        view1.backgroundColor=UIColor.redColor()
        let view2=UIView.getVFlexView(width:20)
        view2.backgroundColor=UIColor.blueColor()
        
        view.VLayout([view1,view2])
    }
    
    func mixLayoutText()
    {
        let view1=UIView.getVFlexView(width:75)
        view1.backgroundColor=UIColor.redColor()
        view1.flexHBySub()
        let view2=UIView.getFlexView()
        view2.backgroundColor=UIColor.blueColor()
        
        view.HLayout([view1,view2])
        
        let view11=UIView.getView(CGSize(width: 100, height: 100))
        view11.backgroundColor=UIColor.yellowColor()
        let view12=UIView.getView(CGSize(width: 50, height: 100))
        view12.backgroundColor=UIColor.greenColor()
        
        view1 .VLayout([view11,view12])
        
    }

    func HAlignTest()
    {
        view.backgroundColor=UIColor.blackColor()
        
        let view1=UIView.getFlexView()
        view1.backgroundColor=UIColor.redColor()
        view1.hAlignType=HAlignType.HAlignRight
        view1.vAlignType=VAlignType.VAlignCenter
        view1.gapH=30
        view1.tag=1
        
        let view11=UIView.getView(CGSize(width: 100, height: 100))
        view11.backgroundColor=UIColor.yellowColor()
        let view12=UIView.getView(CGSize(width: 50, height: 100))
        view12.backgroundColor=UIColor.greenColor()
        let view13=UIView.getView(CGSize(width: 10, height: 100))
        view13.backgroundColor=UIColor.yellowColor()
        
        view1.HLayout([view11,view12,view13])
        

        let view2=UIView.getFlexView()
        view2.backgroundColor=UIColor.whiteColor()
        view2.hAlignType=HAlignType.HAlignMiddle
        view2.vAlignType=VAlignType.VAlignBottom
        
        let view21=UIView.getView(CGSize(width: 100, height: 20))
        view21.backgroundColor=UIColor.yellowColor()
        let view22=UIView.getView(CGSize(width: 50, height: 20))
        view22.backgroundColor=UIColor.greenColor()
        
        view2.VLayout([view21,view22])
        
        let view3=UIView.getFlexView()
        view3.backgroundColor=UIColor.redColor()

        
        view.VLayout(objs:[view1,[view2,view3]])
        
        
    }
    
    func listTest(){
        view.padding=(8,8,8,8)
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
        namelabel.flexHBySuper()
        let infolabel=getLabel("Info")
        infolabel.flexHBySuper()
        
        let testview=UIView.getFlexView()
        testview.alignInfo.0 = AlignType.AlignIgnore
        userview .HLayout(objs:[
            testview,
            userlogo,])
//        userview .HLayout(objs:[[namelabel,infolabel]])
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
            
//            view .VLayout(view: cell)
        }
        
//        let button=UIButton(frame: CGRectMake(0,0,100,40))
        button.frame=CGRectMake(0,0,100,40)
        button.alignInfo.0 = .AlignSelf
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
        
        view.VLayout(view: button)
//        view.VLayout(view: field)
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
}

