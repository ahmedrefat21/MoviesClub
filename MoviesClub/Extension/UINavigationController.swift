//
//  UINavigationController.swift
//  MoviesClub
//
//  Created by Ahmed Refat on 28/08/2024.
//

import Foundation
import SwiftUI


extension UINavigationController {
  override open func viewDidLoad() {
    super.viewDidLoad()
    interactivePopGestureRecognizer?.delegate = nil
  }
}
