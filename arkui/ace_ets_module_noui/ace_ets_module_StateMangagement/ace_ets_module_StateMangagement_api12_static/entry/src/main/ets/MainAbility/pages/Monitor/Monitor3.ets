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
import { TestSample } from './Monitor1'
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

let testSample = new TestSample()

@ObservedV2
class Person {
  @Trace name: string
  @Trace age: number

  constructor(name: string, age: number) {
    this.name = name
    this.age = age
  }
}

@ObservedV2
class InfoList {
  @Trace personArr: Person[] = [new Person('Tom', 25), new Person('Jack', 26)]
  @Trace dimensionTwo: number[][] = [[0, 0, 0], [1, 1, 1], [2, 2, 2]]
  @Trace dimensionThree: number[][][] = [[[0], [0], [0]], [[1], [1], [1]], [[2], [2], [2]]]

  @Monitor(['personArr.0.name'])
  onArray1Change(monitor: IMonitor) {
    testSample.res1 = "测试1：Success"
  }

  @Monitor(['dimensionTwo.0.0'])
  onArray2Change(monitor: IMonitor) {
    testSample.res2 = '测试2：Success'
  }

  @Monitor(['dimensionThree.0.0.0'])
  onArray3Change(monitor: IMonitor) {
    testSample.res3 = '测试3：Success'
  }
}

@Entry
@Component
struct Monitor3 {
  @State message: string = 'Hello World'
  infoList: InfoList = new InfoList()

  build() {
    Row() {
      Column() {

        Button(testSample.res1)
          .id('Monitor3_1')
          .onClick(():void => {
            this.infoList.personArr[0].name += '0'
          })
        Button(testSample.res2)
          .id('Monitor3_2')
          .onClick(():void => {
            this.infoList.dimensionTwo[0][0]++
          })
        Button(testSample.res3)
          .id('Monitor3_3')
          .onClick(():void => {
            this.infoList.dimensionThree[0][0][0]++
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}