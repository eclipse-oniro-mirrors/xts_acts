/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { MessageManager, Callback } from '../../common/MessageManager';

@Entry
@Component
struct ProgressPage {
  @State value: number = 20
  @State total: number = 100
  @State type: ProgressType = ProgressType.Linear
  @State color : Color = Color.Grey
  @State backColor : Color = Color.Red
  @State strokeWidth: number = 15
  @State scaleCount: number = 15
  @State scaleWidth: number = 5
  messageManager:MessageManager = new MessageManager()

  onPageShow() {
    console.info('ProgressPage onPageShow')
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback: Callback = (message: ESObject) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'progressValue') {
        this.value = message.value
      }
      if (message.name == 'progressTotal') {
        this.total = message.value
      }
      if (message.name == 'ProgressType') {
        this.type = message.value
      }
      if (message.name == 'progressColor') {
        this.color = message.value
      }
      if (message.name == 'backgroundColor') {
        this.backColor = message.value
      }
      if (message.name == 'strokeWidth') {
        this.strokeWidth = message.value
      }
      if (message.name == 'scaleCount') {
        this.scaleCount = message.value
      }
      if (message.name == 'scaleWidth') {
        this.scaleWidth = message.value
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column({ space: 15 }) {
      Text('Linear Progress').fontSize(9).fontColor(0xCCCCCC).width('90%').key('text')
      Progress({ value: this.value, total: this.total, type: this.type })
        .color(this.color)
        .value(this.value)
        .width(200)

        .backgroundColor(this.backColor)
        .key('pro1')
      Progress({ value: 10 }).width(100).key('pro2')

      Text('Eclipse Progress').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Row({ space: 40 }) {
        Progress({ value: 10, type: ProgressType.Eclipse }).width(100)
        Progress({ value: this.value, total: 150, type: ProgressType.Eclipse }).color(this.color).value(50).width(100)
      }

      Text('ScaleRing Progress').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Row({ space: 40 }) {
        Progress({ value: 10, type: ProgressType.ScaleRing }).width(100)
        Progress({ value: this.value, total: 150, type: ProgressType.ScaleRing })
          .color(this.color).value(50).width(100)
          .style({ strokeWidth: this.strokeWidth, scaleCount: this.scaleCount, scaleWidth: this.scaleWidth })
          .key('pro3')
      }

      Text('Ring Progress').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Row({ space: 40 }) {
        Progress({ value: 10, type: ProgressType.Ring }).width(100)
        Progress({ value: this.value, total: 150, type: ProgressType.ScaleRing })
          .color(this.color).value(50).width(100)
          .style({ strokeWidth: 20, scaleCount: 30, scaleWidth: 20 })
      }

      Text('Capsule Progress').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Row({ space: 40 }) {
        Progress({ value: 10, type: ProgressType.Capsule }).width(100).height(50)
        Progress({ value: this.value, total: 150, type: ProgressType.Capsule })
          .color(this.color)
          .value(50)
          .width(100)
          .height(50)
        Progress({ value: this.value, total: 150, type: ProgressType.Linear})
          .style({ strokeWidth: 20, scaleCount: 30, scaleWidth: 20 ,strokeRadius:2})
          .color(this.color)
          .value(50)
          .width(100)
          .height(50)
      }
    }.width('100%').margin({ top: 30 })
  }
}