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
  Link,Monitor,Trace,ObservedV2,
  StorageLink,IMonitor,IMonitorValue,Local
} from '@ohos.arkui.stateManagement'

@ObservedV2
class Monitor0300Person {
  @Trace name: string
  @Trace age: int

  constructor(name: string, age: int) {
    this.name = name
    this.age = age
  }
}

@ObservedV2
class Monitor0300Class {
  @Trace person: Monitor0300Person
  @Trace nameChange: string = 'Tom'
  @Trace ageChange: int = 23

  @Monitor(['person.name'])
  onNameChange(monitor: IMonitor) {
    this.nameChange = String(monitor.value<string>()?.now)
    console.log('person.name: ' + this.nameChange)
  }

  @Monitor(['person.age'])
  onAgeChange(monitor: IMonitor) {
    this.ageChange = monitor.value<int>()?.now as Int

    console.log('person.age: ' + this.ageChange)
  }

  constructor(name: string, age: int) {
    this.person = new Monitor0300Person(name, age)
  }
}

@Entry
@ComponentV2
struct Monitor0300 {
  @Local info: Monitor0300Class = new Monitor0300Class('Tom', 23)

  build() {
    Column() {
      Button('Click1')
        .id('btnMonitor03001')
        .onClick(():void => {
          this.info.person = new Monitor0300Person('Jack', 23)
        })
      Button('Click2')
        .id('btnMonitor03002')
        .onClick(():void => {
          this.info.person = new Monitor0300Person('Jack', 18)
        })
      Button('Click3')
        .id('btnMonitor03003')
        .onClick(():void => {
          this.info.person = new Monitor0300Person('Lucy', 30)
        })
      Text(this.info.nameChange).id('tvMonitor03001')
      Text(this.info.ageChange.toString()).id('tvMonitor03002')
    }
  }
}