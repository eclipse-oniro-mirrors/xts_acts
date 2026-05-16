/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { typeNode, NodeController, FrameNode } from '@ohos.arkui.node';

interface Info {
  start: boolean;
  step?: number;
  loop?: number;
  fromStart?: boolean;
  src: string;
}

let data: Info = {
  start: true,
  step: 6,
  loop: undefined,
  fromStart: false,
  src: 'Running Marquee Running Marquee Running Marquee'
}


class MyNodeController extends NodeController {
  makeNode(uiContext: UIContext): FrameNode | null{
    let node = new FrameNode(uiContext)
    let col = typeNode.createNode(uiContext, 'Column')
    col.initialize({ space: 10 }).borderColor(Color.Black).alignItems(HorizontalAlign.Center)
    let marquee = typeNode.createNode(uiContext, 'Marquee')
    marquee.initialize(undefined)
    marquee.initialize(data)
      .width(300)
      .height(80)
      .fontColor('#FFFFFF')
      .fontSize(48)
      .fontWeight(700)
      .marqueeUpdateStrategy(MarqueeUpdateStrategy.DEFAULT)
      .backgroundColor('#182431')
      .key('key_marquee_Node_001')
      .margin({ bottom: 40 })
    col.appendChild(marquee)
    node.appendChild(col)
    console.log('marqueeNode0100: page' + new Date().getTime())
    return node
  }
}
@Entry
@Component
struct qrcode {
  private fromStart: boolean = false
  private step: number = 10
  private loop: number = 4
  @State marqueeText: string = 'Running Marquee Running Marquee'
  @State fontSize: number = 12
  private myNodeController: MyNodeController = new MyNodeController()
  build(){
    Column({ space: 10 }) {
      NodeContainer(this.myNodeController)
    }.width('100%')
    .alignItems(HorizontalAlign.Center)
  }
}