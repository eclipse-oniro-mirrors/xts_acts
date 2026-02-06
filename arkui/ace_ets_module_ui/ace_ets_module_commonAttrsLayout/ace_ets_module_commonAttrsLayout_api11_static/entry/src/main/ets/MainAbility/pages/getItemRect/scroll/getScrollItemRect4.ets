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
  Scroll,
  ScrollDirection,
  Scroller,
  Text,
  TextAlign,
  Visibility
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct getScrollItemRect4 {
  scroller: Scroller = new Scroller()
  @State arr: string[] = ['0', '1', '2', '3', '4', '5']
  @State visibility1: Visibility = Visibility.Visible
  @State index: Int = 0
  @State x: number = 0
  @State y: number = 0
  @State width1: number = 0
  @State height1: number = 0
  messageManager: MessageManager<Object> = new MessageManager<Object>()
  messageManagerVisibility: MessageManager<Visibility> = new MessageManager<Visibility>()

  onPageShow() {
    console.info('getScrollItemRect4 onPageShow');
    AppStorage.setOrCreate<MessageManager<Object>>('messageManager', this.messageManager);
    AppStorage.setOrCreate<MessageManager<Visibility>>('messageManagerVisibility', this.messageManagerVisibility);
    let callback: Callback<Object> = (message: Message<Object>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'index') {
        this.index = message.value as Int;
      }
    }
    let visibilityCallback: Callback<Visibility> = (message: Message<Visibility>) => {
      if (message.name == 'visibility1') {
        this.visibility1 = message.value as Visibility;
      }
    }
    this.messageManagerVisibility.registerCallback(visibilityCallback);
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column() {
      Button('点击获取信息').onClick((event: ClickEvent) => {
        this.x = this.scroller.getItemRect(this.index).x
        this.y = this.scroller.getItemRect(this.index).y
        this.width1 = this.scroller.getItemRect(this.index).width
        this.height1 = this.scroller.getItemRect(this.index).height
      }).id('getScrollItemRect4_button')
      Text('' + this.x).key('getScrollItemRect4_text1')
      Text('' + this.y).key('getScrollItemRect4_text2')
      Text('' + this.width1).key('getScrollItemRect4_text3')
      Text('' + this.height1).key('getScrollItemRect4_text4')

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
        .width('100%')
        .visibility(this.visibility1)

      }
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.Auto)
      .width(200)

    }
  }
}