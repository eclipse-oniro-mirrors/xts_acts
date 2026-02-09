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
//多次改变同一个被@Monitor监听的属性，以最后一次修改为准
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
  Color,
  FlexAlign,ComponentV2,TabsController,Tabs
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,Local,IMonitor,Monitor,
  StorageLink,ObservedV2,Trace,Param,Event
} from '@ohos.arkui.stateManagement'
@ObservedV2
class Frequence {
  @Trace count: number = 0;
  @Monitor(['count'])
  onCountChange(monitor: IMonitor) {
    console.log(`count change from ${monitor.value<Any>()?.before} to ${monitor.value<Any>()?.now}`);
  }
}
@Entry
@ComponentV2
struct changesMonitor {
  frequence: Frequence = new Frequence();
  build() {
    Column() {
      Text(`count ${this.frequence.count}`).id('nums_count')
      Button('change count to 1000').id('btn_count')
        .onClick(():void => {
          for (let i = 1; i <= 1000; i++) {
            this.frequence.count = i;
          }
        })
    }
  }
}