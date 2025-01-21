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
struct MarqueeExample {
  @State start:boolean = false
  @State fromStart:boolean = true
  @State step:number = 50
  @State loop:number = 2
  @State src:string = "Running Marquee starts rolling"
  @State message1:string = "message1"
  @State message2:string = "message2"
  @State message3:string = "message3"
  @State allowScale:boolean = false
  messageManager = new MessageManager<Message>()

  onPageShow() {
    console.info('Gauge onPageShow')
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback: Callback<Message> = message => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'step') {
          this.step = message.value as number
      }
      if (message.name == 'loop') {
          this.loop = message.value as number
      }
      if (message.name == 'src') {
          this.src = message.value as string
      }
      if (message.name == 'allowScale') {
          this.allowScale = message.value as boolean
      }
      if (message.name == 'fromStart') {
          this.fromStart = message.value as boolean
      }
      if (message.name == 'start') {
          this.start = message.value as boolean
      }

    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Marquee({
        start:this.start,
        step:this.step,
        loop:this.loop,
        fromStart:this.fromStart,
        src:this.src
      })
        .width(360)
        .height(80)
        .fontColor('#FFFFFF')
        .fontSize(48)
        .allowScale(this.allowScale)
        .fontWeight(700)
        .backgroundColor('#182431')
        .margin({ bottom: 40 })
        .key('marquee')
        .onStart(() => {
          console.info('Marquee animation complete onStart')
          this.message1 = "onStart"
        })
        .onBounce(() => {
          console.info('Marquee animation complete onBounce')
          this.message2 = "onBounce"
        })
        .onFinish(() => {
          console.info('Marquee animation complete onFinish')
          this.message3 = "onFinish"
        })
      Button('Start')
        .onClick(() => {
          this.start = true
        })
        .width(120)
        .height(40)
        .fontSize(16)
        .fontWeight(500)
        .backgroundColor('#007DFF').key('start')

      Text(this.message1).fontSize(14).lineHeight(20).fontColor('#182431').fontWeight(500).key('text1')
      Text(this.message2).fontSize(14).lineHeight(20).fontColor('#182431').fontWeight(500).key('text2')
      Text(this.message3).fontSize(14).lineHeight(20).fontColor('#182431').fontWeight(500).key('text3')
    }
    .width('100%')
    .height('100%')
  }
}