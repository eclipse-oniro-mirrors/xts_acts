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
  List,Swiper,
  ListItem,Divider,Alignment,BarState,RouteType,
  Color,Scroll,PageTransitionEnter,PageTransitionExit,Repeat,SwiperDisplayMode,
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
struct RepeatSwiperNumber {
  @Local simpleList1: Array<number> = [];
  @Local simpleList2: Array<number> = [];
  @Local tmp1: number = 0;
  @Local tmp2: number = 0;
  private swiperController: SwiperController = new SwiperController()
  private swiperController1: SwiperController = new SwiperController()

  aboutToAppear(): void {
    for (let i = 0; i < 10; i++) {
      this.simpleList1.push(i);
      this.simpleList2.push(i);
    }
  }

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Text('Non-VirtualScroll场景 父容器Swiper组件')
        .fontSize(15)
        .fontColor(Color.Gray)
      Swiper(this.swiperController) {
        Repeat<number>(this.simpleList1)
          .each((ri1) => {
            Text(ri1.item.toString() + ' index:' + ri1.index.toString() + ':' + this.tmp2.toString())
              .id('Text1SN' + ri1.index.toString())
              .fontSize(20)
              .height('30%')
              .border({ width: 1 })
              .backgroundColor(Color.Pink)
          })
          .key((service: number, index: int): string => index + service.toString())
      }
      .loop(false)
      .displayMode(SwiperDisplayMode.STRETCH)
      .nextMargin(30, true)
      .displayCount(3)
      .autoPlay(false,undefined)
      .interval(1000)
      .width('90%')
      .height('40%')
      .border({ width: 1 })

      Row() {
        Button('next1 page').id('Button1_SN')
          .onClick(():void => {
            this.swiperController.showNext()
          })
        Button('next2 page')
          .id('Button2_SN')
          .onClick(():void => {
            this.swiperController1.showNext()
            this.tmp2 = 99
          })
      }

      Text('Has-VirtualScroll场景 Swiper组件')
        .fontSize(15)
        .fontColor(Color.Gray)
      Swiper(this.swiperController1) {
        Repeat<number>(this.simpleList2)
          .each((ri2) => {
            Text(ri2.item.toString() + ' index:' + ri2.index.toString() + ':' + this.tmp2.toString())
              .id('Text2SN' + ri2.index.toString())
              .fontSize(20)
              .height('30%')
              .border({ width: 1 })
              .backgroundColor(Color.Green)
          })
          .key((service: number, index: int): string => index + service.toString())
          .templateId((item, index:int ) => {
            if (index > 6) {
              return 'number'
            } else {
              return 'each'
            }
          })
          .template('number', (r) => {
            Text(r.item.toString() + ' index:' + r.index.toString() + ':' + this.tmp2.toString())
              .id('Text2SN' + r.index.toString())
              .fontSize(20)
              .height('30%')
              .border({ width: 1 })
              .backgroundColor(Color.Green)
          })
          .virtualScroll()
      }
      .loop(false)
      .displayMode(SwiperDisplayMode.STRETCH)
      .nextMargin(30, true)
      .displayCount(3)
      .autoPlay(false,undefined)
      .interval(1000)
      .width('90%')
      .height('40%')
      .border({ width: 1 })

    }
    .width('100%')
    .height('60%')
    .justifyContent(FlexAlign.Center)
  }
}
