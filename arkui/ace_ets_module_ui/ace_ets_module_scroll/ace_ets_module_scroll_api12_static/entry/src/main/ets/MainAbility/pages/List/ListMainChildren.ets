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
import {
  Entry,
  Component,
  List,
  ColumnOptions,
  ListItem,
  Text,
  Column,
  Button,
  Margin,
  ForEach,
  ClickEvent,
  Color,
  Axis,
  BarState,
  ChildrenMainSize,
  ListItemGroup,
  Padding,
  ListItemGroupStyle,
  ListItemStyle,
  TextAlign,
  Row
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct ListMainChildren1 {
  @State listChildrenSize: ChildrenMainSize = new ChildrenMainSize(20)
  @State listChildrenSize1: ChildrenMainSize = new ChildrenMainSize(10)
  @State message: number = 0
  @State message1: number = 0
  private arr: ArrObject[] = [
    {
      style: ListItemGroupStyle.CARD,
      itemStyles: [ListItemStyle.CARD, ListItemStyle.CARD, ListItemStyle.CARD]
    } as ArrObject,
    {
      style: ListItemGroupStyle.CARD,
      itemStyles: [ListItemStyle.CARD, ListItemStyle.CARD, ListItemStyle.NONE]
    } as ArrObject,
    {
      style: ListItemGroupStyle.CARD,
      itemStyles: [ListItemStyle.CARD, ListItemStyle.NONE, ListItemStyle.CARD]
    } as ArrObject
  ]
  build() {
    Column() {
      List({ space: "4vp", initialIndex: 0 }) {
        ForEach(this.arr, (item: ArrObject, index: int) => {
          ListItemGroup({ style: item.style }) {
            ForEach(item.itemStyles, (itemStyle: ListItemStyle, itemIndex: int) => {
              ListItem({ style: itemStyle }) {
                if (index != undefined && itemIndex != undefined) {
                  Text("第" + (index + 1) + "个Group中第" + (itemIndex + 1) + "个item")
                    .width("100%")
                    .textAlign(TextAlign.Center)
                }
              }
            }, (item: ListItemStyle) => item.toString())
          }
          .childrenMainSize(this.listChildrenSize1)
        })
      }.childrenMainSize(this.listChildrenSize)
      .width('100%')
      .multiSelectable(true)
      .backgroundColor('0xDCDCDC')

      Row() {
        Button('ListChild:' + this.message)
          .id('ListMainChildren_1')
          .onClick(() => {
          this.message = this.listChildrenSize.childDefaultSize
        }).height('50%').width('30%')
        Button('ListItemGroupChild:' + this.message1)
          .id('ListMainChildren_2')
          .onClick(() => {
          this.message1 = this.listChildrenSize1.childDefaultSize
        }).height('50%').width('30%')
      }.height('20%')
    }
    .width('100%')
    .padding({ top: 5 } as Padding)
  }
}

interface ArrObject {
  style: ListItemGroupStyle;
  itemStyles: ListItemStyle[];
}