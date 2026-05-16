/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
'use static'

import { Entry, Text, Column, Component, Button, ClickEvent, Scroll, Row, List, Axis,Resource,$r,
  Visibility, VisibleListContentInfo, ScrollState, ColumnOptions, RowOptions, FontWeight, TextAlign,
  BarState, EdgeEffect, ForEach,ListItem,Color,Divider,HorizontalAlign, DataChangeListener,IDataSource,
  LazyForEach, ListItemGroup
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import ConfigurationConstant from '@ohos.app.ability.ConfigurationConstant';

export class MyDataSourceList11 implements IDataSource<string> {
  private list: string[] = [];
  private listener?: DataChangeListener = undefined;

  constructor(list: string[]) {
    this.list = list
  }

  totalCount(): int {
    return this.list.length
  }

  getData(index: int): string {
    return this.list[index.toInt()]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    this.listener = listener
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
  }
}

@Entry
@Component
struct ListSpaceWidthExample {
  private arr: MyDataSourceList11 = new MyDataSourceList11(['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']);

  @State spaceWIndex: Int = 0
  @State spaceWList: (Resource)[] = [
    $r('app.string.spaceWidth_normal'), $r('app.string.spaceWidth_error')
  ]
  build() {
    Scroll(){
      Column({ space: 10 } as ColumnOptions) {

        // 动态切换
        Column({ space: 5 } as ColumnOptions) {
          Column({ space: 5 } as ColumnOptions){
            Row(){
              Button('0')
                .onClick(() => {
                  this.spaceWIndex = 0
                })
                .id('changeSpaceWListValue0')
              Button('1')
                .onClick(() => {
                  this.spaceWIndex = 1
                })
                .id('changeSpaceWListValue1')
            }
            Scroll() {
              List({
                spaceWidth: this.spaceWList[this.spaceWIndex],
                initialIndex: 0
              }) {
                LazyForEach(this.arr, (item: string) => {
                  ListItemGroup({
                    spaceWidth: this.spaceWList[this.spaceWIndex],
                  }){
                    ListItem() {
                      Text('' + item)
                        .width('100%')
                        .height(100)
                        .fontSize(16)
                        .textAlign(TextAlign.Center)
                        .borderRadius(10)
                        .backgroundColor(0xFFFFFF)
                    }
                    ListItem() {
                      Text('1' + item)
                        .width('100%')
                        .height(100)
                        .fontSize(16)
                        .textAlign(TextAlign.Center)
                        .borderRadius(10)
                        .backgroundColor(0xFFFFFF)
                    }
                  }
                  .id('listItemGroupSpaceWidthIdStatic')
                }, (item: string) => item.toString())
              }
              .id('listSpaceWidthIdStatic')
              .listDirection(Axis.Vertical) // 排列方向
              .scrollBar(BarState.Off)
              .edgeEffect(EdgeEffect.Spring) // 边缘效果设置为Spring
              .width('50%')
            }.height('50%')
          }
          .width('100%')
          .padding(10)
          .backgroundColor(0xe1f5fe)
          .borderRadius(5)
        }
        .width('100%')
        .padding(10)
        .backgroundColor(0x317AF7)
        .borderRadius(8)

      }
      .width('100%')
      .backgroundColor(0xf5f5f5)
      .padding(15)
    }
  }
}