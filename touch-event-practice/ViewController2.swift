//
//  ViewController2.swift
//  touch-event-practice
//
//  Created by jinsei_shima on 2020/07/02.
//  Copyright © 2020 jinsei_shima. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class MyNode1: ASDisplayNode {
  override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    let view = super.hitTest(point, with: event)
    if let view = view {
      print("hittest", String(describing: type(of: self)), String(describing: type(of: view)))
    } else {
      print("hittest", String(describing: type(of: self)), "nil")
    }
    return view
  }
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches began", String(describing: type(of: self)), "isFirstResponder", isFirstResponder())
    super.touchesBegan(touches, with: event)
  }
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches end", String(describing: type(of: self)))
    super.touchesEnded(touches, with: event)
  }
}

class _MyView2: UIView {
  override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
    let value = super.point(inside: point, with: event)
    print("point", value, String(describing: type(of: self)))
    return value
  }
  override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    let view = super.hitTest(point, with: event)
    if let view = view {
      print("hittest", String(describing: type(of: self)), String(describing: type(of: view)))
    } else {
      print("hittest", String(describing: type(of: self)), "nil")
    }
    return view
  }
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches began", String(describing: type(of: self)))
//    super.touchesBegan(touches, with: event)
    superview?.touchesBegan(touches, with: event)
  }
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches end", String(describing: type(of: self)))
//    super.touchesEnded(touches, with: event)
    superview?.touchesEnded(touches, with: event)
  }
}

class MyNode2: ASDisplayNode {
  
//  let value: String
  
//  init(value: String) {
//    self.value = value
//    super.init()
////    setViewBlock { () -> UIView in
////      _MyView2()
////    }
//
//  }
  
  override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    let view = super.hitTest(point, with: event)
    if let view = view {
      print("hittest", String(describing: type(of: self)), String(describing: type(of: view)))
    } else {
      print("hittest", String(describing: type(of: self)), "nil")
    }
    return view
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches began", String(describing: type(of: self)), "isFirstResponder", isFirstResponder())
    super.touchesBegan(touches, with: event)
//    view.superview?.touchesBegan(touches, with: event)
  }
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches end", String(describing: type(of: self)))
    super.touchesEnded(touches, with: event)
    // TODO: view.superviewはVCのViewなのにtouchイベントが届かない←hittestをsuperviewに対してしていなかった
//    view.superview?.touchesEnded(touches, with: event)
  }
}

class MyNode3: ASDisplayNode {
  override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    let view = super.hitTest(point, with: event)
    if let view = view {
      print("hittest", String(describing: type(of: self)), String(describing: type(of: view)))
    } else {
      print("hittest", String(describing: type(of: self)), "nil")
    }
    return view
  }
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches began", String(describing: type(of: self)), "isFirstResponder", isFirstResponder())
    super.touchesBegan(touches, with: event)
  }
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches end", String(describing: type(of: self)))
    super.touchesEnded(touches, with: event)
  }
}

class MyCollectionView: ASCollectionView {
  override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    let view = super.hitTest(point, with: event)
    if let view = view {
      print("hittest", String(describing: type(of: self)), String(describing: type(of: view)))
    } else {
      print("hittest", String(describing: type(of: self)), "nil")
    }
    return view
  }
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches began", String(describing: type(of: self)), "isFirstResponder", isFirstResponder)
    superview?.touchesBegan(touches, with: event)
  }
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches end", String(describing: type(of: self)))
    superview?.touchesEnded(touches, with: event)
  }
}

class ViewController2: ASViewController<ASDisplayNode> {

  // こちらだとうまくいかなくて（VCまでtouchイベントがとどかない）
//  let view1 = MyNode1()
//  let view2 = MyNode2()
//  let view3 = MyNode3()

  // こちらだとうまくいく（VCまでtouchイベントが届く）
  let view1 = MyNode1 { () -> UIView in
    MyView1()
  }
  let view2 = MyNode2 { () -> UIView in
    MyView2()
  }
  let view3 = MyNode3 { () -> UIView in
    MyView3()
  }

  let scrollNode = ASCollectionNode { () -> UIView in
    MyCollectionView(frame: .zero, collectionViewLayout: .init())
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    title = "Node"
    
    scrollNode.view.frame = .init(x: 100, y: 100, width: 300, height: 300)
    scrollNode.view.backgroundColor = .lightGray
//    view.addSubview(scrollNode.view)
    view.addSubnode(scrollNode)
    
    scrollNode.view.panGestureRecognizer.cancelsTouchesInView = false
    scrollNode.view.panGestureRecognizer.cancelsTouchesInView = false
    scrollNode.view.canCancelContentTouches = false
    scrollNode.view.alwaysBounceVertical = true

    view1.frame = .init(x: 100, y: 100, width: 200, height: 200)
    view1.backgroundColor = .darkGray
//    view1.isLayerBacked = true // isLayerBacked = trueにするとhittestが呼ばれなくなる
//    scrollNode.view.addSubview(view1.view)
    
//    scrollNode.automaticallyManagesContentSize = true
    scrollNode.addSubnode(view1)
    
    view2.frame = .init(x: 100, y: 400, width: 200, height: 200)
    view2.backgroundColor = .orange
    
    // Geesture入れるとendが呼ばれなくなる
    let gesture = UITapGestureRecognizer(target: self, action: #selector(tap))
    // falseにするとendも呼ばれる
    gesture.cancelsTouchesInView = false
    view3.view.addGestureRecognizer(gesture)
    
//    view.addSubview(view2.view)
    view.addSubnode(view2)
    
    view3.frame = .init(x: 50, y: 50, width: 100, height: 100)
    view3.backgroundColor = .green
    
    view2.view.addSubview(view3.view)

    print("responder:view1:", view1.view.responderChain())
    print("responder:view2:", view2.view.responderChain())
    print("responder:view3:", view3.view.responderChain())
  }
  
  @objc func tap() {
    print("tap")
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches began", String(describing: type(of: self)))
    super.touchesBegan(touches, with: event)
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touches end", String(describing: type(of: self)))
    super.touchesEnded(touches, with: event)
  }

}

