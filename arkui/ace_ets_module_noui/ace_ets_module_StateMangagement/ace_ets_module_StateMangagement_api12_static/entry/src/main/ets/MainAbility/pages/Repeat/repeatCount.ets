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
ListItem,Image,Stack,Repeat,Swiper,
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
class ArrayCount {
  @Trace arr: Array<number> = [];

  // constructor，用于初始化数组个数
  constructor(count: number) {
    for (let i = 0; i < count; i++) {
      this.arr.push(i);
    }
  }
}

@Entry
@ComponentV2
export struct totalCountRepeat {
  @Local ArrayCount: ArrayCount = new ArrayCount(10);
  @Local totalCount: int = this.ArrayCount.arr.length;
  scroller: Scroller = new Scroller();

  private start: int = 1;
  private end: int = 1;

  build() {
    Column() {
      List({ initialIndex: 3, scroller: this.scroller }) {
        Repeat<number>(this.ArrayCount.arr)
          .virtualScroll({ totalCount: this.totalCount })
          .templateId((item, index:int ) => {
            return 'number';
          })
          .template('number', (r) => {
            ListItem() {
              Text(r.index! + ":" + r.item + "Reuse");
            }
          })
          .each((r) => {
            ListItem() {
              Text(r.index! + ":" + r.item + "eachMessage");
            }
          })
      }
      .onScrollIndex((start: int, end: int):void => {
        this.start = start;
        this.end = end;
      })
      .height('30%')

      Button(`insert totalCount ${this.totalCount}`)
        .id('total_count')
        .height('3%')
        .onClick(():void => {
          // 插入元素，元素位置为屏幕显示的前一个元素
          this.ArrayCount.arr.splice(2, 0, this.totalCount);
          let rect = this.scroller.getItemRect(this.start); // 获取子组件的大小位置
          this.scroller.scrollToIndex(this.start + 1); // 滑动到指定index
          this.scroller.scrollBy(0, -rect.y); // 滑动指定距离
          this.totalCount = this.ArrayCount.arr.length;
        })
    }
    .width('100%')
  }
}