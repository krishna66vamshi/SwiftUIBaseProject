//
//  UIView+Extension.swift
//  SwiftUI-BaseProject
//
//  Created by Hyper Thread Solutions on 23/07/22.
//

import SwiftUI

extension View {
  func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}
