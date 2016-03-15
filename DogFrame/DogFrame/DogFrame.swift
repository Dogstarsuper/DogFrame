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
    return CGSize(width: size.width+to.width,height: size.height+to.height)
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
    
    func layout()->CGSize{
        getSubAlignData(0, end: subviews.count-1)
        return layoutSubviews(0, end: subviews.count-1)
    }
    
    
    func getSubAlignData(start:Int,end:Int)->AlignData
    {
        
        var normalsize=CGSizeZero,maxsize=CGSizeZero
        var subaligndata:AlignData=(CGSizeZero,CGSizeZero,0,0)
        
        
        var normalview:Int = 0
        var flexview:Int = 0
        
        if(end>=start)
        {

            for index in start...end {
                

                let subview=subviews[index]
                
                guard !(subview is UILayoutSupport) && ( subview.alignInfo.0 == .AlignAll || subview.alignInfo.0 == .AlignSelf )  else{
                    continue
                }
//                normalview++
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
                    
                    if(subaligndata.normalsize.width>0)
                    {
//                        subaligndata.normalsize.width+=gapH
                    }
                    
                    if subview.flexH.0 == .FlexNone{
                        normalview++
                    }
                    else{
                        flexview++
                    }
                    
                    subaligndata.normalsize=CGSize(width: subaligndata.0.width+aligndata.0.width, height: max(subaligndata.0.height,aligndata.0.height))
                    subaligndata.maxsize=CGSize(width: subaligndata.1.width+aligndata.1.width, height: max(subaligndata.1.height,aligndata.1.height))
                        
                    
                    
//                    subaligndata=(CGSize(width: floatplus(subaligndata.0.width,to:aligndata.0.width), height: max(subaligndata.0.height,aligndata.0.height)),
//                        CGSize(width: floatplus(subaligndata.1.width,to:aligndata.1.width), height: max(subaligndata.1.height,aligndata.1.height)))
//                        CGSizeJoin(subaligndata.1,to: aligndata.1))
                    
                    
                case AlignOrientation.AlignV:
                    
                    if(subaligndata.normalsize.height>0)
                    {
//                        subaligndata.normalsize.height+=gapV
                    }
                    
                    
                    if subview.flexV.0 == .FlexNone{
                        normalview++
                    }
                    else{
                        flexview++
                    }
                    
                    subaligndata.normalsize=CGSize(width: max(subaligndata.0.width,aligndata.0.width), height: subaligndata.0.height+aligndata.0.height)
                    subaligndata.maxsize=CGSize(width: max(subaligndata.1.width,aligndata.1.width), height: subaligndata.1.height + aligndata.1.height)
                    
//                    subaligndata=(CGSize(width: max(subaligndata.0.width,aligndata.0.width), height: floatplus(subaligndata.0.height,to:aligndata.0.height)),
//                        CGSize(width: max(subaligndata.1.width,aligndata.1.width), height: floatplus(subaligndata.1.height,to: aligndata.1.height)))
//                        CGSizeJoin(subaligndata.1,to: aligndata.1))
                default:()
                }
            }
        }

        switch alignInfo.0{
        case .AlignIgnore:
            fallthrough
        case .AlignSub:
            alignData=(CGSizeZero,CGSizeZero,0,0)
            return alignData
        case .AlignSelf:
            fallthrough
        case .AlignAll:
            
            switch flexH.0{
            case .FlexNone:
                
                normalsize.width=frame.size.width
                maxsize.width=frame.size.width
                
//                normalsize.width=floatplus(normalsize.width, to: padding.left+padding.right)
//                normalsize.height=floatplus(normalsize.height, to: padding.top+padding.bottom)
//                maxsize.width=floatplus(maxsize.width, to: padding.left+padding.right)
//                maxsize.height=floatplus(maxsize.height, to: padding.top+padding.bottom)
                
            case .FlexBySuper:
                normalsize.width=0.0
                maxsize.width=CGFloat.infinity
                
//                normalsize.width=floatplus(normalsize.width, to: padding.left+padding.right)
//                normalsize.height=floatplus(normalsize.height, to: padding.top+padding.bottom)
//                maxsize.width=floatplus(maxsize.width, to: padding.left+padding.right)
//                maxsize.height=floatplus(maxsize.height, to: padding.top+padding.bottom)
            case .FlexBySub:
                normalsize.width=subaligndata.normalsize.width
//                maxsize.width=max(frame.size.width,subaligndata.max.width)
                maxsize.width=subaligndata.maxsize.width
//                normalsize.width=floatplus(normalsize.width, to: padding.left+padding.right)
//                normalsize.height=floatplus(normalsize.height, to: padding.top+padding.bottom)
//                maxsize.width=floatplus(maxsize.width, to: padding.left+padding.right)
//                maxsize.height=floatplus(maxsize.height, to: padding.top+padding.bottom)
            }
            
            switch flexV.0{
            case .FlexNone:
                normalsize.height=frame.size.height
                maxsize.height=frame.size.height
            case .FlexBySuper:
                normalsize.height=0.0
                maxsize.height=CGFloat.infinity
            case .FlexBySub:
                normalsize.height=subaligndata.normalsize.height
//                maxsize.height=max(frame.size.height,subaligndata.max.height)
                maxsize.height=subaligndata.maxsize.height
            }
            
            
            switch alignInfo.1{
            case AlignOrientation.AlignH:
                normalsize.width+=gapH*CGFloat(normalview+flexview-1)
                maxsize.width+=gapH*CGFloat(normalview+flexview-1)
            case AlignOrientation.AlignV:
                normalsize.height+=gapH*CGFloat(normalview+flexview-1)
                maxsize.height+=gapH*CGFloat(normalview+flexview-1)
            default:()
            }
            
            normalsize.width=normalsize.width+padding.left+padding.right
            normalsize.height=normalsize.height+padding.top+padding.bottom
            maxsize.width=maxsize.width+padding.left+padding.right
            maxsize.height=maxsize.height+padding.top+padding.bottom
            
            alignData=(normalsize,maxsize,normalview,flexview)
            
            print("\(alignData)")

            return alignData
        }
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
                
                guard !(subview is UILayoutSupport) else{
                    continue
                }
                
//                subview .checkAlignVWidth(0, end: subview.subviews.count)
                subview .checkWidth(0, end: subview.subviews.count)
                
                switch subview.flexH.0{
                case .FlexBySub:
                    fallthrough
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
                
                guard !(subview is UILayoutSupport) else{
                    continue
                }
                
                switch subview.flexH.0{
                case .FlexBySuper:
                    subview.frame.size.width=totalwidth
                case  .FlexBySub:
                    subview.frame.size.width=subview.alignData.normalsize.width
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
                
                guard !(subview is UILayoutSupport) else{
                    continue
                }
                
//                subview .checkAlignHWidth(0, end: subview.subviews.count)
                subview .checkWidth(start,end:end)
                
                
                
//                if flexH.0 == .FlexBySub {
                    switch subview.flexH.0{
                    case .FlexBySub:
                        normalwidth+=subview.alignData.normalsize.width
                        maxwidth+=subview.alignData.maxsize.width
                        normalcount++
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
        
//        switch flexH.0{
//        case .FlexBySub:
//            frame.size.width = alignData.normalsize.width+padding.left+padding.right
//        default:()
//        }
        
        if end>=start{
            
//            var totalwidth:CGFloat=0.0
//            var nomalwidth:CGFloat=0.0
//            for index in start...end{
//                
//                guard subviews.count>index else{
//                    continue
//                }
//                
//                let subview=subviews[index]
//                
//                guard !(subview is UILayoutSupport) else{
//                    continue
//                }
//                
//                nomalwidth += subview.alignData.normalsize.width
//            }
            
            
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
                
                guard !(subview is UILayoutSupport) else{
                    continue
                }
                
                subview.frame.origin.x = startx
                

                switch subview.flexH.0 {
                case .FlexBySuper:
                    subview.frame.size.width=singlelength
                case .FlexBySub:
                    subview.frame.size.width=subview.alignData.normalsize.width
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
                
                guard !(subview is UILayoutSupport) else{
                    continue
                }
                
//                subview .checkAlignVHeight(0, end: subview.subviews.count)
                subview .checkHeight(0, end: subview.subviews.count)
                switch subview.flexV.0{
                case .FlexBySub:
                    normalheight+=subview.alignData.normalsize.height
                    maxheight+=subview.alignData.maxsize.height
                    normalcount++
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
                
                guard !(subview is UILayoutSupport) else{
                    continue
                }
                
                subview.frame.origin.y = starty
                
                
                switch subview.flexV.0 {
                case .FlexBySuper:
                    subview.frame.size.height=singlelength
                case .FlexBySub:
                    subview.frame.size.height=subview.alignData.normalsize.height
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
                
                guard !(subview is UILayoutSupport) else{
                    continue
                }
                
//                subview .checkAlignHHeight(0, end: subview.subviews.count)
                subview .checkHeight(0, end: subview.subviews.count)
                
                switch subview.flexV.0{
                case .FlexBySub:
                    fallthrough
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
        
        
//        switch flexV.0 {
//        case .FlexBySub:
//            frame.size.height=alignData.normalsize.height+padding.top+padding.bottom
//        default:()
//        }
//        
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
                
                guard !(subview is UILayoutSupport) else{
                    continue
                }
                
                switch subview.flexV.0{
                case .FlexBySuper:
                    subview.frame.size.height=totalheight
                case  .FlexBySub:
                    subview.frame.size.height=subview.alignData.normalsize.height
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
    
    
    
    func layoutSubviews2(start:Int,end:Int)->CGSize{
        
        
//        layoutH(start, end: end)
//        layoutV(start, end: end)
        
        checkWidth(start,end:end)
        resetWidth(start,end:end)
        checkHeight(start,end:end)
        resetHeight(start,end:end)
        
        return frame.size
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
                    if  subview.alignData.maxsize.height==CGFloat.infinity {
                        flexsubviewnum++
                    }else
                    {
                        totalflexheight-=subview.alignData.normalsize.height
                    }
                }
                else if alignInfo.1 == .AlignH{
                    if  subview.alignData.maxsize.width==CGFloat.infinity {
                        flexsubviewnum++
                    }else
                    {
                        totalflexwidth-=subview.alignData.normalsize.width
                    }
                }
                
            }
            
            
            let startx=padding.left
            let starty=padding.top
            
            var x:CGFloat=startx,y:CGFloat=starty
//            let normalcount=getLayoutSubviewsCount()
            if alignInfo.1 == .AlignH {
//                totalflexwidth-=gapH*CGFloat(end-start)
                totalflexwidth-=gapH*CGFloat(alignData.normalview+alignData.flexview-1)
            }else if alignInfo.1 == .AlignV{
//                totalflexheight-=gapV*CGFloat(end-start)
                totalflexheight-=gapV*CGFloat(alignData.normalview+alignData.flexview-1)
            }
            
            
            var singlelength:CGFloat=totalflexheight
            if alignInfo.1 == .AlignV && flexsubviewnum>0 {
                singlelength=totalflexheight/CGFloat(flexsubviewnum)
            }
            else if alignInfo.1 == .AlignH && flexsubviewnum>0 {
                singlelength=totalflexwidth/CGFloat(flexsubviewnum)
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
                

                
                guard !(subview is UILayoutSupport) && ( subview.alignInfo.0 == .AlignAll || subview.alignInfo.0 == .AlignSelf ) else
                {
                    continue
                }
                
                
                var size=CGSize(width: max(subview.alignData.normalsize.width,subview.alignData.maxsize.width),
                                height: max(subview.alignData.normalsize.height,subview.alignData.maxsize.height))
                
                if size.width==CGFloat.infinity {
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
                
                if size.height==CGFloat.infinity {
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


