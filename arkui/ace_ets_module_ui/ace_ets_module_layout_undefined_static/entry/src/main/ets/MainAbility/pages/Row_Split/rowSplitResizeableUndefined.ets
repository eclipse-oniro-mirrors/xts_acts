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

import {  Entry,  Text,  Column,  Component,  Button,  ClickEvent,  Flex,  FlexAlign,  ItemAlign,  Color,
  Row,  Font,  SymbolEffectStrategy,  SymbolGlyph,  $r,  List,  TextInput,  RowSplit,  TextAlign
  } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct RowSplitExample {
  @State isUndefined: boolean = false;

  build() {
    Column() {
      Text('rowSplit: ')
      Button('isUndefined = ' + this.isUndefined)
        .onClick(() => {
          this.isUndefined == true ? this.isUndefined = false
            : this.isUndefined = true;
        })
        .id('changeButton')

      RowSplit() {
        Text('1').width('20%').height(100).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
        Text('2').width('20%').height(100).backgroundColor(0xD2B48C).textAlign(TextAlign.Center)
        Text('3').width('20%').height(100).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
        Text('4').width('20%').height(100).backgroundColor(0xD2B48C).textAlign(TextAlign.Center)
        Text('5').width('20%').height(100).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
      }
      .resizeable(this.isUndefined ? undefined : true)
      .id('rowSplit_resizeable')
    }
    .padding(10)
    .width('100%')
    .height('100%')
  }
}