/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { collections } from '@kit.ArkTS';
import { UIUtils } from '@kit.ArkUI';
import { LengthMetrics } from '@kit.ArkUI';


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
    onGetIrregularSizeByIndex: (index: number) => {
      if (index === 0) {
        return [1, 2]
      }
      return [1, 3]
    }
  })
  layoutOptions2: GridLayoutOptions = UIUtils.makeObserved({
    regularSize: [1, 1],
    //只支持[1,1]
    onGetRectByIndex: (index: number) => {
      if (index == 0) {
        return [0, 0, 1, 1]
      } else if (index == 1) {
        return [0, 1, 2, 2]
      } else if (index == 2) {
        return [0, 3, 3, 3]
      } else if (index == 3) {
        return [3, 0, 3, 3]
      } else if (index == 4) {
        return [4, 3, 2, 2]
      } else {
        return [5, 5, 1, 1]
      }
    }
  })

  build() {
    Column() {
      Button('change regularSize').onClick(() => {
        this.layoutOptions1.irregularIndexes = [2, 3]
      }).id('regularSize')
      Button('change onGetRectByIndex').onClick(() => {
        this.layoutOptions2.onGetRectByIndex = (index: number): [number, number, number, number] => {
          if (index == 0) {
            return [0, 0, 1, 1]
          } else if (index == 1) {
            return [0, 1, 2, 2]
          } else if (index == 2) {
            return [0, 3, 1, 1,]
          } else if (index == 3) {
            return [3, 0, 3, 3]
          } else if (index == 4) {
            return [4, 3, 2, 1]
          } else {
            return [5, 5, 1, 1]
          }
        }
      }).id('onGetRectByIndex')

      Button('change ongetirregularsizeByIndex').onClick(() => {
        this.layoutOptions1.irregularIndexes = [0, 4]
        this.layoutOptions1.onGetIrregularSizeByIndex = (index: number): [number, number] => {
          if (index === 0) {
            return [1, 3]
          }
          return [1, 2]
        }
      }).id('ongetirregularsizeByIndex')

      Grid(this.scroller, this.layoutOptions1) {
        ForEach(this.numbers, (day: string, index1: number) => {
          ForEach(this.numbers, (day: string, index2: number) => {
            GridItem() {
              Text(day)
                .fontSize(9)
                .backgroundColor(0xF9CF93)
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
      .backgroundColor(0xFAEEE0)
      .layoutWeight(0.5)

      Grid(undefined, this.layoutOptions2) {
        ForEach(this.numbers2, (day: string) => {
          GridItem() {
            Text(day)
              .fontSize(9)
              .backgroundColor(0xF9CF93)
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
      .backgroundColor(0xFAEEEE0)
      .layoutWeight(0.5)

    }.width('100%')
  }
}