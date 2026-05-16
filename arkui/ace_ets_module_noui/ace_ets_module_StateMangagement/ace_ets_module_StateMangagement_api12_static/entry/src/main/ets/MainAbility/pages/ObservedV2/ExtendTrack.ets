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
class Father1{
  @Trace name:string = "Tom"
}
class Son1 extends Father1{}
@Entry
@Component
struct ExtendTrack{
  son : Son1  = new Son1()
  build() {
    Column() {
      Text(`${this.son.name}`)
        .id('ExtendTrack_1A')
        .onClick(():void=>{
          this.son.name = "Jack"
        })
    }
    .width('100%')
  }
}