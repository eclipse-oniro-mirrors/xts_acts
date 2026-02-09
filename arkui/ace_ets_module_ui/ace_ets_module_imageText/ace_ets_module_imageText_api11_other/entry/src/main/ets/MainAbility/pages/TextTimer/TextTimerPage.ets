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
  messageManager:MessageManager = new MessageManager()

  onPageShow() {
    console.info('TextTimer onPageShow')
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback: Callback = (message: ESObject) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'isCountDown') {
        this.isCountDown = message.value
      }
      if (message.name == 'count') {
        this.count = message.value
      }
      if (message.name == 'format') {
        this.format = message.value
      }
      if (message.name == 'start') {
        this.start = message.value
      }
      if (message.name == 'pause') {
        this.pause = message.value
      }
      if (message.name == 'reset') {
        this.reset = message.value
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column() {
      TextTimer({ controller: this.textTimerController })
        .fontColor(Color.Black)
        .key('default')
        .fontSize(40)
        .onTimer((utc: number, elapsedTime: number) => {
          console.info('textTimer notCountDown utc is：' + utc + ', elapsedTime: ' + elapsedTime)
        })
        .height('20%')
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
        .height('20%')
      Row(){
        Text('start:' + this.start).fontSize(20).key('start').width('45%')
        Text('pause:' + this.pause).fontSize(20).key('pause').width('45%')
      }.height('10%')
      Row(){
        Text('reset:' + this.reset).fontSize(20).key('reset').width('45%')
        Text(this.utc.toString()).fontSize(20).key('utcNum').width('45%')
      }.height('10%')
      Text(this.elapsedTime.toString()).fontSize(20).margin(10).key('elapsedTime').height('10%')
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
      }.height('10%')
    }.width('100%').height('100%')
  }
}