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
  SymbolGlyph, $r, Navigation, List, TextInput, AttributeModifier,
  ColumnAttribute} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
export class MyColumnModifier implements AttributeModifier<ColumnAttribute> {
  public isUndefined: Boolean = false;

  applyNormalAttribute(instance: ColumnAttribute): void {
    instance.justifyContent(this.isUndefined ? undefined : FlexAlign.End as FlexAlign)
  }
}

@Entry
@Component
struct Index {
  @State isUndefined: Boolean = false;
  @State text: string = 'isUndefined: ';
  @State modifier:MyColumnModifier = new MyColumnModifier();

  build() {
    Column() {
      Row() {
        Button(this.text + this.isUndefined).fontSize(14).fontColor('#182431').fontWeight(500)
          .onClick(() => {
            this.isUndefined = !this.isUndefined
            this.modifier.isUndefined = this.isUndefined
          })
          .id('changeButton')
          .backgroundColor(this.isUndefined ? undefined : Color.Green)
      }
      Row() {
        Column() {
          Text('justifyContent: ')
        }
      }
      Row() {
        Column() {
          Column() {
            Text('1').width('200').height(50).backgroundColor(0xF5DEB3)
            Text('2').width('300').height(50).backgroundColor(0xD2B48C)
            Text('3').width('100').height(50).backgroundColor(0xF5DEB3)
            Text('4').width('100').height(50).backgroundColor(0xD2B48C)
            Text('5').width('300').height(50).backgroundColor(0xF5DEB3)
          }
          .id('Column_JustifyContent_Modifier')
          .attributeModifier(this.modifier)
          .borderWidth(1)
          .width('90%').height('60%')
        }
      }
    }
  }
}