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

import { Entry, Component, Column, Color, ColumnOptions, Grid, ForEach, GridItem, Text, TextAlign, Margin } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct grid_testcase {
  @State Number1: String[] = ['0', '1', '2', '3', '4']
  @State active: boolean = false

  build() {
    Column() {
      // Navigator({ target: "pages/index", type: NavigationType.Back }) {
        Column({ space: 5 } as ColumnOptions) {
          Grid() {
            ForEach(this.Number1, (day: string) => {
              ForEach(this.Number1, (day: string) => {
                GridItem() {
                  Text(day)
                    .fontSize(16)
                    .backgroundColor(0xF9CF93)
                    .width('100%')
                    .height('100%')
                    .textAlign(TextAlign.Center)
                }
              }, (day: string) => day)
            }, (day: string) => day)
          }
          .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
          .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
          .columnsGap(10)
          .rowsGap(10)
          .width('90%')
          .backgroundColor(0xFAEEE0)
          .height(300)
          .key('Grid')
        }.width('100%').margin({ top: 5 } as Margin)
      // }.active(this.active)
      // .params({
      //   data: 19
      // })
    }.width(300)
    .height(350)
    .borderColor(Color.Pink)
    .borderWidth(2)
  }
}