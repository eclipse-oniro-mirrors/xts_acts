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
import { Entry, Column, Component, Flex, FlexDirection, ItemAlign, FlexAlign, Text, Button, FontWeight,
  Row, ClickEvent, Margin, ButtonType,Resource, TextPickerAttribute, TextPicker, HorizontalAlign, TextOverflow, AttributeModifier,
  HorizontalAlign, ColumnOptions} from '@ohos.arkui.component'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { State } from '@ohos.arkui.stateManagement'
import { LengthMetrics } from '@kit.ArkUI'

@Entry
@Component
struct TextPickerTextStyleExample {
  private select: int = 1;
  private fruits: string[] = ['AAAAA', 'BBBBBBBBBBBBB', 'CCCC', 'DDDDDDDD', 'EEE'];
  @State minFontSize: undefined | double | string | Resource = 18 as undefined | double | string | Resource;
  @State maxFontSize: undefined | double | string | Resource = 28 as undefined | double | string | Resource;
  @State overflow: TextOverflow | undefined = TextOverflow.Ellipsis

  build() {
    Column({ space: 3 } as ColumnOptions) {
      TextPicker({
        range: this.fruits,
        selected: this.select as int,
      })
        .height('50%')
        .key('TextPickerTextStyle')
        .disableTextStyleAnimation(true)
        .defaultTextStyle({ minFontSize: this.minFontSize, maxFontSize: this.maxFontSize, overflow: this.overflow })

      Button("min18 < max28")
        .fontSize(12)
        .height('8%')
        .key('TextPickerTextStyle_Normal1')
        .onClick((e:ClickEvent) => {
          this.minFontSize = 18
          this.maxFontSize = 28
          this.overflow = TextOverflow.Ellipsis
        })

      Button("min18 = max18")
        .fontSize(12)
        .height('8%')
        .key('TextPickerTextStyle_Normal2')
        .onClick((e:ClickEvent) => {
          this.minFontSize = 18
          this.maxFontSize = 18
          this.overflow = TextOverflow.Ellipsis
        })

      Button("min28 > max18")
        .fontSize(12)
        .height('8%')
        .key('TextPickerTextStyle_Normal3')
        .onClick((e:ClickEvent) => {
          this.minFontSize = 28
          this.maxFontSize = 18
          this.overflow = TextOverflow.Ellipsis
        })

      Row() {
        Button("undefined")
          .fontSize(12)
          .height('8%')
          .key('TextPickerTextStyle_Undefined')
          .onClick((e:ClickEvent) => {
            this.minFontSize = undefined
            this.maxFontSize = undefined
            this.overflow = undefined
          })

        Button("null")
          .fontSize(12)
          .height('8%')
          .key('TextPickerTextStyle_Null')
          .onClick((e:ClickEvent) => {
            // this.minFontSize = null
            // this.maxFontSize = null
            // this.overflow = null
          })
      }

      Button("negative min:-10 max:-20")
        .fontSize(12)
        .height('8%')
        .key('TextPickerTextStyle_Negative')
        .onClick((e:ClickEvent) => {
          this.minFontSize = -10
          this.maxFontSize = -20
          this.overflow = TextOverflow.Clip
        })
    }.alignItems(HorizontalAlign.Center).width('100%').height('90%').margin({ top: 20 } as Margin)
  }
}