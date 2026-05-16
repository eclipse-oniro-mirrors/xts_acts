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
  ListItem,Divider,Alignment,BarState,RouteType,Repeat,RepeatItem,
  Color,Scroll,PageTransitionEnter,PageTransitionExit,
  FlexAlign,ComponentV2,TabsController,Tabs
} from '@ohos.arkui.component'
import {
  State,Provider,
  Watch,Param,Observed,
  Link,Monitor,Trace,ObservedV2,Event,Consumer,
  StorageLink,IMonitor,IMonitorValue,Local
} from '@ohos.arkui.stateManagement'

//测试：Repeat组件包含if/else混用场景
@Observed
class RepeatObject {
  public id: number;
  public name: string;

  constructor(id: number, name: string) {
    this.id = id;
    this.name = name;
  }
}

@Entry
@ComponentV2
struct RepeatIfElseObject {
  @Local simpleList: Array<RepeatObject> = [];
  @Local flag: boolean = true;

  aboutToAppear(): void {
    for (let i = 0; i < 100; i++) {
      this.simpleList.push(new RepeatObject(i, 'RepeatObject' + i))
    }
  }

  build() {
    Column() {
      Button('switch mode')
        .onClick(():void => {
          this.flag = !this.flag
        })
      List() {
        Repeat<RepeatObject>(this.simpleList)
          .each((obj: RepeatItem<RepeatObject>) => {
            ListItem() {
              Text('item id = ' + obj.item).id('repeat1_IO' + `${obj.index}`)
                .fontSize(9)
            }
          })
          .key((item: RepeatObject, index: int) => {
            return item + '';
          })
          .virtualScroll({ totalCount: this.simpleList.length })
          .templateId((item: RepeatObject, index: int) => 'default')
          .template('default', (ri) => {
            if (this.flag && ri.item.id % 2 == 0) {
              ListItem() {
                Column() {
                  Text(`item id ${ri.index} = ` + ri.item.name).id('repeat2_IO' + `${ri.index}`)
                    .fontSize(9)
                    .fontColor(Color.Gray)
                }
              }
            } else {
              ListItem() {
                Column() {
                  Text(`item id ${ri.index} = ` + ri.item.name).id('repeat3_IO' + `${ri.index}`)
                    .fontSize(9)
                    .fontColor(Color.Red)
                }
              }
            }
          }, { cachedCount: 3 })
      }
      .cachedCount(1)
      .border({ width: 1 })
      .width('90%')
      .layoutWeight(1)
    }
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}