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
  Color,HorizontalAlign,
  FlexAlign,ComponentV2,TabsController,Tabs
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,Local,Monitor,IMonitor,
  StorageLink,ObservedV2,Trace,Param,Event
} from '@ohos.arkui.stateManagement'
@ObservedV2
class Monitor0290Class {
  @Trace
  private _name: string

  public set name(value: string) {
    this._name = value
  }

  public get name(): string {
    return this._name
  }

  @Trace
  private _age: number

  public set age(value: number) {
    this._age = value
  }

  public get age(): number {
    return this._age
  }

  constructor(name: string, age: number) {
    this._name = name
    this._age = age
  }

}

@Entry
@ComponentV2
struct Monitor0290 {
  @Local arr1: number[] = [1, 2, 3]
  @Local change1: string = 'hello'
  @Monitor(['arr1.0'])
  onChange1(monitor: IMonitor) {
    this.change1 = 'helloWorld'
  }
  @Local arr2: number[][] = [[1,1,1],[2,2,2],[3,3,3]]
  @Local change2: string = 'hello'
  @Monitor(['arr2.0.0'])
  onChange2(monitor: IMonitor) {
    this.change2 = 'helloWorld'
  }
  @Local arr3: Monitor0290Class[] = [new Monitor0290Class('A', 1)]
  @Local change3: string = 'hello'
  @Monitor(['arr3.0.name'])
  onChange3(monitor: IMonitor) {
    this.change3 = 'helloWorld'
  }
  @Local arr4: Array<Monitor0290Class> = new Array<Monitor0290Class> ()
  @Local change4: string = 'hello'
  @Monitor(['arr4.length'])
  onChange4(monitor: IMonitor){
    this.change4 = 'helloWorld'
  }


  build() {
    Column() {
      Button('Click')
        .id('btnMonitor0290')
        .onClick(():void => {
          this.arr1[0] = 0
          this.arr2[0][0] = 0
          this.arr3[0].name = 'C'
          this.arr4.push(new Monitor0290Class('B', 2))
        })
      Text(this.change1).id('tvMonitor02901')
      Text(this.change2).id('tvMonitor02902')
      Text(this.change3).id('tvMonitor02903')
      Text(this.change4).id('tvMonitor02904')
    }
  }
}