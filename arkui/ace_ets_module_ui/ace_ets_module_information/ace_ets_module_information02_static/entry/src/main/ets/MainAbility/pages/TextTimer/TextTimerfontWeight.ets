'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Entry, Text, Column, Component, Button, ClickEvent, Row, Color,ResourceColor,ColorContent, Alignment,
  AttributeModifier, Scroll, $r,
  Stack, Image, ImageAttribute, ImageError, ImageRotateOrientation, ColorMetrics, TextClock, TextClockAttribute,
  TextTimer, TextTimerAttribute, Badge, BadgeParamWithNumber, BadgeParamWithString, BadgeStyle, BadgePosition,
  QRCode, DatePicker, DatePickerDialogOptions, DatePickerAttribute, Resource, TextPicker, TextOverflow,
  TextPickerTextStyle, FontWeight, PickerBackgroundStyle, BorderRadiuses, ShadowStyle, BlurStyle, ThemeColorMode,
  AdaptiveColor, BackgroundBlurStyleOptions, BackgroundEffectOptions, DialogAlignment, ButtonType, ButtonStyleMode,
  ButtonRole, FontStyle, PickerDialogButtonStyle, HoverModeAreaType, TextPickerResult, TextPickerDialogOptions,
  TextPickerDialogOptionsExt,ResourceStr } from '@ohos.arkui.component'
import { State, Link, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import promptAction from '@ohos.promptAction'
import { LevelOrder, LevelMode } from '@ohos.promptAction'
import { UIContext } from '@ohos.arkui.UIContext'

@Observed
class MyModifier1 implements AttributeModifier<TextTimerAttribute> {
  private value: Int | FontWeight | ResourceStr | undefined = undefined;

  constructor(v: Int | FontWeight | ResourceStr | undefined) {
    this.value = v;
  }

  applyNormalAttribute(instance: TextTimerAttribute): void {
    instance.fontWeight(this.value)
  }
}

@Entry
@Component
struct SymbolGlyphFontWeight {
  @State isActive: boolean = true;
  @State modifier1: MyModifier1 = new MyModifier1($r('app.string.Weight'))
  @State modifier2: MyModifier1 = new MyModifier1(undefined)
  @State modifier3: MyModifier1 = new MyModifier1(500)
  @State modifier4: MyModifier1 = new MyModifier1(FontWeight.Lighter)
  @State modifier5: MyModifier1 = new MyModifier1(FontWeight.Normal)
  @State modifier6: MyModifier1 = new MyModifier1(FontWeight.Regular)
  @State modifier7: MyModifier1 = new MyModifier1(FontWeight.Medium)
  @State modifier8: MyModifier1 = new MyModifier1(FontWeight.Bold)
  @State modifier9: MyModifier1 = new MyModifier1(FontWeight.Bolder)
  @State modifier10: MyModifier1 = new MyModifier1('900')
  build() {
    Column() {
      Row() {
        Column() {
          Text('SymbolGlyph: fontWeight').height('5%')
          Row() {
            TextTimer()
              .fontWeight($r('app.string.Weight'))
              .id('FontWeight_resource')

            TextTimer()
              .fontWeight(undefined)
              .id('FontWeight_undefined')

            TextTimer()
              .fontWeight(500)
              .id('FontWeight_500')
          }.height('10%')

          Row() {
            TextTimer()
              .attributeModifier(this.modifier1)
              .id('FontWeight_resourcea')

            TextTimer()
              .attributeModifier(this.modifier2)
              .id('FontWeight_undefineda')

            TextTimer()
              .attributeModifier(this.modifier3)
              .id('FontWeight_500a')
          }.height('10%')

          Row() {
            TextTimer()
              .fontWeight(FontWeight.Lighter)
              .id('FontWeight_Lighter')

            TextTimer()
              .fontWeight(FontWeight.Normal)
              .id('FontWeight_Normal')

            TextTimer()
              .fontWeight(FontWeight.Regular)
              .id('FontWeight_Regular')
          }.height('10%')

          Row() {
            TextTimer()
              .attributeModifier(this.modifier4)
              .id('FontWeight_Lightera')

            TextTimer()
              .attributeModifier(this.modifier5)
              .id('FontWeight_Normala')

            TextTimer()
              .attributeModifier(this.modifier6)
              .id('FontWeight_Regulara')
          }.height('10%')

          Row() {
            TextTimer()
              .fontWeight(FontWeight.Medium)
              .id('FontWeight_Medium')

            TextTimer()
              .fontWeight(FontWeight.Bold)
              .id('FontWeight_Bold')

            TextTimer()
              .fontWeight(FontWeight.Bolder)
              .id('FontWeight_Bolder')
          }.height('10%')

          Row() {
            TextTimer()
              .attributeModifier(this.modifier7)
              .id('FontWeight_Mediuma')

            TextTimer()
              .attributeModifier(this.modifier8)
              .id('FontWeight_Bolda')

            TextTimer()
              .attributeModifier(this.modifier9)
              .id('FontWeight_Boldera')
          }.height('10%')

          TextTimer()
            .fontWeight('900')
            .id('FontWeight_900')
            .height('10%')

          TextTimer()
            .attributeModifier(this.modifier10)
            .id('FontWeight_900a')
        }
      }
    }.margin({ left: 5, top: 5 })
  }
}