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
  Color,ColumnOptions,RepeatItem,Repeat,
  FlexAlign,ComponentV2,TabsController,Tabs,Scroller
} from '@ohos.arkui.component'
import {
  State,
  Watch,Param,
  Link,Monitor,Trace,ObservedV2,Event,Consumer,
  StorageLink,IMonitor,IMonitorValue,Local,Provider
} from '@ohos.arkui.stateManagement'

@ObservedV2
class RepeatClass0040 {
  @Trace private _name: string

  public set name(value: string) {
    this._name = value
  }

  public get name(): string {
    return this._name
  }

  constructor(name: string) {
    this._name = name
  }

}

@Entry
@ComponentV2
struct Repeat0040 {
  @Local private dataArr: Array<RepeatClass0040>  = [new RepeatClass0040('one'), new RepeatClass0040('two'), new RepeatClass0040('three')] as Array<RepeatClass0040>

  build() {
    Column() {
      Button('Refresh')
        .id('btnRefreshRepeat0040')
        .fontSize(9)
        .height('3%')
        .onClick(():void=>{
          this.dataArr = [new RepeatClass0040('one'), new RepeatClass0040('two'), new RepeatClass0040('three')]
        })
      Button('Del Two')
        .id('btnRepeat00401')
        .fontSize(9)
        .onClick(():void => {
          this.dataArr.splice(1, 1)
        })
        .height('3%')
      Button('Del Two, Add Me')
        .id('btnRepeat00402')
        .fontSize(9)
        .onClick(():void => {
          this.dataArr.splice(1, 1)
          this.dataArr.push(new RepeatClass0040('我'))
        })
        .height('3%')
      Button('Reset index2')
        .id('btnRepeat00403')
        .fontSize(9)
        .onClick(():void => {
          this.dataArr[2] = new RepeatClass0040('six')
        })
        .height('3%')
      Button('Add Five')
        .id('btnRepeat00404')
        .fontSize(9)
        .onClick(():void => {
          this.dataArr.push(new RepeatClass0040('five'))
        })
        .height('3%')
      List() {
        Repeat<RepeatClass0040>(this.dataArr)
          .each((item: RepeatItem<RepeatClass0040>):void => {
            Text(item.item.name)
              .fontSize(9)
          })
          .key((item: RepeatClass0040) => item.name)
          .virtualScroll({ disableVirtualScroll: true })
      }
      .id('listRepeat0040')
      .height('90%')
    }
  }
}