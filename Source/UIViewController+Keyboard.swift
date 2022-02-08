//
//  UIViewController+Keyboard.swift
//  Contacts Picker
//
//  Created by Igor Rudenko on 08.02.2022.
//  Copyright © 2022 Prabaharan Elangovan. All rights reserved.
//

import UIKit

extension UIViewController {
  func registerForKeyboardWillShowNotification(_ scrollView: UIScrollView, usingBlock block: ((CGSize?) -> Void)? = nil) {
    _ = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil, using: { notification -> Void in
      let userInfo = notification.userInfo!
      let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey]! as AnyObject).cgRectValue.size
      let contentInsets = UIEdgeInsets(top: scrollView.contentInset.top, left: scrollView.contentInset.left, bottom: keyboardSize.height, right: scrollView.contentInset.right)
      
      scrollView.setContentInsetAndScrollIndicatorInsets(contentInsets)
      block?(keyboardSize)
    })
  }
  
  func registerForKeyboardWillHideNotification(_ scrollView: UIScrollView, usingBlock block: ((CGSize?) -> Void)? = nil) {
    _ = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil, using: { notification -> Void in
      let userInfo = notification.userInfo!
      let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey]! as AnyObject).cgRectValue.size
      let contentInsets = UIEdgeInsets(top: scrollView.contentInset.top, left: scrollView.contentInset.left, bottom: 0, right: scrollView.contentInset.right)
      
      scrollView.setContentInsetAndScrollIndicatorInsets(contentInsets)
      block?(keyboardSize)
    })
  }
}


extension UIScrollView {
  func setContentInsetAndScrollIndicatorInsets(_ edgeInsets: UIEdgeInsets) {
    self.contentInset = edgeInsets
    self.scrollIndicatorInsets = edgeInsets
  }
}
