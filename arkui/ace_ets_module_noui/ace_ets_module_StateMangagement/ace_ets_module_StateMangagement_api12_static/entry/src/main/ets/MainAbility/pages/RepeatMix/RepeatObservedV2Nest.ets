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
  ListItem,Divider,Alignment,BarState,RouteType,Repeat,RepeatItem,TextAlign,
  Color,Scroll,PageTransitionEnter,PageTransitionExit,
  FlexAlign,ComponentV2,TabsController,Tabs
} from '@ohos.arkui.component'
import {
  State,Provider,
  Watch,Param,
  Link,Monitor,Trace,ObservedV2,Event,Consumer,
  StorageLink,IMonitor,IMonitorValue,Local
} from '@ohos.arkui.stateManagement'

//测试：Repeat组件和@ObservedV2和@Trace装饰器混用场景

@ObservedV2
class OuterClass {
  @Trace public msg: InnerClass;

  constructor(msg: InnerClass) {
    this.msg = msg;
  }
}

@ObservedV2
class InnerClass {
  @Trace
  public id: number
  @Trace
  public name: string

  constructor(id: number, name: string) {
    this.id = id;
    this.name = name;
  }
}

@Entry
@ComponentV2
struct RepeatObservedV2Nest {
  @Local arr: Array<OuterClass> = [];

  aboutToAppear(): void {
    for (let i = 0; i < 30; i++) {
      this.arr.push(new OuterClass(new InnerClass(i, 'innerObject' + i)))
    }
  }

  build() {
    Column() {

      Button('click to change No.2 data to 100').id('button2')
        .onClick(():void => {
          this.arr[2].msg.name = '100';
        })
      List() {
        Repeat<OuterClass>(this.arr)
          .each((ri: RepeatItem<OuterClass>) => {
            ListItem() {
              Text(ri.item.msg.name)
                .fontSize(9)
                .textAlign(TextAlign.Center)
                .size({ height: 100, width: '100%' })
                .onClick(():void => {
                  this.arr[ri.index as int].msg.name = '10000';
                })
                .id('repeat1_V2N' + ri.index )
            }
            .borderRadius(10)
            .backgroundColor('#FFF')
          })
          .key((item) => {
            return item.msg.name;
          })
      }
      .width('100%')
      .layoutWeight(1)
      .backgroundColor('#DCDCDC')

    }
  }
}