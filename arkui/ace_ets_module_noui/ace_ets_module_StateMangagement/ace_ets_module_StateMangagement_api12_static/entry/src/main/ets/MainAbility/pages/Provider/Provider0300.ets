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
  Watch,Param,Consumer,Provider,
  Link,Monitor,Trace,ObservedV2,Event,Consumer,
  StorageLink,IMonitor,IMonitorValue,Local
} from '@ohos.arkui.stateManagement'

enum Provider0030Enum {
  PA = 'PA',
  PB = 'PB'
}

@ObservedV2
class Provider0030Class {
  @Trace age: number = 0
}

@ComponentV2
struct ChildProvider0300 {
  @Consumer('classValue') classValue: Provider0030Class = new Provider0030Class()
  @Consumer('numberValue') numberValue: number = -1
  @Consumer('booleanValue') booleanValue: boolean = true
  @Consumer('stringValue') stringValue: string = 'world'
  @Consumer('objectValue') objectValue: Object = 'world'
  @Consumer('arrValue') arrValue: number[] = []
  @Consumer('dateValue') dateValue: Date = new Date(2024, 1, 1, 8, 30, 33)
  @Consumer('mapValue') mapValue: Map<string, number> = new Map<string, number>()
  @Consumer('setValue') setValue: Set<number> = new Set<number>()
  @Consumer('enumValue') enumValue: Provider0030Enum = Provider0030Enum.PB

  build() {
    Column() {
      Text(this.classValue.age.toString()).id('tvChildProvider0300Class')
      Text(this.numberValue.toString()).id('tvChildProvider0300Number')
      Text(this.booleanValue.toString()).id('tvChildProvider0300Boolean')
      Text(this.stringValue).id('tvChildProvider0300String')
      Text(this.objectValue.toString()).id('tvChildProvider0300Object')
      Text(this.arrValue[this.arrValue.length - 1].toString()).id('tvChildProvider0300Arr')
      Text(this.dateValue.toTimeString()).id('tvChildProvider0300Date')
      Text(this.mapValue.get('mapKey')?.toString()).id('tvChildProvider0300Map')
      Text(Array.from(this.setValue.values()).toString()).id('tvChildProvider0300Set')
      Text(this.enumValue).id('tvChildProvider0300Enum')
    }
  }
}

@Entry
@ComponentV2
struct Provider0300 {
  @Provider('classValue') classValue: Provider0030Class = new Provider0030Class()
  @Provider('numberValue') numberValue: number = 0
  @Provider('booleanValue') booleanValue: boolean = false
  @Provider('stringValue') stringValue: string = 'hello'
  @Provider('objectValue') objectValue: Object = 'hello'
  @Provider('arrValue') arrValue: number[] = [1, 2, 3]
  @Provider('dateValue') dateValue: Date = new Date(2024, 8, 8, 8, 8, 8)
  @Provider('mapValue') mapValue: Map<string, number> = new Map<string, number>()
  @Provider('setValue') setValue: Set<number> = new Set<number> ([0, 1, 0])
  @Provider('enumValue') enumValue: Provider0030Enum = Provider0030Enum.PA

  aboutToAppear(): void {
    this.mapValue.set('mapKey', 10)
  }

  build() {
    Column() {
      Button('ChangeMsg')
        .id('btnProvider0300ChangeMsg')
        .onClick(():void => {
          this.classValue.age += 10
          this.numberValue += 10
          this.booleanValue = !this.booleanValue
          this.stringValue += 'world'
          this.objectValue += 'world'
          this.arrValue.push(10)
          this.dateValue.setTime(this.dateValue.getTime() + 1000)
          this.mapValue.set('mapKey', 100)
          this.setValue.add(2)
          this.enumValue = Provider0030Enum.PB
        })
      ChildProvider0300()
    }
  }
}