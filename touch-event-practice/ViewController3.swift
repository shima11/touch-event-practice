//
//  ViewController3.swift
//  touch-event-practice
//
//  Created by jinsei_shima on 2020/07/03.
//  Copyright © 2020 jinsei_shima. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class NormalNode: ASDisplayNode {
  
}

class TrackingView: UIView {
  
}

class TrackingNode: ASDisplayNode {

  override init() {
    super.init()
    setViewBlock { () -> UIView in
      TrackingView()
    }
  }
}

class ViewController3: ASViewController<ASDisplayNode> {

  let view1 = NormalNode()
  let view2 = TrackingNode()
  let view3 = NormalNode { () -> UIView in
    TrackingView()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    title = "Node"

    view1.frame = .init(x: 100, y: 100, width: 100, height: 100)
    view1.backgroundColor = .darkGray
    view.addSubnode(view1)
    
    view2.frame = .init(x: 100, y: 300, width: 100, height: 100)
    view2.backgroundColor = .gray
    view.addSubnode(view2)

    view3.frame = .init(x: 100, y: 500, width: 100, height: 100)
    view3.backgroundColor = .lightGray
    view.addSubnode(view3)
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

