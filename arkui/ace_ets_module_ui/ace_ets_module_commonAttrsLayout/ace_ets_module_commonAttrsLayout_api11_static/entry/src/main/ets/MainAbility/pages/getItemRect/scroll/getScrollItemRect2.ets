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
import { Callback, Message, MessageManager } from '../../../common/MessageManager';
import {
  BarState,
  Button,
  ClickEvent,
  Column,
  Component,
  Entry,
  ForEach,
  Position,
  Scroll,
  ScrollDirection,
  Scroller,
  Text,
  TextAlign
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct getScrollItemRect2 {
  scroller: Scroller = new Scroller()
  @State arr: string[] = ['0', '1', '2', '3', '4', '5']
  @State x1: number = 0
  @State y1: number = 0
  @State index: Int = 0
  @State x: number = 0
  @State y: number = 0
  @State width1: number = 0
  @State height1: number = 0
  messageManager: MessageManager<Object> = new MessageManager<Object>()

  onPageShow() {
    console.info('getScrollItemRect2 onPageShow');
    AppStorage.setOrCreate<MessageManager<Object>>('messageManager', this.messageManager);
    let callback: Callback<Object> = (message: Message<Object>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'index') {
        this.index = message.value as Int;
      } else if (message.name == 'x1') {
        this.x1 = message.value as number;
      } else if (message.name == 'y1') {
        this.y1 = message.value as number;
      }
    }
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column() {
      Button('点击获取信息').onClick((event: ClickEvent) => {
        this.x = this.scroller.getItemRect(this.index).x
        this.y = this.scroller.getItemRect(this.index).y
        this.width1 = this.scroller.getItemRect(this.index).width
        this.height1 = this.scroller.getItemRect(this.index).height
      }).id('getScrollItemRect2_button')
      Text('' + this.x).key('getScrollItemRect2_text1')
      Text('' + this.y).key('getScrollItemRect2_text2')
      Text('' + this.width1).key('getScrollItemRect2_text3')
      Text('' + this.height1).key('getScrollItemRect2_text4')

      Scroll(this.scroller) {
        Column() {
          ForEach(this.arr, (item: string) => {
            Text(item.toString())
              .width('100%')
              .height(100)
              .backgroundColor('#3366CC')
              .borderRadius(15)
              .fontSize(16)
              .textAlign(TextAlign.Center)
          })
        }
        .width(300)
        .offset({ x: this.x1, y: this.y1 } as Position)

      }
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.Auto)
      .height(500)

    }
  }
}