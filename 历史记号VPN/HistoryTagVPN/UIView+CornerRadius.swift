//
//  UIView+CornerRadius.swift
//  HistoryTagVPN
//
//  Created by历史记号 on 2018/5/1.
//  Copyright © 2018年 xiaoxiaohljz. All rights reserved.
//
//
import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0;
        }
    }
}
