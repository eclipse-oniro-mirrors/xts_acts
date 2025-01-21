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
import {MessageManager,Callback} from '../utils/MessageManager';

type Message = boolean|string|number

@Entry
@Component
struct TextTimerPage {
  @State isCountDown: boolean = true
  @State count: number = 50000
  @State format: string = 'mm:ss.SS'
  @State start: string = ''
  @State pause: string = ''
  @State reset: string = ''
  @State utc: number = 0
  @State elapsedTime: number = 0
  textTimerController: TextTimerController = new TextTimerController()
  messageManager = new MessageManager<Message>()

  onPageShow() {
    console.info('TextTimer onPageShow')
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback: Callback<Message> = message => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'isCountDown') {
        this.isCountDown = message.value as boolean
      }
      if (message.name == 'count') {
        this.count = message.value as number
      }
      if (message.name == 'format') {
        this.format = message.value as string
      }      
      if (message.name == 'start') {
        this.start = message.value as string
      }
      if (message.name == 'pause') {
        this.pause = message.value as string
      }
      if (message.name == 'reset') {
        this.reset = message.value as string
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column() {
      TextTimer({ controller: this.textTimerController })
        .fontColor(Color.Black)
        .key('default')
        .fontSize(50)
        .onTimer((utc: number, elapsedTime: number) => {
          console.info('textTimer notCountDown utc is：' + utc + ', elapsedTime: ' + elapsedTime)
        })
      TextTimer({ controller: this.textTimerController, isCountDown: this.isCountDown, count: this.count })
        .format(this.format)
        .fontColor(Color.Black)
        .key('textTimer')
        .fontSize(50)
        .onTimer((utc: number, elapsedTime: number) => {
          this.utc = utc
          this.elapsedTime = elapsedTime
          console.info('textTimer notCountDown utc is：' + utc + ', elapsedTime: ' + elapsedTime)
        })
      Text('start:' + this.start).fontSize(20).margin(10).key('start')
      Text('pause:' + this.pause).fontSize(20).margin(10).key('pause')
      Text('reset:' + this.reset).fontSize(20).margin(10).key('reset')
      Text(this.utc.toString()).fontSize(20).margin(10).key('utcNum')
      Text(this.elapsedTime.toString()).fontSize(20).margin(10).key('elapsedTime')
      Row() {
        Button("start").onClick(() => {
          this.start = 'succ'
          this.textTimerController.start()
        })
        Button("pause").onClick(() => {
          this.pause = 'succ'
          this.textTimerController.pause()
        })
        Button("reset").onClick(() => {
          this.reset = 'succ'
          this.textTimerController.reset()
        })
      }
    }.width('100%').height('100%')
  }
}