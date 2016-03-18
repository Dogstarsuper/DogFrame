//
//  ViewController.swift
//  DogFrame
//
//  Created by 解杨 on 16/2/24.
//  Copyright © 2016年 解杨. All rights reserved.
//

import UIKit

let UIRedColor=UIColor.redColor()
let UIBlueColor=UIColor.blueColor()
let UIYellowColor=UIColor.yellowColor()

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView:UITableView?
    var cellTitles=["Vertical layout","Horizontal layout","Padding","Gap","Flex","User info demo"]
    var button:UIButton = UIButton()
    var userlogo:UIView=UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = UIRectEdge.None
        navigationItem.title="DogFrame"
        
        initTableview()
        
        
//        let a:CGFloat=CGFloat.infinity,b:CGFloat=100.0
//        
//        let a1=CGFloat.max ,a2=CGFloat.max
//        
//        let c=a+b
//        let d=a + b
        
//        let c1=a1+b1

//        navigationController?.navigationBar.hidden=true
        
//        view.backgroundColor=UIColor.whiteColor()
//        view.flexHNone()
//        view.flexVNone()
//        view.alignSub(AlignOrientation.AlignH)
        
//        view.gapV=20
//         view.gapH=20
//        view.padding=(10,10,10,10)
//        view.tag=1000
//        HAlignTest()
//        mixLayoutText()
//        VLayoutTest()
//        VLayoutTest()
//        singleViewTest()
//        listTest()
//        labelTest()
        
//        allHTest()
//        allVTest()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
        
//        view.layout()
//        view.setAlignHWidth(0, end: view.subviews.count)
//        view.layout()
//        let label:UIView? = view.viewWithTag(1)
//        
//        if label != nil {
//            label?.frame.size.width=300
//            label?.sizeToFit()
//        }

        
        view.Layout()
        
    }
    
    
    func initTableview(){
        tableView=UITableView()
        
        tableView?.flexHBySuper()
        tableView?.flexVBySuper()
        
        tableView?.delegate=self
        tableView?.dataSource=self
        
        view.VLayout(view: tableView!)
    }
    
    
    
//MARK:-tableview
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return cellTitles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        
        
        let cellid="cellid"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellid)
        if (cell == nil)
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellid)
            
            let cellview:UIView=(cell?.contentView)!
            
            cellview.padding=(5,10,5,10)
            cellview.vAlignType = .VAlignCenter
            
            let titlelable=UILabel()
            titlelable.text="text"
            titlelable.flexHBySuper()
            titlelable.tag=1
            cellview.HLayout(view: titlelable)
        }
        
        
        if let label:UIView = cell?.contentView.viewWithTag(1){
            if cellTitles.count > indexPath.row {
                (label as! UILabel).text = cellTitles[indexPath.row]
            }
        }
        
        cell?.contentView.Layout()
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        switch indexPath.row{
        case 0:
            let vc = VerticalViewController()
            navigationController?.pushViewController(vc, animated: true)
        case  1:
            let vc = HorizontalViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = PaddingViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = GapViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 4:
            let vc = FlexViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 5:
            let vc = UserDemoViewController()
            navigationController?.pushViewController(vc, animated: true)
        default:()
        }
        
    }
    
    
    func allVTest()
    {
        let view1=UIView.getView(CGSize(width: 20,height: 100))
        view1.backgroundColor=UIRedColor
        view1.flexVBySub()
        view1.tag=1
        
        
        let view11=UIView.getView(CGSize(width: 10,height: 50))
        view11.backgroundColor=UIBlueColor
        view11.tag=11
        
        view1 .VLayout([view11,])
        
        
        let view2=UIView.getView(CGSize(width: 50,height: 150))
        view2.backgroundColor=UIBlueColor
        view2.padding=(5,5,5,5)
        view2.flexHBySuper()
        view2.flexVBySuper()
        view2.tag=2
        view2.gapH=10
        
        let view21=UIView.getView(CGSize(width: 50,height: 60))
        view21.backgroundColor=UIYellowColor
        //        view21.flexHBySuper()
        view21.flexVBySub()
        view21.tag=21
        
        let view22=UIView.getView(CGSize(width: 50,height: 60))
        view22.backgroundColor=UIRedColor
        view22.flexVBySuper()
        view22.tag=22
        
        view2 .VLayout([
            view21,
            view22
            ])
        
        let view3=UIView.getView(CGSize(width: 50,height: 200))
        view3.backgroundColor=UIYellowColor
        view3.tag=3
        
        let view33=UIView.getView(CGSize(width: 50,height: 100))
        view33.backgroundColor=UIRedColor
        view33.tag=33
        view33.flexHBySuper()
        view3 .HLayout([view33,])
        
        
        let label:UILabel=UILabel(frame: CGRectMake(0,0,100,30))
        label.flexHBySuper()
        label.numberOfLines=0
        label.text="2014年德国汉诺威工业博览会4月7日至11日举行。全球65个国家和地区的5000多家厂商参展。中国以近600家参展商规模成为东道主德国以外的最大参展国。"
        
        view .VLayout([
            label,
            view1,
            view2,
            view3
            ])
        
        view.hAlignType = .HAlignRight
        
    }
    
    func allHTest()
    {
        let view1=UIView.getView(CGSize(width: 20,height: 100))
        view1.backgroundColor=UIRedColor
        view1.flexHBySub()
        view1.tag=1
        
        
        let view11=UIView.getView(CGSize(width: 10,height: 50))
        view11.backgroundColor=UIBlueColor
        view11.tag=11
        
        view1 .HLayout([view11,])
        
        
        let view2=UIView.getView(CGSize(width: 50,height: 150))
        view2.backgroundColor=UIBlueColor
        view2.padding=(5,5,5,5)
        view2.flexHBySuper()
        view2.flexVBySub()
        view2.flexVBySuper()
        view2.tag=2
        view2.gapH=10
        
        let view21=UIView.getView(CGSize(width: 50,height: 60))
        view21.backgroundColor=UIYellowColor
//        view21.flexHBySuper()
        view21.flexVBySub()
        view21.tag=21
        
        let view22=UIView.getView(CGSize(width: 50,height: 60))
        view22.backgroundColor=UIRedColor
        view22.flexHBySuper()
        view22.tag=22
        
        view2 .HLayout([
            view21,
            view22
            ])
        
        let view3=UIView.getView(CGSize(width: 50,height: 200))
        view3.backgroundColor=UIYellowColor
        view3.tag=3
        
        let view33=UIView.getView(CGSize(width: 50,height: 100))
        view33.backgroundColor=UIRedColor
        view33.tag=33
        view33.flexHBySuper()
        view3 .HLayout([view33,])
        
        
        let label:UILabel=UILabel(frame: CGRectMake(0,0,100,30))
        label.flexHBySuper()
        label.numberOfLines=0
        label.text="2014年德国汉诺威工业博览会4月7日至11日举行。全球65个国家和地区的5000多家厂商参展。中国以近600家参展商规模成为东道主德国以外的最大参展国。"
        
        view .HLayout([
            label,
            view2,
            view3
            ])
//        view.hAlignType = .HAlignRight
//        view.vAlignType = .VAlignBottom
    }
    
    func singleViewTest()
    {
        let view1=UIView.getView(CGSize(width: 10,height: 100))
        view1.backgroundColor=UIColor.redColor()
        view1.flexHBySub()
        view1.tag=1
        
        view.VLayout(view: view1)
        
        
        let view11=UIView.getView(CGSize(width: 100, height: 10))
        view11.backgroundColor=UIColor.yellowColor()
        view11.tag=11
        let view12=UIView.getView(CGSize(width: 100, height: 10))
        view12.backgroundColor=UIColor.blueColor()
        view12.tag=12
        
        view1.VLayout([view11,view12])
    }
    
    
    func HLayoutTest(){
        
        let view1=UIView.getHFlexView(height:30)
        view1.backgroundColor=UIColor.redColor()
        view1.flexHBySub()
        view1.flexVBySub()
        view1.padding=(5,5,5,5)
        let view2=UIView.getHFlexView(height:20)
//        let view2=UIView.getView(CGSize(width: 200, height: 15))
        view2.flexVBySuper()
        view2.backgroundColor=UIColor.blueColor()
        view2.padding=(5,5,5,5)
        view1.HLayout([view2])
        
        view.tag=0
        view1.tag=1
        view2.tag=2
        
        
        
//        let view11=UIView.getView(CGSize(width: 150, height: 5))
//        view11.backgroundColor=UIColor.yellowColor()
//        view2.HLayout([view11])
        
        view.HLayout(view: view1)
        
    }
    
    func VLayoutTest(){
        
        let view1=UIView.getVFlexView(width:20)
        view1.backgroundColor=UIColor.redColor()
        view1.padding=(5,5,5,5)
        view1.flexHBySub()
        let view11=UIView.getVFlexView(width:20)
        view11.backgroundColor=UIColor.blueColor()
        
        view1.VLayout([
            view11,
            //            view2
            ])
        
        let view2=UIView.getVFlexView(width:20)
        view2.backgroundColor=UIColor.blueColor()
        
        view.VLayout([
            view1,
//            view2
            ])
    }
    
    func mixLayoutText()
    {
        let view1=UIView.getVFlexView(width:75)
        view1.backgroundColor=UIColor.redColor()
        view1.padding=(5,5,5,5)
        view1.flexHBySub()
        view1.tag=1
        view1.hAlignType = .HAlignRight
        let view2=UIView.getFlexView()
        view2.backgroundColor=UIColor.blueColor()
        view2.tag=2
        
        
        let view11=UIView.getView(CGSize(width: 50, height: 100))
        view11.backgroundColor=UIColor.yellowColor()
        view11.tag=11
        let view12=UIView.getView(CGSize(width: 100, height: 100))
        view12.backgroundColor=UIColor.greenColor()
        view12.tag=12
        view1 .VLayout([
            view11,
            view12
            ])
        
            view.HLayout([
                view1,
                view2
                ])
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
    
    func labelTest(){
        let label=UILabel(frame: CGRectMake(0,0,150,100))
        label.tag=1
        label.numberOfLines=0
        label.flexHBySuper()
        label.text="红星此款套件板件设计合理，在表现细节的同时也尽可能的将零件整合在一起，所有可以开启的舱盖都是全活动的，炮塔的内构在组装设计方面非常不错，尤其是内构与外装甲的组合，感觉和实车的组合方式应该类似。套件组合度非常优秀，只是履带未能开出下垂感 。"
//        label.flexVBySub()
        
        let labelview=UIView.getHFlexView(height: 10)
        labelview.padding=(5,5,5,5)
        labelview.flexVBySub()
        labelview.flexHBySub()
        labelview.tag=1
        labelview.backgroundColor=UIColor.yellowColor()
        let bottomview=UIView.getHFlexView(height: 20)
        bottomview.backgroundColor=UIColor.redColor()
        label.sizeToFit()
        labelview .HLayout(objs:[
            label,
//            UIView.getView(CGSize(width: 100,height: 10))
            
            ])
        
        view.HLayout(objs: [labelview
//            ,bottomview
            ])
        
        
        
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
        
//        view.VLayout(view: userview)
        
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
//        button.alignInfo.0 = .AlignSelf
//        button.alignInfo.0 = .AlignIgnore
        button.alignIgnore()
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

