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
  ListItem,Divider,Alignment,BarState,RouteType,Repeat,RepeatItem,
  Color,Scroll,PageTransitionEnter,PageTransitionExit,
  FlexAlign,ComponentV2,TabsController,Tabs
} from '@ohos.arkui.component'
import {
  State,Provider,
  Watch,Param,
  Link,Monitor,Trace,ObservedV2,Event,Consumer,
  StorageLink,IMonitor,IMonitorValue,Local
} from '@ohos.arkui.stateManagement'

@Entry
@ComponentV2
struct RepeatForEachString {
  @Local dataList1: Array<string> = [];
  @Local dataList2: string[] = [];

  aboutToAppear(): void {
    for (let i = 0; i < 10; i++) {
      this.dataList1.push('string' + i);
    }
    this.dataList2 = ['MyString1', 'MyString2', 'MyString3']
  }

  build() {
    Column() {
        Button('change No.5 data').id('changeBtn')
        .onClick(():void => {
          this.dataList1[5] = '999'
          this.dataList2[0] = 'newString'
        })
      List({ initialIndex: 10 }) {
        Repeat<string>(this.dataList1)
          .each((obj: RepeatItem<string>) => {
            ListItem() {
              Row() {
                Text(obj.item).id('repeat1_S' + obj.index.toString())
                  .fontSize(9)
                ForEach(this.dataList2, (item: string) => {
                  Text(' ' + item).id('foreach1_S' + obj.index.toString())
                    .fontSize(9)
                    .fontColor(Color.Orange)
                })
              }
            }
          })
          .key((item: string, index: int) => {
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