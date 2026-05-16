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
  Text, Badge, Image, $r, Row, QRCode, TextClockController, Scroll, FlexOptions, TextClock, Margin, ClickEvent, FlexDirection, ItemAlign,
  FlexAlign, TextTimerController, TextTimerOptions, TextTimer, Button} from '@ohos.arkui.component'
import { typeNode, NodeController, FrameNode } from '@ohos.arkui.node';
import { State, AppStorage } from '@ohos.arkui.stateManagement'

let timerController = new TextTimerController()
let data: TextTimerOptions = {
  isCountDown: true,
  count: 86400000,
  controller: timerController
}

class MyNodeController extends NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext)
    let col = typeNode.createColumnNode(uiContext)
    col.initialize({ space: 10 } as ColumnOptions).borderColor(Color.Black).alignItems(HorizontalAlign.Center)

    let row = typeNode.createRowNode(uiContext)
    row.initialize().width('100%')
    let textTimer = typeNode.createTextTimerNode(uiContext)
    textTimer.initialize(undefined)
    textTimer.initialize(data)
      .format('HH:mm:ss.SS')
      .fontColor(Color.Red)
      .width(150)
      .key('key_ TextTimer_001')


    let timerStart = typeNode.createButtonNode(uiContext)
    let timerPause = typeNode.createButtonNode(uiContext)
    let timerReset = typeNode.createButtonNode(uiContext)
    timerStart.initialize('start').onClick((e:ClickEvent)=>{
      timerController.start()
    })
    timerPause.initialize('pause').onClick((e:ClickEvent)=>{
      timerController.pause()
    })
    timerReset.initialize('reset').onClick((e:ClickEvent)=>{
      timerController.reset()
    })

    row.appendChild(textTimer)
    row.appendChild(timerStart)
    row.appendChild(timerPause)
    row.appendChild(timerReset)
    col.appendChild(row)
    node.appendChild(col)
    return node
  }
}
@Entry
@Component
struct textTimer {
  private myNodeController: MyNodeController = new MyNodeController()
  textTimerController: TextTimerController = new TextTimerController()
  @State format: string = 'HH:mm:ss.SS'
  @State data: TextTimerOptions = {
    isCountDown: true,
    count: 86400000,
    controller: this.textTimerController
  } as TextTimerOptions
  build() {
    Column({ space: 10 } as ColumnOptions) {
      NodeContainer(this.myNodeController)
      Text('origin')
      TextTimer(this.data)
        .format(this.format)
        .fontColor(Color.Red)
        .fontSize(50)
      Row() {
        Button('start').onClick((e:ClickEvent) => {
          this.textTimerController.start()
        })
        Button('pause').onClick((e:ClickEvent) => {
          this.textTimerController.pause()
        })
        Button('reset').onClick((e:ClickEvent) => {
          this.textTimerController.reset()
        })
      }
    }.width('100%')
    .alignItems(HorizontalAlign.Center)
  }
}