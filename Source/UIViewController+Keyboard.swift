//
//  UIViewController+Keyboard.swift
//  Contacts Picker
//
//  Created by Igor Rudenko on 08.02.2022.
//  Copyright © 2022 Prabaharan Elangovan. All rights reserved.
//

import UIKit

extension UIViewController {
  func registerForKeyboardWillShow(
    _ scrollView: UIScrollView
  ) -> NSObjectProtocol {
  return NotificationCenter.default.addObserver(
    forName: UIResponder.keyboardWillShowNotification,
    object: nil,
    queue: nil
  ) { notification in
      let userInfo = notification.userInfo!
      let keyboardSize = (userInfo[
        UIResponder.keyboardFrameEndUserInfoKey
      ]! as AnyObject).cgRectValue.size
      let contentInsets = UIEdgeInsets(
        top: scrollView.contentInset.top,
        left: scrollView.contentInset.left,
        bottom: keyboardSize.height,
        right: scrollView.contentInset.right
      )
      
      scrollView.setContentInsetAndScrollIndicatorInsets(contentInsets)
    }
  }
  
  func registerForKeyboardWillHide(
    _ scrollView: UIScrollView
  ) -> NSObjectProtocol {
    return NotificationCenter.default.addObserver(
      forName: UIResponder.keyboardWillHideNotification,
      object: nil,
      queue: nil
    ) { _ in
      let contentInsets = UIEdgeInsets(
        top: scrollView.contentInset.top,
        left: scrollView.contentInset.left,
        bottom: 0,
        right: scrollView.contentInset.right
      )
      scrollView.setContentInsetAndScrollIndicatorInsets(contentInsets)
    }
  }
}

extension UIScrollView {
  func setContentInsetAndScrollIndicatorInsets(_ edgeInsets: UIEdgeInsets) {
    contentInset = edgeInsets
    scrollIndicatorInsets = edgeInsets
  }
}
