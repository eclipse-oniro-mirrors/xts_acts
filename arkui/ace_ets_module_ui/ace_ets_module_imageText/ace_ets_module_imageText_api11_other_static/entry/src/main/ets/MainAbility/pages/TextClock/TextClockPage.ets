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
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  $r,
  Margin,
  ColumnOptions,
  Flex,
  Scroll,
  Padding,
  Position,
  Builder,
  Image,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow,
  TextClockController,
  TextClock
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct TextClockPage {
  @State accumulateTime: long = 0
  @State timeZoneOffset: number = -8
  @State format: string = 'hms'
  @State status: string = 'run'
  @State change: string = 'no change'
  // 导入对象
  controller: TextClockController = new TextClockController()
  messageManager: MessageManager<int | string | long | double> = new MessageManager<int | string | long | double>()

  onPageShow() {
    console.info('NavDestination onPageShow')
    AppStorage.setOrCreate<MessageManager<int | string | long | double>>("messageManager", this.messageManager);
    let callback: Callback<int | string | long | double> = (message: Message<int | string | long | double>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'accumulateTime') {
        this.accumulateTime = message.value as long
      }
      if (message.name == 'timeZoneOffset') {
        this.timeZoneOffset = message.value as Double
      }
      if (message.name == 'format') {
        this.format = message.value as String
      }
      if (message.name == 'status') {
        this.status = message.value as String
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text('Current milliseconds is ' + this.accumulateTime)
        .fontSize(20)
        .key('accumulateTime')
      // 以12小时制显示东八区的系统时间，精确到秒。
      TextClock({ timeZoneOffset: this.timeZoneOffset, controller: this.controller })
        .format(this.format)
        .key('textClock')
        .onDateChange((value: long) => {
          this.change = 'change'
          this.accumulateTime = value
        })
        .margin(20)
        .fontSize(30)
      Button("start TextClock")
        .margin({ bottom: 10 } as Margin)
        .onClick((e: ClickEvent) => {
          // 启动文本时钟
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
      Text(this.status + ' success').fontSize(20).key('operation').id('operation')
      Text(this.change + ' success').fontSize(20).key('change').id('change')
    }
    .width('100%')
    .height('100%')
  }
}