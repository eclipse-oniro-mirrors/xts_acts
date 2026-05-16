'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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


import { Entry, Component, Column, Scroller, GridItem,Text,TextAlign, ForEach, BarState, Grid, GridLayoutOptions, ColumnOptions, Margin } from '@ohos.arkui.component'
import { State,AppStorage } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct GridIrregular1 {
  @State Number01: String[] = ['0', '1', '2', '3', '4'] as String[];
  scroller: Scroller = new Scroller();
  layoutOptions2: GridLayoutOptions = {
    regularSize: [1, 1],
    irregularIndexes: [1],
    onGetIrregularSizeByIndex: (index: int) => {
      if (index === 1) {
        return [1, 5] as [int, int];
      }
      return [1, index % 6 + 1] as [int, int];
    }
  } as GridLayoutOptions;

  build() {
    Column({ space: 5 } as ColumnOptions) {
      
      Grid(undefined, this.layoutOptions2) {
        ForEach(this.Number01, (day: string) => {
          ForEach(this.Number01, (day: string) => {
            GridItem() {
              Text(day)
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height(80)
                .textAlign(TextAlign.Center)
                .key('GridIrr' + day)
            }
          }, (day: string) => day)
        }, (day: string) => day)
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .scrollBar(BarState.Off)
      .width(400)
      .backgroundColor(0xFAEEE0)
      .height(300)
      .key('gridIrregular1')
    }.width('100%').margin({ top: 5 } as Margin)
  }
}