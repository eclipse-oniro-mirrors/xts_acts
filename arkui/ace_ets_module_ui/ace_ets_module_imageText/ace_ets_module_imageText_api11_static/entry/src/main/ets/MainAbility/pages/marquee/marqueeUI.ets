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

import { MessageManager, Callback, Message } from '../../common/MessageManager';
import {
  Entry,
  Component,
  Flex,
  Marquee,
  Button,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Text,
  Margin,
  ClickEvent
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import common from '@ohos.app.ability.common';

export class MarqueeManager {
  name: string = ''
  message: MessageManager = new MessageManager()
}

@Entry
@Component
struct MarqueeExample {
  @State start: boolean = false
  @State fromStart: boolean = true
  @State step: number = 50
  @State loop: int = 2
  @State src: string = "Running Marquee starts rolling"
  @State message1: string = "message1"
  @State message2: string = "message2"
  @State message3: string = "message3"
  @State allowScale: boolean = false
  messageManager: MessageManager = new MessageManager()

  onPageShow() {
    console.info('Gauge onPageShow')
    const marqueeManager = new MarqueeManager();
    marqueeManager.message = this.messageManager;
    marqueeManager.name = 'messageManager'
    AppStorage.setOrCreate<MarqueeManager>('marqueeManager', marqueeManager);
    let callback: Callback = (message: Message) => {
      const marqueeMessage: Message = message
      console.error('message = ' + marqueeMessage.name + "--" + marqueeMessage.value)
      if (marqueeMessage.name == 'step') {
        console.log("================================= marqueeMessage.value: " + marqueeMessage.value.toString())
        this.step = Number.parseInt(marqueeMessage.value.toString())
        console.log("================================= step: " + this.step)
      }
      if (marqueeMessage.name == 'loop') {
        console.log("============================================  loop")
        this.loop = Number.parseInt(marqueeMessage.value.toString()) as Int
        console.log("============================================   this.loop" +  this.loop)
      }
      if (marqueeMessage.name == 'src') {
        this.src = marqueeMessage.value as string
      }
      if (marqueeMessage.name == 'allowScale') {
        this.allowScale = marqueeMessage.value as boolean
      }
      if (marqueeMessage.name == 'fromStart') {
        console.log("============================================  fromStart")
        this.fromStart = marqueeMessage.value as boolean
        console.log("============================================   this.fromStart" +  this.fromStart)
      }
      if (marqueeMessage.name == 'start') {
        this.start = marqueeMessage.value as boolean
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Marquee({
        start: this.start,
        step: this.step,
        loop: this.loop,
        fromStart: this.fromStart,
        src: this.src
      })
        .width(360)
        .height(80)
        .fontColor('#FFFFFF')
        .fontSize(48)
        .allowScale(this.allowScale)
        .fontWeight(700)
        .backgroundColor('#182431')
        .margin({ bottom: 40 } as Margin)
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
        .onClick((e: ClickEvent) => {
          this.start = true
        })
        .width(120)
        .height(40)
        .fontSize(16)
        .fontWeight(500)
        .backgroundColor('#007DFF')
        .key('start')

      Text(this.message1)
        .fontSize(14)
        .lineHeight(20)
        .fontColor('#182431')
        .fontWeight(500)
        .key('text1')
      Text(this.message2)
        .fontSize(14)
        .lineHeight(20)
        .fontColor('#182431')
        .fontWeight(500)
        .key('text2')
      Text(this.message3)
        .fontSize(14)
        .lineHeight(20)
        .fontColor('#182431')
        .fontWeight(500)
        .key('text3')
    }
    .width('100%')
    .height('100%')
  }
}