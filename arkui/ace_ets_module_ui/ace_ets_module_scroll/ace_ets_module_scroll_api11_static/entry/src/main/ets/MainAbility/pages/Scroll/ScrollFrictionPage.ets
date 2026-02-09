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
import {
  Entry,
  Column,
  Component,
  Color,
  Text,
  LoadingProgress,
  Margin,
  Scroller,
  Scroll,
  ColumnOptions,
  Stack,
  Edge,
  Alignment,
  ForEach,
  ScrollDirection,
  BarState,
  EdgeEffect,
  TextAlign,
  ICurve,
  Row,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  FontWeight,
  Button,
  ButtonType,
  ClickEvent,
  ScrollSource,
  ScrollState
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { MessageManager, Callback, Message } from '../../common/MessageManager';

@Entry
@Component
struct ScrollFrictionPage {
  scroller: Scroller = new Scroller();
  private arr: Array<number> = new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
  @State friction: number = 1000;
  messageManager: MessageManager<number> = new MessageManager<number>();

  onPageShow() {
    console.info('Scroll_lanes page show called');
    AppStorage.setOrCreate<MessageManager<number>>('messageManager', this.messageManager)
    let callback: Callback<number> = (message: Message<number>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'friction') {
        this.friction = message.value;
      }
    }
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column() {
      Scroll(this.scroller) {
        Column() {
          ForEach(this.arr, (item: number, index: int) => {
            Text(item.toString())
              .width('100%')
              .height('30%')
              .fontSize(16)
              .textAlign(TextAlign.Center)
          }, (item: number) => `${item}`)
        }.width('100%')
      }
      .width('90%')
      .height('10%')
      .key('scroll_friction_default')

      Scroll(this.scroller) {
        Column() {
          ForEach(this.arr, (item: number, index: int) => {
            Text(item.toString())
              .width('90%')
              .height(150)
              .backgroundColor(0xFFFFFF)
              .borderRadius(15)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .margin({ top: 10 } as Margin)
          }, (item: number) => `${item}`)
        }.width('100%')
      }
      .width('90%')
      .height('60%')
      .scrollable(ScrollDirection.Vertical) // 滚动方向纵向
      .scrollBar(BarState.On) // 滚动条常驻显示
      .scrollBarColor(Color.Gray) // 滚动条颜色
      .scrollBarWidth(10) // 滚动条宽度
      .edgeEffect(EdgeEffect.None)
      .onWillScroll((xOffset: number, yOffset: number, scrollState: ScrollState, scrollSource: ScrollSource) => {
        console.info(xOffset + ' ' + yOffset)
      })
      .onScrollEdge((side: Edge): void => {
        console.info('To the edge')
      })
      .onScrollStop(() => {
        console.info('Scroll Stop')
      })
      .friction(this.friction)
      .key('Scroll_ScrollFriction')
    }.width('100%').height('100%').backgroundColor(0xDCDCDC)
  }
}