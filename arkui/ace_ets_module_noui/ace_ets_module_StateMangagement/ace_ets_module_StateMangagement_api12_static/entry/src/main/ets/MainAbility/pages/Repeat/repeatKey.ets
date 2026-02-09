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
  ListItem,Image,Stack,Repeat,Swiper,
  Color,ColumnOptions,RepeatItem,
  FlexAlign,ComponentV2,TabsController,Tabs,Scroller
} from '@ohos.arkui.component'
import {
  State,
  Watch,Param,
  Link,Monitor,Trace,ObservedV2,Event,Consumer,
  StorageLink,IMonitor,IMonitorValue,Local,Provider
} from '@ohos.arkui.stateManagement'

@Entry
@Component
struct Index {
  @State simpleList: Array<string> = ['one', 'two', 'three'];

  build() {
    Column() {
      Repeat<string>(this.simpleList)
        .each((item: RepeatItem<string>) => {
          Text(item.item)
            .fontSize(9)
            .key(item.item)
        })
        .key((item: string) => item)

      Repeat<string>(this.simpleList)
        .each((item: RepeatItem<string>) => {
          Text(item.item)
            .fontSize(9)
            .key(item.item + item.index )
        })
        .key((item: string, index: int) => {
          return 'same key'; // 定义相同键值
        })
        .virtualScroll({ totalCount: 200 })
    }
    .width('100%')
  }
}