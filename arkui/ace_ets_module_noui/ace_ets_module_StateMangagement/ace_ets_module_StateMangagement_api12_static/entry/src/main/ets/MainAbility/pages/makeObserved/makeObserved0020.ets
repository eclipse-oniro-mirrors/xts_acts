'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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
  ListItem,FlexWrap,
  Color,Scroller,Divider,Flex,
  FlexAlign,ComponentV2,HorizontalAlign
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,Local,Trace,Track,PropRef,
  StorageLink,LocalStorage,UIUtils,Observed,ObservedV2
} from '@ohos.arkui.stateManagement'
import {
  LengthMetrics
} from '@ohos.arkui.node'
import collections from '@arkts.collections'

class Info {
  public id: number = 0;

  constructor(id: number) {
    this.id = id;
  }
}

@Entry
@ComponentV2
struct makeObserved0020 {
  scroller: Scroller = new Scroller();
  // @Local arrCollect: collections.Array<Info> =
  //   UIUtils.makeObserved(new collections.Array<Info>(new Info(1), new Info(2)));

  build() {
    Column() {
    //   ForEach(this.arrCollect as object as Array<Info>, (item: Info, index: number) => {
    //     Text(`${item.id}`)
    //       .height('3%')
    //       .fontSize(9)
    //       .onClick(():void => {
    //         item.id++;
    //       }).id(`text${index}`)
    //   }, (item: Info, index:number) => item.id.toString() + index.toString())
    //   Divider()
    //     .color('blue')
    //   if (this.arrCollect.length > 0) {
    //     Text(`${this.arrCollect[this.arrCollect.length - this.arrCollect.length].id}`).id('firstText')
    //       .height('3%')
    //       .fontSize(9)
    //     Text(`${this.arrCollect[this.arrCollect.length - 1].id}`).id('LastText')
    //       .height('3%')
    //       .fontSize(9)
    //   }
    //   Divider()
    //     .color('blue')
    //   Flex({ wrap: FlexWrap.Wrap, space: { main: LengthMetrics.px(10) } }) {
    //     Button('push')
    //       .onClick(():void => {
    //         this.arrCollect.push(new Info(30));
    //       })
    //       .id('push')
    //       .width('10%')
    //       .height('3%')
    //       .fontSize(9)
    //     Button('pop')
    //       .onClick(():void => {
    //         this.arrCollect.pop();
    //       })
    //       .id('pop')
    //       .width('10%')
    //       .height('3%')
    //       .fontSize(9)
    //     Button('shift')
    //       .onClick(():void => {
    //         this.arrCollect.shift();
    //       })
    //       .id('shift')
    //       .width('10%')
    //       .height('3%')
    //       .fontSize(9)
    //     Button('unshift')
    //       .onClick(():void => {
    //         this.arrCollect.unshift(new Info(50));
    //       })
    //       .id('unshift')
    //       .width('10%')
    //       .height('3%')
    //       .fontSize(9)
    //     Button('splice')
    //       .onClick(():void => {
    //         this.arrCollect.splice(1);
    //       })
    //       .id('splice')
    //       .width('10%')
    //       .height('3%')
    //       .fontSize(9)
    //     Button('shrinkTo')
    //       .width('10%')
    //       .height('3%')
    //       .fontSize(9)
    //       .onClick(():void => {
    //         this.arrCollect.unshift(new Info(40));
    //         this.arrCollect.shrinkTo(1);
    //       })
    //       .id('shrinkTo')
    //     Button('extendTo')
    //       .width('10%')
    //       .height('3%')
    //       .fontSize(9)
    //       .onClick(():void => {
    //         this.arrCollect.extendTo(6, new Info(20));
    //       })
    //       .id('extendTo')
    //     Divider()
    //       .color('blue')
    //     Button('sort')
    //       .width('10%')
    //       .height('3%')
    //       .fontSize(9)
    //       .onClick(():void => {
    //         this.arrCollect.sort((a: Info, b: Info) => a.id - b.id);
    //       })
    //       .id('sort')
    //     Button('fill')
    //       .width('10%')
    //       .height('3%')
    //       .fontSize(9)
    //       .onClick(():void => {
    //         this.arrCollect.fill(new Info(5), 0, 2);
    //       })
    //       .id('fill')
    //     Button('slice')
    //       .width('10%')
    //       .height('3%')
    //       .fontSize(9)
    //       .onClick(():void => {
    //         this.arrCollect = UIUtils.makeObserved(this.arrCollect.slice(0, 4));
    //       })
    //       .id('slice')
    //     Button('map')
    //       .width('10%')
    //       .height('3%')
    //       .fontSize(9)
    //       .onClick(():void => {
    //         this.arrCollect = UIUtils.makeObserved(this.arrCollect.map((value) => {
    //           value.id += 15;
    //           return value;
    //         }))
    //       })
    //       .id('map')
    //     Button('filter')
    //       .width('10%')
    //       .height('3%')
    //       .fontSize(9)
    //       .onClick(():void => {
    //         this.arrCollect = UIUtils.makeObserved(this.arrCollect.filter((value: Info) => value.id % 2 === 0));
    //       })
    //       .id('filter')
    //
    //     Button('concat')
    //       .width('10%')
    //       .height('3%')
    //       .fontSize(9)
    //       .onClick(():void => {
    //         let array1 = new collections.Array(new Info(100))
    //         this.arrCollect = UIUtils.makeObserved(this.arrCollect.concat(array1));
    //       })
    //       .id('concat')
    //   }.height('100%')
    //
    }
    .height('100%')
    .width('100%')
  }
}
