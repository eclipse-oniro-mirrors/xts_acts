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
interface Options {
  timeZoneOffset?: number;
  controller?: TextClockController
}
let timeController = new TextClockController()
let data: Options = {
  timeZoneOffset: -8,
  controller: timeController
}

class MyNodeController extends NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext)
    let scroll = typeNode.createNode(uiContext, 'Scroll')
    let col = typeNode.createNode(uiContext, 'Column')
    col.initialize({ space: 10 }).borderColor(Color.Black).alignItems(HorizontalAlign.Center)
      .width('100%')
    let textClock = typeNode.createNode(uiContext, 'TextClock')
    textClock.initialize(undefined)
    textClock.initialize(data)
      .width('100%')
      .format('aa hh:mm:ss')
      .key('key_ TextClock_001')

    let start = typeNode.createNode(uiContext, 'Button')
    let stop = typeNode.createNode(uiContext, 'Button')

    start.initialize('start').onClick(()=>{
      timeController.start()
    })
    stop.initialize('stop').onClick(()=>{
      timeController.stop()
    })

    col.appendChild(textClock)
    col.appendChild(start)
    col.appendChild(stop)
    scroll.appendChild(col)
    node.appendChild(scroll)
    return node
  }
}
@Entry
@Component
struct textClock {
  private myNodeController: MyNodeController = new MyNodeController()
  controller: TextClockController = new TextClockController()
  build() {
    Scroll() {
      Column({ space: -20 }) {
        NodeContainer(this.myNodeController)
        Text('origin')
          .margin(20)
        Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
          TextClock(data)
            .format('aa hh:mm:ss')
            .fontSize(20)
            .margin(10)

          Button('start')
            .margin({ bottom: 10 })
            .onClick(() => {
              this.controller.start()
            })
          Button('stop')
            .onClick(() => {
              this.controller.stop()
            })
        }.width('100%')
      }.width('100%')
      .alignItems(HorizontalAlign.Center)
    }.width('100%')
  }
}