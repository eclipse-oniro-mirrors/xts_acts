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
  Color,HorizontalAlign,Scroller,
  FlexAlign,ComponentV2,TabsController,Tabs
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,Local,Computed,Monitor,IMonitor,
  StorageLink,ObservedV2,Trace,Param,Event
} from '@ohos.arkui.stateManagement'

@Entry
@ComponentV2
struct ForEach010 {
  @Local private dataArr: string[] = []
  private isSwap: boolean = false
  private swapTemp: string = ''
  private swapStartIndex: number = -1
  private swipeStartIndex: int = -1
  private swipeEndIndex: number = -1
  private scroller: Scroller = new Scroller()
  @Local private slideIndex: number = -1

  aboutToAppear(): void {
    for (let index = 0; index < 100; index++) {
      this.dataArr.push('item' + index )
    }
  }

  build() {
    Column() {
      Button('Del item5')
        .id('btnForEach0101')
        .fontSize(9)
        .onClick(():void => {
          this.dataArr.splice(5, 1)
        })
        .height('3%')
      Button('Swipe to index0')
        .id('btnForEach0102')
        .fontSize(9)
        .onClick(():void => {
          let rect = this.scroller.getItemRect(this.swipeStartIndex) // Get child components size and position
          this.scroller.scrollToIndex(0); // Slide to the specified index
          this.scroller.scrollBy(0, -rect.y); // Slide a specified distance
        })
        .height('3%')
      Button('Swipe to index45')
        .id('btnForEach0103')
        .fontSize(9)
        .onClick(():void => {
          let rect = this.scroller.getItemRect(this.swipeStartIndex) // Get child components size and position
          this.scroller.scrollToIndex(45); // Slide to the specified index
          this.scroller.scrollBy(0, -rect.y); // Slide a specified distance
        })
        .height('3%')
      List({scroller: this.scroller}) {
        ForEach(this.dataArr, (item: string, index: int) => {
          ListItem() {
            Text(item)
              .fontSize(9)
          }
          .onClick(():void => {
            if (!this.isSwap) {
              this.isSwap = !this.isSwap
              this.swapStartIndex = index
              this.swapTemp = item
            } else {
              this.isSwap = !this.isSwap
              this.dataArr[this.swapStartIndex as int] = item
              this.dataArr[index as int ] = this.swapTemp
            }
          })
        }, (item: string) => item)
      }
      .id('listForEach010')
      .height('90%')
      .onScrollIndex((start: int, end: int):void => {
        this.swipeStartIndex = start
        this.swipeEndIndex = end
      })
    }
  }
}