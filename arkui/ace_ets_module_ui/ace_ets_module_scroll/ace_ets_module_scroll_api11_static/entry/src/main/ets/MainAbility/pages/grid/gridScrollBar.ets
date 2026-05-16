'use static';
/*
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
import {
  Entry,
  Component,
  Column,
  ColumnOptions,
  Grid,
  Margin,
  ForEach,
  GridItem,
  Text,
  ComputedBarAttribute,
  TextAlign
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct gridScrollBar {
  @State Number1: String[] = ['0', '1', '2', '3', '4'];

  build() {
    Column({ space: 5 } as ColumnOptions) {

      Grid() {
        ForEach(this.Number1, (day: string) => {
          ForEach(this.Number1, (day: string) => {
            GridItem() {
              Text(day)
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height(80)
                .textAlign(TextAlign.Center)
            }
          }, (day: string) => day)
        }, (day: string) => day)
      }
      .key('Grid_scrollbarUpdate_0800')
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .onScrollIndex((first: int): void => {
        console.info(first.toString())
      })
      .onScrollBarUpdate((index: int, offset: number) => {
        return ({ totalOffset: 10, totalLength: 200 } as ComputedBarAttribute)
      })
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height(300)

    }
    .width('100%')
    .margin({ top: 5 } as Margin)
  }
}