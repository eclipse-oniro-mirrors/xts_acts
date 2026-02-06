 'use static';
/*
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
 import { Entry, Margin, Component, Column, Button, TextClock, TextClockController, Marquee, Flex, ClickEvent, FlexDirection, ItemAlign, FlexAlign, Text, MarqueeUpdateStrategy} from '@ohos.arkui.component'
 import {
   State,
   AppStorage
 } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct MarqueeMirroring {
  @State start: boolean = false
  @State src: string = ''
  @State marqueeText: string = 'Running Marquee'
  private fromStart: boolean = true
  private step: number = 10
  private loop: int = 1
  @State onStart: string = 'Init'
  @State onBounce: string = 'Init'
  @State onFinish: string = 'Init'
  controller: TextClockController = new TextClockController()
  convert2time(value: number): string {
    let date = new Date(String(value+'000'));
    let hours = String(date.getHours()).padStart(2, '0');
    let minutes = String(date.getMinutes()).padStart(2, '0');
    let seconds = String(date.getSeconds()).padStart(2, '0');
    return hours+ ":" + minutes + ":" + seconds;
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text(this.onStart).id('MarqueeMirroring_onStart')
      Text(this.onBounce).id('MarqueeMirroring_onBounce')
      Text(this.onFinish).id('MarqueeMirroring_onFinish')
      Marquee({
        start: this.start,
        step: this.step,
        loop: this.loop,
        fromStart: this.fromStart,
        src: this.marqueeText + ' Hello'
      })
        .id('MarqueeMirroring_id')
        .marqueeUpdateStrategy(MarqueeUpdateStrategy.PRESERVE_POSITION)
        .width(300)
        .height(80)
        .fontColor('#FFFFFF')
        .fontSize(48)
        .fontWeight(700)
        .backgroundColor('#182431')
        .margin({ bottom: 40 } as Margin)
        .onStart(() => {
          console.info('Marquee animation complete onStart',this.onStart)
          this.onStart = "onStart succ"
        })
        .onBounce(() => {
          console.info('Marquee animation complete onBounce')
          this.onBounce = "onBounce succ"
        })
        .onFinish(() => {
          console.info('Marquee animation complete onFinish')
          this.onFinish = "onFinish succ"
        })
      Button('Start').id("MarqueeMirroring_Start")
        .onClick((e: ClickEvent) => {
          this.start = true
        })
        .width(120)
        .height(40)
        .fontSize(16)
        .fontWeight(500)
        .backgroundColor('#007DFF')

      TextClock({ timeZoneOffset: -8, controller: this.controller })
        .format('hms')
        .onDateChange((value: Long) => {
          this.src = this.convert2time(value);
        })
        .margin(20)
        .fontSize(30)
    }
    .width('100%')
    .height('100%')
  }
}