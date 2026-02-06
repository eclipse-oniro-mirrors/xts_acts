'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { BadgeParamWithNumber, BadgeParamWithString, Color, HorizontalAlign, $r, Entry, Component, Column, ColumnOptions, NodeContainer,
  Text, Badge, Image, $r, Row, Button, QRCode, TextClockController, Scroll, FlexOptions, TextClock, Margin, ClickEvent, FlexDirection, ItemAlign, Flex ,FlexAlign,
  TextClockOptions,
} from '@ohos.arkui.component'
import { typeNode, NodeController, FrameNode } from '@ohos.arkui.node';

let timeController = new TextClockController()
let data: TextClockOptions = {
  timeZoneOffset: -8,
  controller: timeController
}

class MyNodeController extends NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext)
    let scroll = typeNode.createScrollNode(uiContext)
    let col = typeNode.createColumnNode(uiContext)
    col.initialize({ space: 10 } as ColumnOptions).borderColor(Color.Black).alignItems(HorizontalAlign.Center)
      .width('100%')
    let textClock = typeNode.createTextClockNode(uiContext)
    textClock.initialize(undefined)
    textClock.initialize(data)
      .width('100%')
      .key('key_ TextClock_001')

    let start = typeNode.createButtonNode(uiContext)
    let stop = typeNode.createButtonNode(uiContext)

    start.initialize('start').onClick((e:ClickEvent)=>{
      timeController.start()
    })
    stop.initialize('stop').onClick((e:ClickEvent)=>{
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
      Column({ space: -20 } as ColumnOptions) {
        NodeContainer(this.myNodeController)
        Text('origin')
          .margin(20)
        Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center } as FlexOptions) {
          TextClock(data)
            .format('aa hh:mm:ss')
            .fontSize(20)
            .margin(10)

          Button('start')
            .margin({ bottom: 10 } as Margin)
            .onClick((e:ClickEvent) => {
              this.controller.start()
            })
          Button('stop')
            .onClick((e:ClickEvent) => {
              this.controller.stop()
            })
        }.width('100%')
      }.width('100%')
      .alignItems(HorizontalAlign.Center)
    }.width('100%')
  }
}