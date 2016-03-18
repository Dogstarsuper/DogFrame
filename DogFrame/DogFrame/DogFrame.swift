//
//  DogFrame.swift
//  DogFrame
//
//  Created by 解杨 on 16/2/24.
//  Copyright © 2016年 解杨. All rights reserved.
//

import Foundation
import UIKit



enum FlexType
{
    case FlexNone
    case FlexBySuper
    case FlexBySub
}

enum AlignType
{
    case AlignAll
    case AlignSub//subviews排版，自身不排版
    case AlignSelf//自身排版，subviews不排版
    case AlignIgnore//完全不排版
}

public enum AlignOrientation
{
    case AlignNone
    case AlignH//自身纵向排版
    case AlignV//自身横向排版
}

enum HAlignType
{
    case HAlignLeft
    case HAlignMiddle
    case HAlignRight
}

enum VAlignType
{
    case VAlignTop
    case VAlignCenter
    case VAlignBottom
}

enum HLineAlignType
{
    case HLineAlignTypeTop
    case HLineAlignTypeCenter
    case HLineAlignTypeBottom
}

typealias PaddingType = (top:CGFloat,left:CGFloat,bottom:CGFloat,right:CGFloat)
typealias Flex=(FlexType,CGFloat)
typealias AlignData=(normalsize:CGSize,maxsize:CGSize,normalview:Int,flexview:Int)
typealias AlignInfo=(AlignType,AlignOrientation)



//public func + (lf:CGFloat,rf:CGFloat)->CGFloat{
//    return (lf==CGFloat.infinity || rf==CGFloat.infinity) ? CGFloat.infinity : lf + rf
//}

//func floatplus(float:CGFloat,to:CGFloat)->CGFloat{
//    return (float==CGFloat.infinity || to==CGFloat.infinity) ? CGFloat.infinity : float+to
//}

func CGSizeJoin(size:CGSize,to:CGSize)->CGSize{
    
    return CGSize(width: size.width+to.width,height: size.height+to.height)
}

func SizeMakeRect(width:CGFloat,height:CGFloat)->CGRect{
    return CGRectMake(0, 0, width, height)
}

class FrameData
{
//    var alignType:AlignType=AlignType.AlignIgnore
    var alignInfo:AlignInfo=(AlignType.AlignAll,AlignOrientation.AlignNone)
    var gapH:CGFloat=0.0
    var gapV:CGFloat=0.0
//    var flexHeight:Flex=(false,0.0)
//    var flexWidth:Flex=(false,0.0)
    var flexV:Flex=(.FlexNone,0.0)
    var flexH:Flex=(.FlexNone,0.0)
    var padding:PaddingType=(0.0,0.0,0.0,0.0)
    var hAlignType:HAlignType=HAlignType.HAlignLeft
    var vAlignType:VAlignType=VAlignType.VAlignTop
    var alignData:AlignData=(CGSizeZero,CGSizeZero,0,0)
}

extension UIView
{
    private struct AssociatedKeys {
        
        static var frameData:FrameData?
    }
    
    var frameData:FrameData?{
        get{
            return objc_getAssociatedObject(self, &AssociatedKeys.frameData) as? FrameData
        }
        set{
            if let newValue = newValue {
                objc_setAssociatedObject(
                    self,
                    &AssociatedKeys.frameData,
                    newValue as FrameData?,
                    objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC
                )
            }
        }
    }

}


extension UIView{
    static func getView(size:CGSize)->UIView{
        let view=UIView(frame: CGRectMake(0.0,0.0,size.width,size.height))
        
        return view
    }
    
    static func getHFlexView(height height:CGFloat)->UIView{
        let view=getView(CGSize(width: 0.0,height: height))
        view.flexHBySuper()
        return view
    }
    
    static func getVFlexView(width width:CGFloat)->UIView{
        let view=getView(CGSize(width: width,height: 0.0))
        view.flexVBySuper()
        return view
    }
    
    
    static func getFlexView()->UIView
    {
        let view=getView(CGSize(width: 0.0,height: 0.0))
        view.flexVBySuper()
        view.flexHBySuper()
        return view
    }
    
    
}


extension UIView
{
    
    
    
    func checkFrameData(){
        if let _=frameData{
            
        }
        else
        {
            frameData=FrameData()
        }
    }
    
    var alignInfo:AlignInfo{
        get{
            if let info=frameData?.alignInfo{
                return info
            }else{
                return (.AlignAll,.AlignNone)
            }
        }
        set(newdata){
            checkFrameData()
            frameData?.alignInfo=newdata
        }
    }
    
    var gapH:CGFloat{
        get{
            if let gap=frameData?.gapH{
                return gap
            }else{
                return 0.0
            }
        }
        set(newdata){
            checkFrameData()
            frameData?.gapH=newdata
        }
    }
    
    var gapV:CGFloat{
        get{
            if let gap=frameData?.gapV{
                return gap
            }else{
                return 0.0
            }
        }
        set(newdata){
            checkFrameData()
            frameData?.gapV=newdata
        }
    }
    
    var padding:(top:CGFloat,left:CGFloat,bottom:CGFloat,right:CGFloat)
        {
        get{
            if let padding=frameData?.padding{
                return padding
            }
            else
            {
                return (0.0,0.0,0.0,0.0)
            }
        }
        set(newdata){
            checkFrameData()
            frameData?.padding=newdata
        }
        
    }
    
    var hAlignType:HAlignType{
        get{
            if let align=frameData?.hAlignType{
                return align
            }else{
                return .HAlignLeft
            }
        }
        set(newdata){
            checkFrameData()
            frameData?.hAlignType=newdata
        }
    }

    var vAlignType:VAlignType{
        get{
            if let align=frameData?.vAlignType{
                return align
            }else{
                return .VAlignTop
            }
        }
        set(newdata){
            checkFrameData()
            frameData?.vAlignType=newdata
        }
    }
    
    var flexH:Flex{
        get{
            if let flex=frameData?.flexH{
                return flex
            }
            else{
                return (.FlexNone,0.0)
            }
        }
        set(newdata){
            checkFrameData()
            frameData?.flexH=newdata
        }
    }
    
    var flexV:Flex{
        get{
            if let flex=frameData?.flexV{
                return flex
            }
            else{
                return (.FlexNone,0.0)
            }
        }
        set(newdata){
            checkFrameData()
            frameData?.flexV=newdata
        }
    }
    
    var alignData:AlignData{
        get{
            if let data=frameData?.alignData{
                return data
            }
            else{
                return (CGSizeZero,CGSizeZero,0,0)
            }
        }
        set(newdata){
            checkFrameData()
            frameData?.alignData=newdata
        }
    }
    
    
    public func align(orientation:AlignOrientation)
    {
        alignInfo=(.AlignAll,orientation)
    }
    
    public func alignSelf()
    {
        alignInfo=(.AlignSelf,.AlignNone)
    }
    
    public func alignSub(orientation:AlignOrientation)
    {
        alignInfo=(.AlignSub,orientation)
    }
    
    public func alignIgnore()
    {
        alignInfo=(.AlignIgnore,.AlignNone)
    }

    public func flexHBySuper(flex:CGFloat)
    {
        flexH=(.FlexBySuper,flex)
    }
    
    public func flexHBySuper()
    {
        flexHBySuper(1.0)
    }
    
    public func flexVBySuper(flex:CGFloat)
    {
        flexV=(.FlexBySuper,flex)
    }
    
    public func flexVBySuper()
    {
        flexVBySuper(1.0)
    }
    
    public func flexHBySub()
    {
        flexH=(.FlexBySub,0.0)
    }
    
    public func flexVBySub()
    {
        flexV=(.FlexBySub,0.0)
    }
    
    public func flexHNone()
    {
        flexH=(.FlexNone,0.0)
    }
    
    public func flexVNone()
    {
        flexV=(.FlexNone,0.0)
    }
    
//    public func flexHeight(flex:Bool)
//    {
//        flexHeight=(true,0.0)
//    }
//    
//    public func flexWidth(flex:Bool){
//        flexWidth=(true,0.0)
//    }
    
    
    
    
    
    public func VLayout(objs objs:[AnyObject])
    {
        for obj in objs
        {
            if obj is UIView {
                addSubview(obj as! UIView)
//                HLayout(view: UIView(obj))
            }
            else if  obj is [UIView] {
                
                let view=UIView.getFlexView()
                view.flexVBySub()
                view.flexHBySub()
                view.gapV=gapV
                view.gapH=gapH
                view.HLayout(obj as! [UIView])
                
                addSubview(view)
            }
            
        }
        
        alignInfo=(alignInfo.0,.AlignV)
    }
    
    public func VLayout(views:[UIView])
    {
        for view in views
        {
            addSubview(view)
        }
        
        alignInfo=(alignInfo.0,.AlignV)
//        alignType=AlignType.AlignV
    }
    
    public func VLayout(view view:UIView){
        addSubview(view)
        alignInfo=(alignInfo.0,.AlignV)
    }
    
    
    public func HLayout(objs objs:[AnyObject])
    {
        for obj in objs
        {
            if obj is UIView {
                addSubview(obj as! UIView)
                //                HLayout(view: UIView(obj))
            }
            else if  obj is [UIView] {
                
                let view=UIView.getFlexView()
                view.flexVBySub()
                view.flexHBySub()
                view.gapV=gapV
                view.gapH=gapH
                view.VLayout(obj as! [UIView])
                
                addSubview(view)
            }
            
        }
        
        alignInfo=(alignInfo.0,.AlignH)
    }
    
    public func HLayout(views:[UIView])
    {
        for view in views
        {
            addSubview(view)
        }
        alignInfo=(alignInfo.0,.AlignH)
//        alignType=AlignType.AlignH
    }
    
    
    public func HLayout(view view:UIView){
        addSubview(view)
        alignInfo=(alignInfo.0,.AlignH)
    }
    

}


extension UIView{

    
    func getLayoutSubviewsCount()->Int{
        
        var count=0
        for subview in subviews{
            guard  subview.alignInfo.0 == .AlignAll || subview.alignInfo.0 == .AlignSelf else
            {
                continue
            }
            count++
        }
        
        return count
    }
    
    
    func checkAlignVWidth(start:Int,end:Int){
        
        guard !(self is UILayoutSupport) && alignInfo.0 != .AlignIgnore  && alignInfo.0 != .AlignSelf   else  {
            return
        }
        
        if getLayoutSubviewsCount() == 0 {
            
            switch flexH.0{
            case .FlexBySub:
                alignData.normalsize.width=0
                alignData.maxsize.width=0
            case .FlexBySuper:
                alignData.normalsize.width=0
                alignData.maxsize.width=CGFloat.infinity
            case .FlexNone:
                alignData.normalsize.width=frame.size.width
                alignData.maxsize.width=frame.size.width
            }
            
            return
        }
        
        var normalwidth:CGFloat=0
        var maxwidth:CGFloat=0
        
        if end>=start{
            
            for index in start...end{
                
                guard subviews.count>index else{
                    continue
                }
                
                let subview=subviews[index]
                
                guard !(subview is UILayoutSupport) && subview.alignInfo.0 != .AlignIgnore && subview.alignInfo.0 != .AlignSub else{
                    continue
                }
                
//                subview .checkAlignVWidth(0, end: subview.subviews.count)
                subview .checkWidth(0, end: subview.subviews.count)
                
                switch subview.flexH.0{
                case .FlexBySub:
                    
                    if subview.alignData.maxsize.width == CGFloat.infinity {
                        normalwidth = max(normalwidth,subview.alignData.normalsize.width)
                        maxwidth = max(maxwidth, subview.alignData.maxsize.width)
                    }
                    else{
                        normalwidth=0
                        maxwidth=CGFloat.infinity
                    }
                case .FlexNone:
                    normalwidth = max(normalwidth,subview.alignData.normalsize.width)
                    maxwidth = max(maxwidth, subview.alignData.maxsize.width)
                    
                case .FlexBySuper:
                    maxwidth=CGFloat.infinity
                }
            }
        }
        
        normalwidth+=(padding.left+padding.right)
        maxwidth+=(padding.top+padding.bottom)
        alignData.normalsize.width=normalwidth
        alignData.maxsize.width=maxwidth
    }
    
    
    
    func resetAlignVWidth(start:Int,end:Int)
    {
        guard getLayoutSubviewsCount()>0 && alignInfo.0 != .AlignIgnore  && alignInfo.0 != .AlignSelf   else  {
            return
        }
        
//        switch flexH.0{
//        case .FlexBySub:
//            frame.size.width = alignData.normalsize.width+padding.left+padding.right
//        default:()
//        }
        
        if(end>=start)
        {
            var startx:CGFloat=padding.left
            let totalwidth=frame.size.width-padding.left-padding.right
            
            
            
            for index in start...end{
                
                startx=padding.left
                
                guard subviews.count>index else{
                    continue
                }
                
                let subview=subviews[index]
                
                guard !(subview is UILayoutSupport) && subview.alignInfo.0 != .AlignIgnore && subview.alignInfo.0 != .AlignSub else{
                    continue
                }
                
                switch subview.flexH.0{
                case .FlexBySuper:
                    subview.frame.size.width=totalwidth
                case  .FlexBySub:
                    
                    if subview.alignData.maxsize.width == CGFloat.infinity{
                        subview.frame.size.width=totalwidth
                    }
                    else{
                        subview.frame.size.width=subview.alignData.normalsize.width
                    }
                    
                default:()
                }
                
                let leftwidth=totalwidth-subview.frame.size.width
                
                if leftwidth>0
                {
                    if hAlignType == .HAlignRight{
                        startx+=leftwidth
                        
                    }
                    else if hAlignType == .HAlignMiddle{
                        startx+=leftwidth/2
                    }
                }
                subview.frame.origin.x = startx
                
                if subview is UILabel{
                    let label = subview as! UILabel
                    label.sizeToFit()
                }
                
//                subview.resetAlignVWidth(start, end: end)
                subview.resetWidth(start, end: end)
            }

        }
        
    }
    
    func checkAlignHWidth(start:Int,end:Int)
    {
        guard !(self is UILayoutSupport) && alignInfo.0 != .AlignIgnore  && alignInfo.0 != .AlignSelf   else  {
            return
        }
        
        
        if getLayoutSubviewsCount() == 0 {

            switch flexH.0{
            case .FlexBySub:
                alignData.normalsize.width=0
                alignData.maxsize.width=0
            case .FlexBySuper:
                alignData.normalsize.width=0
                alignData.maxsize.width=CGFloat.infinity
            case .FlexNone:
                alignData.normalsize.width=frame.size.width
                alignData.maxsize.width=frame.size.width
            }
            
            return
        }
        
        //normal是sub和none的长度
        var normalwidth:CGFloat=0.0
        var maxwidth:CGFloat=0.0
        
//        if flexH.0 == .FlexNone{
//            normalwidth=0
//            maxwidth=0
//        }else if flexH.0 == .FlexBySuper{
//            normalwidth=CGFloat.infinity
//            maxwidth=CGFloat.infinity
//        }
        
        var normalcount=0
        var flexcount=0
        
        if end>=start{
            
            for index in start...end{
                
                
                guard subviews.count>index else{
                    continue
                }
                
                let subview=subviews[index]
                
                guard !(subview is UILayoutSupport) && subview.alignInfo.0 != .AlignIgnore && subview.alignInfo.0 != .AlignSub else{
                    continue
                }
                
//                subview .checkAlignHWidth(0, end: subview.subviews.count)
                subview .checkWidth(start,end:end)
                
                
                
//                if flexH.0 == .FlexBySub {
                    switch subview.flexH.0{
                    case .FlexBySub:
                        
                        
                        
                        if subview.alignData.maxsize.width == CGFloat.infinity{
                            maxwidth=CGFloat.infinity
                            flexcount++
                        }
                        else
                        {
                            normalwidth+=subview.alignData.normalsize.width
                            maxwidth+=subview.alignData.maxsize.width
                            normalcount++
                        }
//                        normalcount++
                        
                        
                    case .FlexNone:
                        
//                        if flexH.0 == .FlexBySub {
                        
                        normalwidth+=subview.frame.size.width
                        maxwidth+=subview.frame.size.width
//                        }
                        normalcount++
                    case .FlexBySuper:
                        
//                        if flexH.0 == .FlexBySub {
                            maxwidth=CGFloat.infinity
//                        }
                        
                        flexcount++
                    }
//                }
                
            }
        }
        
        
        
        if  (normalcount+flexcount)>1 {
            normalwidth += gapH*CGFloat(normalcount+flexcount-1)
            maxwidth += gapH*CGFloat(normalcount+flexcount-1)
        }
        normalwidth+=(padding.left+padding.right)
        maxwidth+=(padding.left+padding.right)
        
        alignData.normalview=normalcount
        alignData.flexview=flexcount
        
        
        alignData.normalsize.width=normalwidth
        alignData.maxsize.width=maxwidth
    }
    
    
    func resetAlignHWidth(start:Int,end:Int){
        
        
        guard getLayoutSubviewsCount() >= 0 && alignInfo.0 != .AlignIgnore   else  {
            return
        }
        
        
        if end>=start{
            

            
            let totalwidth=frame.size.width //-padding.left-padding.right
            var leftwidth=totalwidth-alignData.normalsize.width
            var singlelength:CGFloat=leftwidth
            let flexcount=alignData.flexview
            if  flexcount>0 {
                
                singlelength=leftwidth/CGFloat(flexcount)
                leftwidth=0
            }
            else{
                
            }
            
            
            var startx=padding.left
            
            if hAlignType == .HAlignRight{
                startx+=leftwidth
            }
            else if hAlignType == .HAlignMiddle{
                startx+=leftwidth/2
            }
            
            for index in start...end{
                
                guard subviews.count>index else{
                    continue
                }
                
                let subview=subviews[index]
                
                guard !(subview is UILayoutSupport) && subview.alignInfo.0 != .AlignIgnore && subview.alignInfo.0 != .AlignSub else{
                    continue
                }
                
                subview.frame.origin.x = startx
                

                switch subview.flexH.0 {
                case .FlexBySuper:
                    subview.frame.size.width=singlelength
                case .FlexBySub:
                    if subview.alignData.maxsize.width == CGFloat.infinity{
                       subview.frame.size.width=singlelength
                    }
                    else{
                        subview.frame.size.width=subview.alignData.normalsize.width
                    }
                    
//                    subview.frame.size.width=subview.alignData.normalsize.width
                case .FlexNone:()
                }
                
                startx+=subview.frame.size.width
                startx+=gapH
                
//                subview.resetAlignHWidth(0, end: subview.subviews.count)
                subview.resetWidth(0, end: subview.subviews.count)
                if subview is UILabel{
                    let label = subview as! UILabel
                    label.sizeToFit()
                }
            }
        }
        
    }
    
    
    func  checkWidth(start:Int,end:Int){
        
        if alignInfo.1 == .AlignH {
            checkAlignHWidth(0, end: subviews.count)
        }
        else if alignInfo.1 == .AlignV {
            checkAlignVWidth(0, end: subviews.count)
        }
        else {
            alignData.normalsize.width=frame.size.width
            alignData.maxsize.width=frame.size.height
        }
    }
    
    func resetWidth(start:Int,end:Int){
    
        if alignInfo.1 == .AlignH {
            resetAlignHWidth(0, end: subviews.count)
        }
        else if alignInfo.1 == .AlignV {
            resetAlignVWidth(0, end: subviews.count)
        }
    }
    
    
    func  checkHeight(start:Int,end:Int){
        
        if alignInfo.1 == .AlignH {
            checkAlignHHeight(0, end: subviews.count)
        }
        else if alignInfo.1 == .AlignV {
            checkAlignVHeight(0, end: subviews.count)
        }
        else {
            alignData.normalsize.height=frame.size.height
            alignData.maxsize.height=frame.size.height
        }
    }
    
    func resetHeight(start:Int,end:Int){
        
        if alignInfo.1 == .AlignH {
            resetAlignHHeight(0, end: subviews.count)
        }
        else if alignInfo.1 == .AlignV {
            resetAlignVHeight(0, end: subviews.count)
        }
    }
    
    
    
    
    func layoutH(start:Int,end:Int){
        
        checkAlignHWidth(0, end: subviews.count)
        
        resetAlignHWidth(0, end: subviews.count)
        
        checkAlignHHeight(0, end: subviews.count)
        
        resetAlignHHeight(0, end: subviews.count)
    }
    
    func layoutV(start:Int,end:Int){
        checkAlignVWidth(0, end: subviews.count)
        
        resetAlignVWidth(0, end: subviews.count)
        
        checkAlignVHeight(0, end: subviews.count)
        
        resetAlignVHeight(0, end: subviews.count)
    }
    
    
    func checkAlignVHeight(start:Int,end:Int)
    {
        guard !(self is UILayoutSupport) && alignInfo.0 != .AlignIgnore  && alignInfo.0 != .AlignSelf   else  {
            return
        }
        
        if getLayoutSubviewsCount() == 0 {
            
            switch flexH.0{
            case .FlexBySub:
                alignData.normalsize.height=0
                alignData.maxsize.height=0
            case .FlexBySuper:
                alignData.normalsize.height=0
                alignData.maxsize.height=CGFloat.infinity
            case .FlexNone:
                alignData.normalsize.height=frame.size.height
                alignData.maxsize.height=frame.size.height
            }
            return
        }
        
        var normalheight:CGFloat=0.0
        var maxheight:CGFloat=0.0
        
        var normalcount=0
        var flexcount=0
        
        
        if end>=start{
            
            for index in start...end{
                
                
                guard subviews.count>index else{
                    continue
                }
                
                let subview=subviews[index]
                
                guard !(subview is UILayoutSupport) && subview.alignInfo.0 != .AlignIgnore && subview.alignInfo.0 != .AlignSub else{
                    continue
                }
                
//                subview .checkAlignVHeight(0, end: subview.subviews.count)
                subview .checkHeight(0, end: subview.subviews.count)
                switch subview.flexV.0{
                case .FlexBySub:
                    
                    if subview.alignData.maxsize.height == CGFloat.infinity{
                        maxheight=CGFloat.infinity
                        flexcount++
                    }
                    else{
                        normalheight+=subview.alignData.normalsize.height
                        maxheight+=subview.alignData.maxsize.height
                        normalcount++
                    }
//                    normalheight+=subview.alignData.normalsize.height
//                    maxheight+=subview.alignData.maxsize.height
//                    normalcount++
                case .FlexNone:
                    
                    //                        if flexH.0 == .FlexBySub {
                    
                    normalheight+=subview.frame.size.height
                    maxheight+=subview.frame.size.height
                    //                        }
                    normalcount++
                case .FlexBySuper:
                    
                    //                        if flexH.0 == .FlexBySub {
                    maxheight=CGFloat.infinity
                    //                        }
                    
                    
                    flexcount++
                }
            }
            
            
            if  (normalcount+flexcount)>1 {
                normalheight += gapV*CGFloat(normalcount+flexcount-1)
                maxheight += gapH*CGFloat(normalcount+flexcount-1)
            }
            normalheight+=(padding.top+padding.bottom)
            maxheight+=(padding.top+padding.bottom)
            
            alignData.normalview=normalcount
            alignData.flexview=flexcount
            
            
            alignData.normalsize.height=normalheight
            alignData.maxsize.height=maxheight
        }
    }
    
    func resetAlignVHeight(start:Int,end:Int){
        
        guard getLayoutSubviewsCount() >= 0 && alignInfo.0 != .AlignIgnore   else  {
            return
        }
        
//        switch flexH.0{
//        case .FlexBySub:
//            frame.size.height = alignData.normalsize.height+padding.top+padding.bottom
//        default:()
//        }
        
        if end>=start{
            
            
            let totalheight=frame.size.height //-padding.left-padding.right
            var leftheight=totalheight-alignData.normalsize.height
            var singlelength:CGFloat=leftheight
            let flexcount=alignData.flexview
            if  flexcount>0 {
                
                singlelength=leftheight/CGFloat(flexcount)
                leftheight=0
            }
            else{
                
            }
            
            
            var starty=padding.top
            
            if vAlignType == .VAlignBottom{
                starty+=leftheight
            }
            else if vAlignType == .VAlignCenter{
                starty+=leftheight/2
            }
            
            for index in start...end{
                
                guard subviews.count>index else{
                    continue
                }
                
                let subview=subviews[index]
                
                guard !(subview is UILayoutSupport) && subview.alignInfo.0 != .AlignIgnore && subview.alignInfo.0 != .AlignSub else{
                    continue
                }
                
                subview.frame.origin.y = starty
                
                
                switch subview.flexV.0 {
                case .FlexBySuper:
                    subview.frame.size.height=singlelength
                case .FlexBySub:
                    
                    if subview.alignData.maxsize.height ==  CGFloat.infinity {
                        subview.frame.size.height=singlelength
                    }
                    else{
                       subview.frame.size.height=subview.alignData.normalsize.height
                    }
                    
                case .FlexNone:()
                }
                
                starty+=subview.frame.size.height
                starty+=gapV
                
//                subview.resetAlignVHeight(0, end: subview.subviews.count)
                subview.resetHeight(0, end: subview.subviews.count)
            }
        }

        
    }
    
    func checkAlignHHeight(start:Int,end:Int)
    {
        guard alignInfo.0 != .AlignIgnore  && alignInfo.0 != .AlignSelf   else  {
            return
        }
    
        if getLayoutSubviewsCount() == 0 {
        
//            alignData.normalsize.height=0
//            alignData.maxsize.height=0
            
            switch flexV.0{
            case .FlexBySub:
                alignData.normalsize.height=0
                alignData.maxsize.height=0
            case .FlexBySuper:
                alignData.normalsize.height=0
                alignData.maxsize.height=CGFloat.infinity
            case .FlexNone:
                alignData.normalsize.height=frame.size.height
                alignData.maxsize.height=frame.size.height
            }
            return
        }
        
        var normalheight:CGFloat=0
        var maxheight:CGFloat=0
        
        if end>=start{
            
            for index in start...end{
                
                
                guard subviews.count>index else{
                    continue
                }
                
                let subview=subviews[index]
                
                guard !(subview is UILayoutSupport) && subview.alignInfo.0 != .AlignIgnore && subview.alignInfo.0 != .AlignSub else{
                    continue
                }
                
//                subview .checkAlignHHeight(0, end: subview.subviews.count)
                subview .checkHeight(0, end: subview.subviews.count)
                
                switch subview.flexV.0{
                case .FlexBySub:
//                    fallthrough
                    
                    if subview.alignData.maxsize.height == CGFloat.infinity{
                        maxheight=CGFloat.infinity
                    }
                    else{
                        normalheight = max(normalheight,subview.alignData.normalsize.height)
                        maxheight = max(maxheight, subview.alignData.maxsize.height)
                    }
                case .FlexNone:
                    normalheight = max(normalheight,subview.alignData.normalsize.height)
                    maxheight = max(maxheight, subview.alignData.maxsize.height)

                case .FlexBySuper:
                    maxheight=CGFloat.infinity
                }
            }
        }
        
        normalheight+=(padding.top+padding.bottom)
        maxheight+=(padding.top+padding.bottom)
        alignData.normalsize.height=normalheight
        alignData.maxsize.height=maxheight

    }
    
    func resetAlignHHeight(start:Int,end:Int)
    {
        guard getLayoutSubviewsCount()>0 && alignInfo.0 != .AlignIgnore  && alignInfo.0 != .AlignSelf   else  {
            return
        }
        
        if(end>=start)
        {
            var starty:CGFloat=padding.top
            let totalheight=frame.size.height-padding.top-padding.bottom
            
            
            
            for index in start...end{
                
                starty=padding.top
                
                guard subviews.count>index else{
                    continue
                }
                
                let subview=subviews[index]
                
                guard !(subview is UILayoutSupport) && subview.alignInfo.0 != .AlignIgnore && subview.alignInfo.0 != .AlignSub else{
                    continue
                }
                
                switch subview.flexV.0{
                case .FlexBySuper:
                    subview.frame.size.height=totalheight
                case  .FlexBySub:
                    
                    if subview.alignData.maxsize.height == CGFloat.infinity{
                        subview.frame.size.height=totalheight
                    }
                    else{
                        subview.frame.size.height=subview.alignData.normalsize.height
                    }
                    
                    
                default:()
                }
                
                let leftheight=totalheight-subview.frame.size.height
                
                if leftheight>0
                {
                    if vAlignType == .VAlignBottom{
                        starty+=leftheight
                        
                    }
                    else if vAlignType == .VAlignCenter{
                        starty+=leftheight/2
                    }
                }
                subview.frame.origin.y = starty
                
//                subview.resetAlignHHeight(start, end: end)
                subview.resetHeight(start, end: end)
            }
            
            
        }
        
    }
    
    

    func Layout()->CGSize{
        
        return Layout(subviews, start: 0, end: subviews.count)

    }
    
    
    func Layout(subviews:[UIView],start:Int,end:Int)->CGSize{
        checkWidth(start,end:end)
        resetWidth(start,end:end)
        checkHeight(start,end:end)
        resetHeight(start,end:end)
        
        return frame.size
    }
    
}


