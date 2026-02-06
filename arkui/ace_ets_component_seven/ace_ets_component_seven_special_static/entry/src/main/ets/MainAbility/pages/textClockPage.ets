'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { Entry, Component, AttributeModifier, TextClockAttribute, TextClockController, Flex, FontWeight, FontStyle, FlexDirection,
  ItemAlign, FlexAlign, Text, TextClock, Button, ClickEvent, Margin } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

class TextClockModifier1 implements AttributeModifier<TextClockAttribute> {
  applyNormalAttribute(instance: TextClockAttribute): void {
    instance
      .format('hh:mm:ss')
      .fontColor('#FF123456')
      .fontSize(15)
      .fontWeight(FontWeight.Normal)
      .fontFamily("cursive")
      .fontStyle(FontStyle.Italic)
  }
}

@Entry
@Component
struct TextClockPage {
  @State accumulateTime: long = 0
  @State timeZoneOffset: number = -8
  @State format: string = 'hms'
  @State status: string = 'run'
  @State change: string = 'no change'
  @State textClockModifier: TextClockModifier1 = new TextClockModifier1()
  // 导入对象
  controller: TextClockController = new TextClockController()

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text('Current milliseconds is ' + this.accumulateTime)
        .fontSize(20)
        .key('accumulateTime')

      TextClock({ timeZoneOffset: this.timeZoneOffset, controller: this.controller })
        .margin(20)
        .key('TextClockKey1')
        .attributeModifier(this.textClockModifier)
        .onDateChange((value: long) => {
          this.change = 'change'
          this.accumulateTime = value
        })
      Button("start TextClock")
        .margin({ bottom: 10 } as Margin)
        .onClick((e: ClickEvent) => {
          this.controller.start()
          this.status = 'start'
        })
      Button("stop TextClock")
        .onClick((e: ClickEvent) => {
          // 停止文本时钟
          this.controller.stop()
          this.status = 'stop'
          this.change = 'no change'
        })
      Text(this.status + ' success').fontSize(20).key('operation')
      Text(this.change + ' success').fontSize(20).key('change')
    }
    .width('100%')
    .height('100%')
  }
}