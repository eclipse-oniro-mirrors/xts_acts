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
  ListItem,Divider,Alignment,BarState,RouteType,Repeat,ListItemGroup,
  Color,Scroll,PageTransitionEnter,PageTransitionExit,
  FlexAlign,ComponentV2,TabsController,Tabs
} from '@ohos.arkui.component'
import {
  State,Provider,
  Watch,Param,
  Link,Monitor,Trace,ObservedV2,Event,Consumer,
  StorageLink,IMonitor,IMonitorValue,Local
} from '@ohos.arkui.stateManagement'

//测试：Repeat嵌套场景
@ObservedV2
class OuterObject {
  public id: number
  public inner: InnerObject

  constructor(id: number, inner: InnerObject) {
    this.id = id
    this.inner = inner
  }
}

@ObservedV2
class InnerObject {
  @Trace
  public id: number
  public name: string

  constructor(id: number, name: string) {
    this.id = id
    this.name = name
  }
}


@Entry
@ComponentV2
struct RepeatNestObject {
  @Local outerList: Array<OuterObject> = []

  aboutToAppear(): void {
    for (let i = 0; i < 2; i++) {
      this.outerList.push(new OuterObject(i, new InnerObject(i, 'inner_' + i.toString())))
    }

  }

  build() {
    Column() {
      List() {
        Repeat<OuterObject>(this.outerList)
          .each((obj) => {
            ListItemGroup() {
              ListItem() {
                Text('outerList Item: ' + obj.item.id).id('repeat1_one_' + obj.index.toString())
                  .fontSize(9)
              }

              if (obj.item.inner) {
                Repeat<OuterObject>(this.outerList).each((subObj) => {
                  ListItem() {
                    Text('innerList Item:' + subObj.item.inner.id.toString())
                      .id('repeat2_two_' + subObj.index.toString())
                      .fontSize(9)
                  }
                }).key((item) => {
                  return 'innerList_' + (item.toString());
                })
              }
            }
          })
          .key((item) => 'outerList_' + item)
      }
      .width('95%')
      .border({ width: 1 })

      Button('Click me').id('Button1')
        .onClick(():void => {
          this.outerList[0].inner.id = 96;
          this.outerList[1].inner.id = 97;

        })
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')

  }
}

