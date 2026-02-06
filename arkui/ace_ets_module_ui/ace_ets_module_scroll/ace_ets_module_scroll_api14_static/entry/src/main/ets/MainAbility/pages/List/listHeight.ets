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
  BarState,
  Button,
  ClickEvent,
  Color,
  Column,
  Component,
  Entry,
  Flex,
  FlexDirection,
  ForEach,
  ItemAlign,
  List,
  ListItem,
  ListScroller,
  NodeContainer,
  Padding,
  Row,
  Text,
  TextAlign,
  VisibleListContentInfo
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct listAnimationHeightExample {
  private scroller: ListScroller = new ListScroller()
  @State arr: number[] = [1, 2] as number[]
  @State firstViewIndex: number = 0
  @State lastViewIndex: number = 0

  aboutToAppear() {
    for (let i = 3; i <= 7; i++) {
      this.arr.push(i)
    }
  }

  build() {
    Column() {
      Text('List: ' + this.lastViewIndex)
        .id('height_last_index')
      Button('scrollPage:向下带动画翻页')
        .id('height_anTrue')
        .onClick((e: ClickEvent) => {
          this.scroller.scrollPage({ next: true, animation: true })
        })

      List({ scroller: this.scroller }) {
        ForEach(this.arr, (item: number, itemIndex: int) => {
          ListItem() {
            Text('Item:' + item + ', itemIndex:' + itemIndex)
              .width('100%')
              .height(item % 3 == 0 ? 0.0 : '25%')
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }
          .onAppear(() => {
            console.info('onAppear_item:' + item + ', itemIndex:' + itemIndex)
          })
          .onDisAppear(() => {
            console.info('onDisAppear_item:' + item + ', itemIndex:' + itemIndex)
          })
          .borderColor(Color.Pink)
          .borderWidth(2)
        }, (item: number, itemIndex: int) => (item + itemIndex).toString())
      }
      .width('90%')
      .height('50%')
      .borderWidth(1)
      .divider({
        strokeWidth: 1,
        color: 0xFFFFFF,
        startMargin: 20,
        endMargin: 20
      })
      .onScrollIndex((firstIndex: int, lastIndex: int, centerIndex: int) => {
        console.info('first' + firstIndex)
        console.info('last' + lastIndex)
        console.info('center' + centerIndex)
        this.firstViewIndex = firstIndex
        this.lastViewIndex = lastIndex
      })
      .onScrollVisibleContentChange((start: VisibleListContentInfo, end: VisibleListContentInfo) => {
        console.log(' start index: ' + start.index +
          ' start item group area: ' + start.itemGroupArea +
          ' start index in group: ' + start.itemIndexInGroup)
        console.log(' end index: ' + end.index +
          ' end item group area: ' + end.itemGroupArea +
          ' end index in group: ' + end.itemIndexInGroup)
      })

    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 } as Padding)
  }
}