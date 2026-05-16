'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2
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
  ListItem,GridLayoutOptions,Grid,GridItem,BarState,TextAlign,
  Color,Scroller,Divider,Flex,ChildrenMainSize,ListScroller,
  FlexAlign,ComponentV2,HorizontalAlign
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,Local,Trace,Track,PropRef,Monitor,Computed,Param,Require,IMonitor,
  StorageLink,LocalStorage,UIUtils,Observed,ObservedV2
} from '@ohos.arkui.stateManagement'

@Entry
@ComponentV2
struct makeObserved0100 {
  numbers: String[] = ['0', '1', '2', '4']
  numbers2: String[] = ['0', '1', '2', '3', '4', '5']
  scroller: Scroller = new Scroller()
  layoutOptions1: GridLayoutOptions = UIUtils.makeObserved({
    //不支持修改
    regularSize: [1, 1],
    //只支持[1,1]
    irregularIndexes: [0, 6],
    // 紫引为0和6的GridItem占用一行
    onGetIrregularSizeByIndex: (index: int):[Int, Int] => {
      if (index === 0) {
        return [1, 2] as [int, int]
      }
      return [1, 3] as [int, int]
    }
  } as GridLayoutOptions)
  layoutOptions2: GridLayoutOptions = UIUtils.makeObserved({
    regularSize: [1, 1],
    //只支持[1,1]
    onGetRectByIndex: (index: int):[int, int, int, int] => {
      if (index == 0) {
        return [0, 0, 1, 1] as [int, int, int, int]
      } else if (index == 1) {
        return [0, 1, 2, 2] as [int, int, int, int]
      } else if (index == 2) {
        return [0, 3, 3, 3] as [int, int, int, int]
      } else if (index == 3) {
        return [3, 0, 3, 3] as [int, int, int, int]
      } else if (index == 4) {
        return [4, 3, 2, 2] as [int, int, int, int]
      } else {
        return [5, 5, 1, 1] as [int, int, int, int]
      }
    }
  } as GridLayoutOptions)

  build() {
    Column() {
      Button('change regularSize').onClick(():void => {
        this.layoutOptions1.irregularIndexes = [2, 3]
      }).id('regularSize')
      Button('change onGetRectByIndex').onClick(():void => {
        this.layoutOptions2.onGetRectByIndex = (index: int): [int, int, int, int] => {
          if (index == 0) {
            return [0, 0, 1, 1] as [int, int, int, int]
          } else if (index == 1) {
            return [0, 1, 2, 2] as [int, int, int, int]
          } else if (index == 2) {
            return [0, 3, 1, 1,] as [int, int, int, int]
          } else if (index == 3) {
            return [3, 0, 3, 3] as [int, int, int, int]
          } else if (index == 4) {
            return [4, 3, 2, 1] as [int, int, int, int]
          } else {
            return [5, 5, 1, 1] as [int, int, int, int]
          }
        }
      }).id('onGetRectByIndex')

      Button('change ongetirregularsizeByIndex').onClick(():void => {
        this.layoutOptions1.irregularIndexes = [0, 4]
        this.layoutOptions1.onGetIrregularSizeByIndex = (index: int): [int, int] => {
          if (index === 0) {
            return [1, 3] as [int, int]
          }
          return [1, 2] as [int, int]
        }
      }).id('ongetirregularsizeByIndex')

      Grid(this.scroller, this.layoutOptions1) {
        ForEach(this.numbers, (day: string, index1: int) => {
          ForEach(this.numbers, (day: string, index2: int) => {
            GridItem() {
              Text(day)
                .fontSize(9)
                .backgroundColor('0xF9CF93')
                .width('100%')
                .height('3%')
                .textAlign(TextAlign.Center)
            }.selectable(false).id(`text${index1}${index2}`)
          }, (day: string) => day)
        }, (day: string) => day)
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .multiSelectable(true)
      .scrollBar(BarState.Off)
      .width('90%')
      .backgroundColor('0xFAEEE0')
      .layoutWeight(0.5)

      Grid(undefined, this.layoutOptions2) {
        ForEach(this.numbers2, (day: string) => {
          GridItem() {
            Text(day)
              .fontSize(9)
              .backgroundColor('0xF9CF93')
              .height('3%')
              .textAlign(TextAlign.Center)
          }
          .height('100%')
          .width('100%')
        }, (day: string) => day)
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr 1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .width('90%')
      .backgroundColor('0xFAEEEE0')
      .layoutWeight(0.5)

    }.width('100%')
  }
}