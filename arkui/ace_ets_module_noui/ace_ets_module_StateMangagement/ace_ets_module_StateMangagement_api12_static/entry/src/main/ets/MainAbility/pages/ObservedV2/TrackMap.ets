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
  ListItem,
  Color,Divider,
  FlexAlign,ComponentV2,TabsController,Tabs
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,Local,IMonitor,Monitor,
  StorageLink,ObservedV2,Trace,Param,Event
} from '@ohos.arkui.stateManagement'

@ObservedV2
class InfoC {
  @Trace memberMap: Map<number, string> = new Map<number, string>([[0, "a"], [1, "b"], [3, "c"]]);
}

@Entry
@Component
struct TrackMap {
  info: InfoC = new InfoC();

  build() {
    Row() {
      Column() {
        ForEach(Array.from(this.info.memberMap.entries()), (item: [number, string]) => {
          Text(`${item[0]}`)
            .id(`TrackMap_${item[0]}A`)
            .fontSize(9)
          Text(`${item[1]}`)
            .fontSize(9)
          Divider()
        })
        Button('init map')
          .onClick(():void => {
            this.info.memberMap = new Map<number, string>([[0, "a"], [1, "b"], [3, "c"]]);
          })
        Button('set new one')
          .id('TrackMap_aA')
          .onClick(():void => {
            this.info.memberMap.set(4, "d");
          })
        Button('clear')
          .onClick(():void => {
            this.info.memberMap.clear();
          })
        Button('set the key: 0')
          .onClick(():void => {
            this.info.memberMap.set(0, "aa");
          })
        Button('delete the first one')
          .onClick(():void => {
            this.info.memberMap.delete(0);
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}