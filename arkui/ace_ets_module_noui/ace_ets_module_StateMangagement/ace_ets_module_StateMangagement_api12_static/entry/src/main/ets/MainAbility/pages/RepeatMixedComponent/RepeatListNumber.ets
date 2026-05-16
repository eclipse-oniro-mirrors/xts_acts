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
  ListItem,Divider,Alignment,BarState,RouteType,
  Color,Scroll,PageTransitionEnter,PageTransitionExit,Repeat,
  FlexAlign,ComponentV2,TabsController,Tabs,Scroller,SwiperController,ColumnOptions,Grid
} from '@ohos.arkui.component'
import {
  State,Provider,
  Watch,Param,Observed,
  Link,Monitor,Trace,ObservedV2,Event,Consumer,
  StorageLink,IMonitor,IMonitorValue,Local
} from '@ohos.arkui.stateManagement'
@Entry
@ComponentV2
struct RepeatListNumber {
  @Local simpleList1: Array<number> = [];
  @Local simpleList2: Array<number> = [];
  @Local tmp1: number = 0;
  @Local tmp2: number = 0;
  scroller: Scroller = new Scroller();
  scroller1: Scroller = new Scroller();

  aboutToAppear(): void {
    for (let i = 0; i < 30; i++) {
      this.simpleList1.push(i);
      this.simpleList2.push(i);
    }
  }

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Text('Non-VirtualScroll场景 父容器List组件')
        .fontSize(15)
        .fontColor(Color.Gray)
      List({ space: 5, scroller: this.scroller }) {
        Repeat<number>(this.simpleList1)
          .each((ri) => {
            ListItem() {
              Text('non vs ' + ri.item + ' index:' + ri.index.toString() + ':' + this.tmp2.toString())
                .id('Text1_LN' + ri.index.toString())
                .fontSize(20)
                .height('20%')
            }
          })
          .key((service: number, index: int): string => index + service.toString())
      }
      .cachedCount(2)
      .height('40%')
      .border({ width: 1 })

      Row() {
        Button('next1 page').id('Button1_LN')
          .onClick(():void => {
            this.scroller.scrollToIndex(15);
          })

        Button('next2 page').id('Button2_LN')
          .onClick(():void => {
            this.scroller1.scrollToIndex(15);
            this.tmp2 = 100
          })
      }

      Text('VirtualScroll场景 父容器List组件')
        .fontSize(15)
        .fontColor(Color.Gray)
      List({ space: 5, scroller: this.scroller1 }) {
        Repeat<number>(this.simpleList2)
          .each((ri) => {
            ListItem() {
              Text('has vs ' + ri.item + ' index:' + ri.index.toString() + ':' + this.tmp2.toString())
                .id('Text2_LN' + ri.index.toString())
                .fontSize(20)
                .height('20%')
            }
          })
          .key((service: number, index: int): string => index + service.toString())
          .templateId((item, index:int ) => {
            if (index > 15) {
              return 'number'
            } else {
              return 'each'
            }
          })
          .template('number', (r) => {
            ListItem() {
              Text('has vs ' + r.item + ' index:' + r.index.toString() + ':' + this.tmp2.toString())
                .id('Text2_LN' + r.index.toString())
                .fontSize(20)
                .height('20%')
            }
          })
          .virtualScroll()
      }
      .cachedCount(2)
      .height('40%')
      .border({ width: 1 })

    }
    .width('100%')
    .height('50%')
    .justifyContent(FlexAlign.Center)
  }
}
