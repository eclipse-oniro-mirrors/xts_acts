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

//测试：Repeat组件和ForEach混用场景
import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  ForEach,
  Text,
  Row,
  List,
  ListItem,Divider,Alignment,BarState,RouteType,
  Color,Scroll,PageTransitionEnter,PageTransitionExit,
  FlexAlign,ComponentV2,TabsController,Tabs,Repeat,RepeatItem,
} from '@ohos.arkui.component'
import {
  State,Provider,
  Watch,Param,
  Link,Monitor,Trace,ObservedV2,Event,Consumer,
  StorageLink,IMonitor,IMonitorValue,Local
} from '@ohos.arkui.stateManagement'


@Entry
@ComponentV2
struct RepeatForEachNumberBool {
  @Local dataList1: Array<number> = [];
  @Local dataList2: Array<boolean> = [];

  aboutToAppear(): void {
    for (let i = 0; i < 6; i++) {
      this.dataList1.push(i);
      this.dataList2.push(i % 2 === 0)
    }
  }

  build() {
    Column() {
      Button('change No.5 data').id('changeBtn')
        .onClick(():void => {
          this.dataList1[5] = 999
          this.dataList2[5] = this.dataList2[5] ? false : true
        })
      List({ initialIndex: 10 }) {
        Repeat<number>(this.dataList1)
          .each((obj: RepeatItem<number>) => {
            ListItem() {
              Row() {
                Text(obj.item.toString()).id('repeat1_NM' + obj.index.toString())
                  .fontSize(9)
                ForEach(this.dataList2, (item: boolean) => {
                  Text('' + item).id('foreach1_NM' + obj.index.toString())
                    .fontSize(9)
                    .fontColor(Color.Orange)
                })
              }
            }
          })
          .key((item: number, index: int) => {
            return item.toString();
          })
      }
      .cachedCount(1)
      .border({ width: 1 })
      .width('90%')
      .layoutWeight(1)

    }
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}