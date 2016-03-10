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
typealias AlignData=(normal:CGSize,max:CGSize)
typealias AlignInfo=(AlignType,AlignOrientation)


func floatplus(float:CGFloat,to:CGFloat)->CGFloat{
    return (float==CGFloat.max || to==CGFloat.max) ? CGFloat.max : float+to
}

func CGSizeJoin(size:CGSize,to:CGSize)->CGSize{
    
    return CGSize(width: floatplus(size.width, to: to.width),height: floatplus(size.height, to: to.height))
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
    var alignData:AlignData=(CGSizeZero,CGSizeZero)
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

//func CGRectSetX(rect:CGRect,x:CGFloat)->CGRect
//{
//    return CGRectMake(x, rect.origin.y, rect.size.width, rect.size.height)
//}
//
//func CGRectSetY(rect:CGRect,y:CGFloat)->CGRect
//{
//    return CGRectMake(rect.origin.x, y, rect.size.width, rect.size.height)
//}
//
//func CGRectSetOrigin(rect:CGRect,x:CGFloat,y:CGFloat)->CGRect
//{
//    return CGRectMake(x, y, rect.size.width, rect.size.height)
//}
//
//extension UIView
//{
//    private struct AssociatedKeys {
//        static var alignType:NSNumber?
//        static var flexHeight:NSNumber?
//        static var gapH:NSNumber?
//        static var gapV:NSNumber?
//    }
//    
//    
//    var alignType:NSNumber?{
//
//        get {
//            return objc_getAssociatedObject(self, &AssociatedKeys.alignType) as? NSNumber
//        }
//
//        set {
//            if let newValue = newValue {
//                objc_setAssociatedObject(
//                    self,
//                    &AssociatedKeys.alignType,
//                    newValue as NSNumber?,
//                    objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC
//                )
//            }
//        }
//    }
//    
//    var flexHeight:NSNumber?{
//        
//        get {
//            return objc_getAssociatedObject(self, &AssociatedKeys.flexHeight) as? NSNumber
//        }
//        
//        set {
//            if let newValue = newValue {
//                objc_setAssociatedObject(
//                    self,
//                    &AssociatedKeys.flexHeight,
//                    newValue as NSNumber?,
//                    objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC
//                )
//            }
//        }
//    }
//    
//    var gapH:NSNumber?{
//        
//        get {
//            return objc_getAssociatedObject(self, &AssociatedKeys.gapH) as? NSNumber
//        }
//        
//        set {
//            if let newValue = newValue {
//                objc_setAssociatedObject(
//                    self,
//                    &AssociatedKeys.gapH,
//                    newValue as NSNumber?,
//                    objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC
//                )
//            }
//        }
// 
//    }
//    
//    
//    var gapV:NSNumber?{
//        
//        get {
//            return objc_getAssociatedObject(self, &AssociatedKeys.gapV) as? NSNumber
//        }
//        
//        set {
//            if let newValue = newValue {
//                objc_setAssociatedObject(
//                    self,
//                    &AssociatedKeys.gapV,
//                    newValue as NSNumber?,
//                    objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC
//                )
//            }
//        }
//    }
//    
//    public func Layout(){
//
//        let start:Int=0
//        let end:Int=self.subviews.count-1
//        self.Layout(self.subviews, start: start, end: end)
//        
//        for subview in self.subviews
//        {
//            subview .Layout()
//        }
//    }
//    
//    
//    func Layout(subviews:[UIView],start:Int,end:Int)
//    {
//        var x:CGFloat=0.0, y:CGFloat=0.0
//        var pos:Int=start
//        for pos=start ;pos <= end ;pos++
//        {
//            let subview:UIView=subviews[pos]
//            let frame=subview.frame
//            
//            guard !CGRectEqualToRect(frame, CGRectZero) else
//            {
//                continue
//            }
//            
//            subview.frame=CGRectMake(x, y, frame.size.width, frame.size.height)
////            if(self.alignType?.integerValue==AlignV)
////            {
////                y+=frame.size.height
////                y+=self.gapV?.floatValue
////            }
////            else if(self.alignType?.integerValue==AlignH)
////            {
////                x+=frame.size.width
////                y+=self.gapH?.floatValue
////            }
//        }
//
//    }
//    
//}

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
    
//    var alignType:AlignType{
//        get{
//            if let type=frameData?.alignType{
//                return type
//            }else{
//                return AlignType.AlignV
//            }
//        }
//        set(newdata){
//            checkFrameData()
//            frameData?.alignType=newdata
//        }
//    }
    
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
    
//    var vAlignType:VAlignType{
//        get{
//            if let type=frameData?.vAlignType{
//                return type
//            }else{
//                return VAlignType.VAlignTop
//            }
//        }
//        set(newdata){
//            checkFrameData()
//            frameData?.vAlignType=newdata
//        }
//    }
    
//    var hAlignType:HAlignType{
//        get{
//            if let type=frameData?.hAlignType{
//                return type
//            }else{
//                return HAlignType.HAlignLeft
//            }
//        }
//        set(newdata){
//            checkFrameData()
//            frameData?.hAlignType=newdata
//        }
//    }
    
//    var flexWidth:Flex{
//        get{
//            if let flex=frameData?.flexWidth{
//                return flex
//            }
//            else{
//                return (false,0.0)
//            }
//        }
//        set(newdata){
//            checkFrameData()
//            frameData?.flexWidth=newdata
//        }
//    }
//    
//    var flexHeight:Flex{
//        get{
//            if let flex=frameData?.flexHeight{
//                return flex
//            }
//            else{
//                return (false,0.0)
//            }
//        }
//        set(newdata){
//            checkFrameData()
//            frameData?.flexHeight=newdata
//        }
//    }
    
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
                return (CGSizeZero,CGSizeZero)
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
//    public func Layout()->CGSize{
//        
//        let start = superview != nil ? 0 : 2
//        
//        let data:AlignData=self.getSubAlignData(start,end:subviews.count-1)
//        
//        Layout(start, end: subviews.count-1)
//        
//        //自身排版
////        let subviewsize:CGSize=Layout(subviews,start:0,end:subviews.count-1)
//        
//        
////        guard( CGRectEqualToRect(frame, CGRectZero)) else
////        {
////            return
////        }
//        
//        
////        var length:CGFloat=0.0
////        var validsubview=1
////        
////        for subview in subviews{
////            let size:CGSize=subview.Layout()
////            
////            guard subview.alignInfo.0 == .AlignAll || subview.alignInfo.0 == .AlignSelf  else
////            {
////                continue
////            }
////
////            validsubview++
////            
////            if alignInfo.1 == .AlignH {
////                length += size.width
////            }else if alignInfo.1 == .AlignV {
////                length += size.height
////            }
////            
////        }
//        
//        return frame.size
//    }
    
    func layout()->CGSize{
        getSubAlignData(0, end: subviews.count-1)
        return layoutSubviews(0, end: subviews.count-1)
    }
    
    
    func getSubAlignData(start:Int,end:Int)->AlignData
    {
        
        var normalsize=CGSizeZero,maxsize=CGSizeZero
        
//        UILayoutGuide
        
        var subaligndata:AlignData=(CGSizeZero,CGSizeZero)
        
        
//        if(subviews.count==2){
//            switch flexH.0{
//            case .FlexNone:
//                fallthrough
//            case .FlexBySub:
//                normalsize.width=frame.size.width
//                maxsize.width=frame.size.width
//            case .FlexBySuper:
//                normalsize.width=CGFloat.max
//                maxsize.width=CGFloat.max
//            }
//            
//            switch flexV.0{
//            case .FlexNone:
//                fallthrough
//            case .FlexBySub:
//                normalsize.height=frame.size.height
//                maxsize.height=frame.size.height
//            case .FlexBySuper:
//                normalsize.height=CGFloat.max
//                maxsize.height=CGFloat.max
//            }
//            
//            return (normalsize,maxsize)
//        }
//        else
//        {
        
        if(end>=start)
        {
            for index in start...end {
                
                
                
                
                let subview=subviews[index]
                
                
                if subview is UILayoutSupport{
                    continue
                }
                
//                switch alignInfo.1{
//                case AlignOrientation.AlignH:
//                    if(aligndata.normal.width>0)
//                    {
//                        subaligndata.normal.width+=gapH
//                    }
//                case AlignOrientation.AlignV:
//                    if(aligndata.normal.height>0)
//                    {
//                        subaligndata.normal.height+=gapV
//                    }
//                default:()
//                }
                
                let aligndata=subview.getSubAlignData(0,end:subview.subviews.count-1)
                
                switch alignInfo.1{
                case AlignOrientation.AlignH:
                    
                    if(subaligndata.normal.width>0)
                    {
                        subaligndata.normal.width+=gapH
                    }
                    
                    subaligndata=(CGSize(width: floatplus(subaligndata.0.width,to:aligndata.0.width), height: max(subaligndata.0.height,aligndata.0.height)),
                        CGSize(width: floatplus(subaligndata.1.width,to:aligndata.1.width), height: max(subaligndata.1.height,aligndata.1.height)))
//                        CGSizeJoin(subaligndata.1,to: aligndata.1))
                    
                    
                case AlignOrientation.AlignV:
                    
                    if(subaligndata.normal.height>0)
                    {
                        subaligndata.normal.height+=gapV
                    }
                    
                    subaligndata=(CGSize(width: max(subaligndata.0.width,aligndata.0.width), height: floatplus(subaligndata.0.height,to:aligndata.0.height)),
                        CGSize(width: max(subaligndata.1.width,aligndata.1.width), height: floatplus(subaligndata.1.height,to: aligndata.1.height)))
//                        CGSizeJoin(subaligndata.1,to: aligndata.1))
                default:()
                }
            }
        }

        switch alignInfo.0{
        case .AlignIgnore:
            fallthrough
        case .AlignSub:
            alignData=(CGSizeZero,CGSizeZero)
            return alignData
        case .AlignSelf:
            fallthrough
        case .AlignAll:
            
            switch flexH.0{
            case .FlexNone:
                normalsize.width=frame.size.width
                maxsize.width=frame.size.width
            case .FlexBySuper:
                normalsize.width=0.0
                maxsize.width=CGFloat.max
            case .FlexBySub:
                normalsize.width=subaligndata.normal.width
                maxsize.width=max(frame.size.width,subaligndata.max.width)
            }
            
            switch flexV.0{
            case .FlexNone:
                normalsize.height=frame.size.height
                maxsize.height=frame.size.height
            case .FlexBySuper:
                normalsize.height=0.0
                maxsize.height=CGFloat.max
            case .FlexBySub:
                normalsize.height=subaligndata.normal.height
                maxsize.height=max(frame.size.height,subaligndata.max.height)
            }
            
            alignData=(normalsize,maxsize)
            
            print("\(alignData)")

            return alignData
        }
    }
    
    
    func layoutSubviews(start:Int,end:Int)->CGSize{
        
        switch alignInfo.0{
        case .AlignAll:
            fallthrough
        case .AlignSub:
            if(superview != nil){
                
            }
            
            
            
        default:
            return frame.size
        }
        
        if(end>=start)
        {
            var flexsubviewnum=0
            
            var totalflexwidth=frame.width-padding.left-padding.right
            var totalflexheight=frame.height-padding.top-padding.bottom

            for index in start...end{
                
                let subview=subviews[index]
                
                
                if subview is UILayoutSupport{
                    continue
                }
                
                if alignInfo.1 == .AlignV {
                    if  subview.alignData.max.height==CGFloat.max {
                        flexsubviewnum++
                    }else
                    {
                        totalflexheight-=subview.alignData.normal.height
                    }
                }
                else if alignInfo.1 == .AlignH{
                    if  subview.alignData.max.width==CGFloat.max {
                        flexsubviewnum++
                    }else
                    {
                        totalflexwidth-=subview.alignData.normal.width
                    }
                }
                
            }
            
            var singlelength:CGFloat=totalflexheight
            
            if alignInfo.1 == .AlignV && flexsubviewnum>0 {
                singlelength=totalflexheight/CGFloat(flexsubviewnum)
            }
            else if alignInfo.1 == .AlignH && flexsubviewnum>0 {
                singlelength=totalflexwidth/CGFloat(flexsubviewnum)
            }
            
            
            
            
            let startx=padding.left
            let starty=padding.top
            
            var x:CGFloat=startx,y:CGFloat=starty
            
            if alignInfo.1 == .AlignH {
                totalflexwidth-=gapH*CGFloat(end-start)
            }else if alignInfo.1 == .AlignV{
                totalflexheight-=gapV*CGFloat(end-start)
            }
            
            if(flexsubviewnum==0)
            {
                
                if alignInfo.1 == .AlignH {
                    
                    switch hAlignType{
                    case .HAlignRight:
                        x+=totalflexwidth
                    case .HAlignMiddle:
                        x+=totalflexwidth/2
                    default:()
                    }
                    
                }
                else if alignInfo.1 == .AlignV{
                    switch vAlignType{
                    case .VAlignBottom:
                        y+=totalflexheight
                    case .VAlignCenter:
                        y+=totalflexheight/2
                    default:()
                    }
                }
                
            }
            
            
            
            
//            if totalflexwidth>0 && alignInfo.1 == .AlignH{
//                switch hAlignType{
//                case .HAlignRight:
//                    x+=totalflexwidth
//                case .HAlignMiddle:
//                    x+=totalflexwidth/2
//                default:()
//                }
//            }
            
            for index in start...end{
                
                
                
                
                if alignInfo.1 == .AlignV {
                    x=startx
                }
                else if alignInfo.1 == .AlignH{
                    y=starty
                    
                }
                
                
                
                let subview=subviews[index]
                
                
                if subview is UILayoutSupport{
                    continue
                }
                
                var size=CGSize(width: max(subview.alignData.normal.width,subview.alignData.max.width),
                                height: max(subview.alignData.normal.height,subview.alignData.max.height))
                
                if size.width==CGFloat.max {
                    if alignInfo.1 == .AlignV {
                        size.width=totalflexwidth
                    }
                    else if alignInfo.1 == .AlignH{
                        size.width=singlelength
                    }
                    else if alignInfo.1 == .AlignNone{
                        size.width=singlelength
                    }
                }
                
                if size.height==CGFloat.max {
                    if alignInfo.1 == .AlignV {
                        size.height=singlelength
                    }
                    else if alignInfo.1 == .AlignH{
                        size.height=totalflexheight
                    }
                    else if alignInfo.1 == .AlignNone{
                        size.height=singlelength
                    }
                }
                
                
                
                if alignInfo.1 == .AlignV{
                    
                    switch hAlignType{
                    case .HAlignRight:
                        x+=totalflexwidth-size.width
                    case .HAlignMiddle:
                        x+=(totalflexwidth-size.width)/2
                    default:()
                    }
                    
                }
                else if alignInfo.1 == .AlignH{
                    switch vAlignType{
                    case .VAlignBottom:
                        y+=totalflexheight-size.height
                    case .VAlignCenter:
                        y+=(totalflexheight-size.height)/2
                    default:()
                    }
                }
                
                
                subview.frame=CGRectMake(x, y, size.width, size.height)
                
                if alignInfo.1 == .AlignV {
                    y+=size.height
                    y+=gapV
                }
                else if alignInfo.1 == .AlignH{
                    x+=size.width
                    x+=gapH
                }
                
                subview.layoutSubviews(0,end: subview.subviews.count-1)
                
            }
            
        }
        
        return frame.size
    }
    
//    func Layout(subviews:[UIView],start:Int,end:Int)->CGSize
//    {
//        
//        if(alignInfo.0 == .AlignIgnore)
//        {//ignore，完全不管
//            return frame.size
//        }
//        
//        let viewsize:CGSize=CGSize(width:frame.size.width-padding.left-padding.right,height:frame.size.height-padding.top-padding.bottom)
//        
//        var x:CGFloat=0.0, y:CGFloat=0.0
//        x+=padding.left
//        y+=padding.bottom
//        
//        
//        
//        //flex的剩余比例，总数为1
//        var hflexleft:CGFloat=1.0,vflexleft:CGFloat=1.0
//        //flex使用默认flex的view数量
//        var hflexviewnum:Int=0,vflexviewnum:Int=0
//        //        //flex剩余size
//        var hflexsize:CGFloat=viewsize.width,vflexsize:CGFloat=viewsize.height
//        //每一个使用默认flex的view，计算之后的size
//        var viewhflexsize:CGFloat=viewsize.width,viewvflexsize:CGFloat=viewsize.height
//        var viewposx:CGFloat=1.0,viewposy:CGFloat=1.0
//        
//        var pos:Int=start
//        
//        var validsubviewnum:Int=0
//        
//        //统计剩余的flex比例，计算剩余的flex长度，计算每个默认flex的view的size
//        for pos=start ;pos <= end ;pos++
//        {
//            
//            
//            
//            let subview:UIView=subviews[pos]
//            let frame=subview.frame
//            
//            guard !CGRectEqualToRect(frame, CGRectZero) || subview.flexHeight.0 || subview.flexWidth.0 else
//            {
//                continue
//            }
//            
//            switch alignType{
//            case .AlignV:
//                if subview.flexHeight.0 {
//                    
//                    if vflexleft<=0.0{
//                        continue
//                    }
//                    
//                    
//                    if(subview.flexHeight.1==0.0){
//                        vflexviewnum++
//                    }
//                    else
//                    {
//                        vflexleft-=max(min(1.0,subview.flexHeight.1),0.0)
//                    }
//                }
//                else{
//                    vflexsize-=subview.frame.size.height
//                }
//            case .AlignH:
//                
//                
//                
//                if subview.flexWidth.0 {
//                    
//                    
//                    if hflexleft<=0.0{
//                        continue
//                    }
//                    
//                    if(subview.flexWidth.1==0.0){
//                        hflexviewnum++
//                    }
//                    else
//                    {
//                        hflexleft-=max(min(1.0,subview.flexWidth.1),0.0)
//                    }
//                }
//                else{
//                    hflexsize-=subview.frame.size.width
//                }
//            default:()
//            }
//            
//            
//            validsubviewnum++
//            
//        }
//        
//        
//        hflexleft=max(0.0,hflexleft)
//        vflexleft=max(0.0,vflexleft)
//        hflexsize=max(0,0,hflexsize)
//        vflexsize=max(0,0,vflexsize)
//        
//        if(validsubviewnum>0)
//        {
//            switch alignType{
//            case .AlignV:
//                vflexsize-=gapV+CGFloat(validsubviewnum-1)
//            case  .AlignH:
//                hflexsize-=gapH+CGFloat(validsubviewnum-1)
//            default:()
//            }
//        }
//        
//        //默认flex的view均分剩余的size
//        if /*alignType==AlignType.AlignV &&*/ hflexviewnum>0{
//            viewhflexsize=hflexleft/CGFloat(hflexviewnum)*hflexsize
//        }
//        if /*alignType==AlignType.AlignH &&*/ vflexviewnum>0{
//            viewvflexsize=vflexleft/CGFloat(vflexviewnum)*vflexsize
//        }
//        
//        
//        for pos=start ;pos <= end ;pos++
//        {
//            let subview:UIView=subviews[pos]
//            let frame=subview.frame
//            
//            guard !CGRectEqualToRect(frame, CGRectZero) || subview.flexHeight.0 || subview.flexWidth.0 else
//            {
//                continue
//            }
//            
//            var viewframewidth:CGFloat=subview.frame.size.width
//            var viewframeheight:CGFloat=subview.frame.size.height
//            
//            if(subview.flexWidth.0)
//            {
//                if(subview.flexWidth.1==0.0)
//                {
//                    viewframewidth=viewhflexsize
//                }
//                else
//                {
//                    viewframewidth=hflexsize*subview.flexWidth.1
//                }
//            }
//            
//            if(subview.flexHeight.0)
//            {
//                if(subview.flexHeight.1==0.0)
//                {
//                    viewframeheight=viewvflexsize
//                }
//                else
//                {
//                    viewframeheight=vflexsize*subview.flexHeight.1
//                }
//            }
//            
//            
//            guard viewframewidth>=0.0 && viewframeheight>=0.0 else
//            {
//                return
//            }
//            
//            subview.frame=CGRectMake(x, y, viewframewidth, viewframeheight)
//            if(self.alignType==AlignType.AlignV)
//            {
//                y+=viewframeheight
//                y+=gapV
//            }
//            else if(self.alignType==AlignType.AlignH)
//            {
//                x+=viewframewidth
//                x+=gapH
//            }
//        }
//        
//    }

    
    
//    func Layout(subviews:[UIView],start:Int,end:Int)
//    {
//        if(alignType==AlignType.AlignNone)
//        {
//            return
//        }
//        
//        
//        let viewsize:CGSize=CGSize(width:frame.size.width-padding.left-padding.right,height:frame.size.height-padding.top-padding.bottom)
//        
//        var x:CGFloat=0.0, y:CGFloat=0.0
//        x+=padding.left
//        y+=padding.bottom
//        
//        
//        
//        //flex的剩余比例，总数为1
//        var hflexleft:CGFloat=1.0,vflexleft:CGFloat=1.0
//        //flex使用默认flex的view数量
//        var hflexviewnum:Int=0,vflexviewnum:Int=0
////        //flex剩余size
//        var hflexsize:CGFloat=viewsize.width,vflexsize:CGFloat=viewsize.height
//        //每一个使用默认flex的view，计算之后的size
//        var viewhflexsize:CGFloat=viewsize.width,viewvflexsize:CGFloat=viewsize.height
//        var viewposx:CGFloat=1.0,viewposy:CGFloat=1.0
//        
//        var pos:Int=start
//        
//        var validsubviewnum:Int=0
//        
//        //统计剩余的flex比例，计算剩余的flex长度，计算每个默认flex的view的size
//        for pos=start ;pos <= end ;pos++
//        {
//            
//            
//            
//            let subview:UIView=subviews[pos]
//            let frame=subview.frame
//            
//            guard !CGRectEqualToRect(frame, CGRectZero) || subview.flexHeight.0 || subview.flexWidth.0 else
//            {
//                continue
//            }
//            
//            switch alignType{
//            case .AlignV:
//                if subview.flexHeight.0 {
//                    
//                    if vflexleft<=0.0{
//                        continue
//                    }
//                
//                    
//                    if(subview.flexHeight.1==0.0){
//                        vflexviewnum++
//                    }
//                    else
//                    {
//                        vflexleft-=max(min(1.0,subview.flexHeight.1),0.0)
//                    }
//                }
//                else{
//                    vflexsize-=subview.frame.size.height
//                }
//            case .AlignH:
//                
//                
//                
//                if subview.flexWidth.0 {
//                    
//                    
//                    if hflexleft<=0.0{
//                        continue
//                    }
//                    
//                    if(subview.flexWidth.1==0.0){
//                        hflexviewnum++
//                    }
//                    else
//                    {
//                        hflexleft-=max(min(1.0,subview.flexWidth.1),0.0)
//                    }
//                }
//                else{
//                    hflexsize-=subview.frame.size.width
//                }
//            default:()
//            }
//            
//            
//            validsubviewnum++
//            
//        }
//
//        
//        hflexleft=max(0.0,hflexleft)
//        vflexleft=max(0.0,vflexleft)
//        hflexsize=max(0,0,hflexsize)
//        vflexsize=max(0,0,vflexsize)
//        
//        if(validsubviewnum>0)
//        {
//            switch alignType{
//            case .AlignV:
//                vflexsize-=gapV+CGFloat(validsubviewnum-1)
//            case  .AlignH:
//                hflexsize-=gapH+CGFloat(validsubviewnum-1)
//            default:()
//            }
//        }
//        
//        //默认flex的view均分剩余的size
//        if /*alignType==AlignType.AlignV &&*/ hflexviewnum>0{
//            viewhflexsize=hflexleft/CGFloat(hflexviewnum)*hflexsize
//        }
//        if /*alignType==AlignType.AlignH &&*/ vflexviewnum>0{
//            viewvflexsize=vflexleft/CGFloat(vflexviewnum)*vflexsize
//        }
//        
//
//        for pos=start ;pos <= end ;pos++
//        {
//            let subview:UIView=subviews[pos]
//            let frame=subview.frame
//            
//            guard !CGRectEqualToRect(frame, CGRectZero) || subview.flexHeight.0 || subview.flexWidth.0 else
//            {
//                continue
//            }
//            
//            var viewframewidth:CGFloat=subview.frame.size.width
//            var viewframeheight:CGFloat=subview.frame.size.height
//            
//            if(subview.flexWidth.0)
//            {
//                if(subview.flexWidth.1==0.0)
//                {
//                    viewframewidth=viewhflexsize
//                }
//                else
//                {
//                    viewframewidth=hflexsize*subview.flexWidth.1
//                }
//            }
//            
//            if(subview.flexHeight.0)
//            {
//                if(subview.flexHeight.1==0.0)
//                {
//                    viewframeheight=viewvflexsize
//                }
//                else
//                {
//                    viewframeheight=vflexsize*subview.flexHeight.1
//                }
//            }
//            
//            
//            guard viewframewidth>=0.0 && viewframeheight>=0.0 else
//            {
//                return
//            }
//            
//            subview.frame=CGRectMake(x, y, viewframewidth, viewframeheight)
//            if(self.alignType==AlignType.AlignV)
//            {
//                y+=viewframeheight
//                y+=gapV
//            }
//            else if(self.alignType==AlignType.AlignH)
//            {
//                x+=viewframewidth
//                x+=gapH
//            }
//        }
// 
//    }
}


