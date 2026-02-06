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
import { Entry, Text, Column, Component, Button, ClickEvent, Row, Color,ResourceColor,ColorContent, 
  Alignment, AttributeModifier, Scroll, $r, Stack, Image, ImageAttribute, ImageError, ImageRotateOrientation, 
  ColorMetrics, TextClock, TextClockAttribute,
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
class TextClockModifier1 implements AttributeModifier<TextClockAttribute> {
  applyNormalAttribute(instance: TextClockAttribute): void {
    instance.format('aa hh:mm:ss')
  }
}

@Observed
class TextClockModifier2 implements AttributeModifier<TextClockAttribute> {
  applyNormalAttribute(instance: TextClockAttribute): void {
    instance.format($r('app.string.format'))
  }
}

@Observed
class TextClockModifier4 implements AttributeModifier<TextClockAttribute> {
  applyNormalAttribute(instance: TextClockAttribute): void {
    instance.format(undefined)
  }
}

@Observed
class TextClockModifier5 implements AttributeModifier<TextClockAttribute> {
  applyNormalAttribute(instance: TextClockAttribute): void {
    instance.format('yyyy-M-d')
  }
}

@Entry
@Component
struct ImageTest {
  @State TextClockModifier1 : TextClockModifier1 = new TextClockModifier1()
  @State TextClockModifier2 : TextClockModifier2 = new TextClockModifier2()
  @State TextClockModifier4 : TextClockModifier4 = new TextClockModifier4()
  @State TextClockModifier5 : TextClockModifier5 = new TextClockModifier5()
  build() {
    Column() {
      Column() {
        TextClock().width('40%').format($r('app.string.format')).id('format_resource')
        TextClock().width('40%').attributeModifier(this.TextClockModifier2).id('format_resource1')
      }

      Column() {
        TextClock().width('40%').format('yyyy-M-d').id('format_yyyy')
        TextClock().width('40%').attributeModifier(this.TextClockModifier5).id('format_yyyy1')
      }
      
      Column() {
        TextClock().width('40%').format('aa hh:mm:ss').id('format_aa_hh')
        TextClock().width('40%').attributeModifier(this.TextClockModifier1).id('format_aa_hh1')
      }
      
      Column() {
        TextClock().width('40%').format(undefined).id('format_undefined')
        TextClock().width('40%').attributeModifier(this.TextClockModifier4).id('format_undefined1')
      }
    }
  }
}