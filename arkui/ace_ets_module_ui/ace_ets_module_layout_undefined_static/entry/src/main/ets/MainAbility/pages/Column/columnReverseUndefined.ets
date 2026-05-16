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

import { Entry, Text, Column, Component, Button, ClickEvent, Flex,
  FlexAlign,ItemAlign, Select, Color, Row, Font, SymbolEffectStrategy,
  SymbolGlyph, $r, Navigation, List, TextInput, ColumnSplit, TextAlign } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct ColumnReversePage {
  @State isUndefined: Boolean = true;
  @State text: string = 'isUndefined: '
  build() {
    Column() {
      Row() {
        Button(this.text + this.isUndefined).fontSize(14).fontColor('#182431').fontWeight(500)
          .onClick(() => {
            this.isUndefined = !this.isUndefined
          })
          .id('changeButton')
          .backgroundColor(this.isUndefined ? undefined : Color.Green)
      }
      Row() {
        Column() {
          Text('reverse: ')
        }
      }
      Column() {
        Text('1').width('200').height(50).backgroundColor(0xF5DEB3).id('column1')
        Text('2').width('300').height(50).backgroundColor(0xD2B48C).id('column2')
        Text('3').width('100').height(50).backgroundColor(0xF5DEB3).id('column3')
        Text('4').width('100').height(50).backgroundColor(0xD2B48C).id('column4')
        Text('5').width('300').height(50).backgroundColor(0xF5DEB3).id('column5')
      }
      .width('90%')
      .height('40%')
      .backgroundColor(Color.Pink)
      .key('Column_Reverse')
      .reverse(this.isUndefined ? undefined : false)
    }
  }
}