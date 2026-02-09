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
  TextAttribute,  TextAlign, ConstraintSizeOptions} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
export class MyTextModifier implements AttributeModifier<TextAttribute> {
  public isUndefined: Boolean = false;

  applyNormalAttribute(instance: TextAttribute): void {
    instance.constraintSize(this.isUndefined ? undefined : { maxWidth: 200 } as ConstraintSizeOptions)
  }
}

@Entry
@Component
struct Index {
  @State isUndefined: Boolean = false;
  @State text: string = 'isUndefined: ';
  @State modifier:MyTextModifier = new MyTextModifier();
  @State testText: string = 'This is test text.This is test text.This is test text.This is test text';

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
          Text('constraintSize_modifier: ')
        }
      }
      Row() {
        Text(this.testText)
          .backgroundColor(0xbbb2cb)
          .attributeModifier(this.modifier)
          .id('common_constraintSize_modifier')
      }
    }
  }
}