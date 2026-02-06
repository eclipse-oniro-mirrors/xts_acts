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

import { Entry, Column, Component, Row, Text, Color, ColumnOptions } from '@ohos.arkui.component';

@Entry
@Component
struct RowReversePage {
  build() {
    Column({ space: 5 } as ColumnOptions) {
      Row() {
        Row() {
          Text('1')
        }.width('40%').height('80%').backgroundColor(Color.Red)
        .key('RowReverse_Row_01')

        Row() {
          Text('2')
        }.width('40%').height('80%').backgroundColor(Color.Red)
        .key('RowReverse_Row_02')
      }
      .width('90%')
      .height('40%')
      .backgroundColor(Color.Pink)
      .key('RowReverse_Row_1')
      .reverse(true)

      Row() {
        Row() {
          Text('3')
        }.width('40%').height('80%').backgroundColor(Color.Red)
        .key('RowReverse_Row_03')

        Row() {
          Text('4')
        }.width('40%').height('80%').backgroundColor(Color.Red)
        .key('RowReverse_Row_04')
      }
      .width('90%')
      .height('40%')
      .backgroundColor(Color.Pink)
      .key('RowReverse_Row_2')
      .reverse(false)
    }
  }
}
