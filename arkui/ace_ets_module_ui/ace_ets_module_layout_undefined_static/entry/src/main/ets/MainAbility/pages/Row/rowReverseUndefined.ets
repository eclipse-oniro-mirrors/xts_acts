'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
  Entry, Text, Column, Component, Button, ClickEvent, Color,
  TextAlign, List, ListItem, ListScroller, Builder, ForEach, Row, TransitionType, FlexAlign,
  ColumnOptions,  AttributeModifier, Divider, VerticalAlign
} from '@ohos.arkui.component'
import { $r } from '@ohos.arkui.component'
import { State ,Observed} from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct RowExample {
  @State isUndefined: boolean = false;
  build() {
    Column({ space: 5 } as ColumnOptions) {
      Row() {
        Row() {
          Text('1')
        }.width('40%').height('80%').backgroundColor(0xAFEEEE).id('row1')
        Row() {
          Text('2')
        }.width('40%').height('80%').backgroundColor(0x00FFFF).id('row2')
      }
      .width('90%')
      .height('15%')
      .border({ width: 1 })
      .reverse(this.isUndefined ? undefined : false)
      .id('Row_Reverse')

      Divider()
      Button(this.isUndefined ? 'isUndefined = true' : 'isUndefined = false')
        .onClick(() => {
          this.isUndefined = !this.isUndefined
        }
        )
        .id('changeButton')
    }.width('100%')
  }
}