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
let timerController = new TextTimerController()
let data: TextTimerOptions = {
  isCountDown: true,
  count: 86400000,
  controller: timerController
}

class MyNodeController extends NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext)
    let col = typeNode.createNode(uiContext, 'Column')
    col.initialize({ space: 10 }).borderColor(Color.Black).alignItems(HorizontalAlign.Center)

    let row = typeNode.createNode(uiContext, 'Row')
    row.initialize().width('100%')
    let textTimer = typeNode.createNode(uiContext, 'TextTimer')
    textTimer.initialize(undefined)
    textTimer.initialize(data)
      .format('HH:mm:ss.SS')
      .fontColor(Color.Red)
      .width(150)
      .key('key_ TextTimer_001')


    let timerStart = typeNode.createNode(uiContext, 'Button')
    let timerPause = typeNode.createNode(uiContext, 'Button')
    let timerReset = typeNode.createNode(uiContext, 'Button')
    timerStart.initialize('start').onClick(()=>{
      timerController.start()
    })
    timerPause.initialize('pause').onClick(()=>{
      timerController.pause()
    })
    timerReset.initialize('reset').onClick(()=>{
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
  }
  build() {
    Column({ space: 10 }) {
      NodeContainer(this.myNodeController)
      Text('origin')
      TextTimer(this.data)
        .format(this.format)
        .fontColor(Color.Red)
        .fontSize(50)
      Row() {
        Button('start').onClick(() => {
          this.textTimerController.start()
        })
        Button('pause').onClick(() => {
          this.textTimerController.pause()
        })
        Button('reset').onClick(() => {
          this.textTimerController.reset()
        })
      }
    }.width('100%')
    .alignItems(HorizontalAlign.Center)
  }
}