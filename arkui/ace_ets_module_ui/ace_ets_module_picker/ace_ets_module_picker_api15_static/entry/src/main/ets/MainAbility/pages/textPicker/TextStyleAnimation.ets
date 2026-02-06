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
import { Entry, Column, Component, Flex, FlexDirection, ItemAlign, FlexAlign, Text, Button, FontWeight,Resource,
  Row, ClickEvent, Margin, ButtonType, TextPickerAttribute, TextPicker, HorizontalAlign, TextOverflow, AttributeModifier
} from '@ohos.arkui.component'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { State } from '@ohos.arkui.stateManagement'
import { LengthMetrics } from '@kit.ArkUI'

@Entry
@Component
struct TextPickerTextStyleAnimation {
  private select: int = 1;
  private fruits: string[] = ['AAAAA', 'BBBBBBBBBBBBB', 'CCCC', 'DDDDDDDD', 'EEE'];
  @State textStyleAnimation: boolean | undefined = true;
  @State minFontSize: undefined | double | string | Resource = 18 as undefined | double | string | Resource;
  @State maxFontSize: undefined | double | string | Resource = 28 as undefined | double | string | Resource;
  @State overflow: TextOverflow | undefined = TextOverflow.Ellipsis

  build() {
    Column() {
      TextPicker({
        range: this.fruits,
        selected: this.select,
        value: this.fruits[this.select]
      })
        .key('TextPickerAnimation')
        .disableTextStyleAnimation(this.textStyleAnimation)
        .defaultTextStyle({ minFontSize: this.minFontSize, maxFontSize: this.maxFontSize, overflow: this.overflow })

      Row() {
        Button("true")
          .fontSize(10)
          .height('5%')
          .key('TextStyleAnimation_TRUE')
          .onClick((e:ClickEvent) => {
            this.textStyleAnimation = true
          })

        Button("false")
          .fontSize(10)
          .height('5%')
          .key('TextStyleAnimation_FALSE')
          .onClick((e:ClickEvent) => {
            this.textStyleAnimation = false
          })
      }

      Row() {
        Button("undefined")
          .fontSize(10)
          .height('5%')
          .key('TextStyleAnimation_UNDEFINED')
          .onClick((e:ClickEvent) => {
            this.textStyleAnimation = undefined
          })

        Button("null")
          .fontSize(10)
          .height('5%')
          .key('TextStyleAnimation_NULL')
          .onClick((e:ClickEvent) => {
            // this.textStyleAnimation = null
          })
      }
    }.width('100%').height('100%')
  }
}