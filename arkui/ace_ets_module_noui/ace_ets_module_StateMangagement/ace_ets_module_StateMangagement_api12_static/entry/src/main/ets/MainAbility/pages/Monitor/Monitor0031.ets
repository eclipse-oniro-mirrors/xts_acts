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
// import prompt from '@system.prompt';
import { PromptAction } from '@ohos.arkui.UIContext';
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
  Link,Monitor,Trace,ObservedV2,
  StorageLink,IMonitor,IMonitorValue,Local
} from '@ohos.arkui.stateManagement'


let prompt= new PromptAction()

@ObservedV2
class Monitor0031Class {
  @Trace name: string = 'Tom'
  @Monitor(['name'])
  onNameChange(monitor: IMonitor) {
    prompt.showToast({ message: `name: ${monitor.value<Any>()?.now}`, duration: 2000 })
  }
}

@Entry
@ComponentV2
struct Monitor0031 {
  cls: Monitor0031Class = new Monitor0031Class()

  build() {
    Column() {
      Button(`Change Name ${this.cls.name}`)
        .id('btnMonitor0031')
        .onClick(():void=>{
          this.cls.name = 'Jack'
        })
    }
  }
}