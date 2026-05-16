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
  ListItemGroup,
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
struct groupAnimationHeightExample {
  private scroller: ListScroller = new ListScroller()
  @State arr: number[] = [1, 2, 3] as number[]
  @State arr2: number[] = [0, 1, 2, 3, 4, 5] as number[]
  @State message: string = 'mess'

  build() {
    Column() {
      Text(this.message).id('group_height_mess')
      Button('next page2')
        .id('group_animation_height')
        .onClick((e: ClickEvent) => {
          this.scroller.scrollPage({ next: true, animation: true })
        })
      List({ space: 5, scroller: this.scroller }) {
        ForEach(this.arr, (item0: number, groupIndex: int) => {
          ListItemGroup() {
            ForEach(this.arr2, (item: number, itemIndex: int) => {
              ListItem() {
                Text('Group:' + groupIndex + ', Item:' + item)
                  .width('100%')
                  .height(itemIndex % 2 == 0 ? 0.0 : '20%')
                  .fontSize(20)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xFFFFFF)
              }
              .borderColor(Color.Pink)
              .borderWidth(3)
            }, (item: number) => item.toString())
          }
          .divider({ strokeWidth: 1, color: Color.Blue })
          .borderColor(Color.Green)
          .borderWidth(3)
        })
      }
      .scrollBar(BarState.On)
      .width('90%')
      .height('60%')
      .borderWidth(2)
      .onScrollVisibleContentChange((start: VisibleListContentInfo, end: VisibleListContentInfo) => {
        this.message = 'onScrollVisibleContentChange: ' + start.index
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