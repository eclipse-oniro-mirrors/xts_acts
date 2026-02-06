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
  Column,
  Scroller,
  ScrollDirection,
  Flex,
  Text,
  FlexDirection,
  ForEach,
  ScrollBarDirection,
  BarState,
  Color,
  Stack,
  Alignment,
  Scroll,
  ScrollBar,
  Row,
  Margin,
  TextAlign,
  ScrollSource,
  ScrollState
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';

type messageType = Scroller | ScrollBarDirection | BarState | Color | ScrollDirection | string

@Entry
@Component
struct ScrollBarPage {
  private scroller: Scroller = new Scroller()
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] as number[]
  @State ScrollDirection: ScrollDirection = ScrollDirection.Vertical
  @State scrollBarDirection: ScrollBarDirection = ScrollBarDirection.Vertical
  @State state: BarState = BarState.Auto
  @State backColor: Color = Color.Grey
  messageManager: MessageManager<messageType> = new MessageManager<messageType>()

  onPageShow() {
    console.info('ScrollBarPage onPageShow')
    AppStorage.setOrCreate<MessageManager<messageType>>('messageManager', this.messageManager);
    let callback: Callback<messageType> = (message: Message<messageType>) => {

      if ( message.value instanceof string) {
        /// 用例异常值处理
        this.scrollBarDirection = ScrollBarDirection.Vertical
        this.state = BarState.Auto
        this.backColor = Color.Grey
        return
      }

      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'scroller') {
        this.scroller = message.value as Scroller
      }
      if (message.name == 'scrollBarDirection') {
        this.scrollBarDirection = message.value as ScrollBarDirection
      }
      if (message.name == 'BarState') {
        this.state = message.value as BarState
      }
      if (message.name == 'backgroundColor') {
        this.backColor = message.value as Color
      }
      if (message.name == 'ScrollDirection') {
        this.ScrollDirection = message.value as ScrollDirection
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column() {
      Stack({ alignContent: Alignment.End }) {
        Scroll(this.scroller) {
          Flex({ direction: FlexDirection.Column }) {
            ForEach(this.arr, (item: number, index: int) => {
              Row() {
                Text(item.toString())
                  .width('90%')
                  .height(100)
                  .backgroundColor('#3366CC')
                  .borderRadius(15)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .margin({ top: 5 } as Margin)
              }
            }, (item: number, index: int) => String(item))
          }.margin({ left: 52 } as Margin)
        }
        .scrollBar(BarState.Off)
        .scrollable(this.ScrollDirection)

        ScrollBar({ scroller: this.scroller, direction: this.scrollBarDirection, state: this.state }) {
          Text()
            .width(30)
            .height(100)
            .borderRadius(10)
            .backgroundColor('#C0C0C0')
        }.width(30).backgroundColor(this.backColor).key('scrollBar')
      }
    }
  }
}