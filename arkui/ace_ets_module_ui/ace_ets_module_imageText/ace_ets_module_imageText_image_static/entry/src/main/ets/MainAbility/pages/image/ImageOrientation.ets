'use static'
/*
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
import { Entry, Text, Column, Component, Button, ClickEvent, Row, Color,ResourceColor,ColorContent, Alignment,
  AttributeModifier, Scroll, $r,
  Stack, Image, ImageAttribute, ImageError, ImageRotateOrientation, ColorMetrics, TextClock, TextClockAttribute,
  TextTimer, TextTimerAttribute, Badge, BadgeParamWithNumber, BadgeParamWithString, BadgeStyle, BadgePosition,
  QRCode, DatePicker, DatePickerDialogOptions, DatePickerAttribute, Resource, TextPicker, TextOverflow,
  TextPickerTextStyle, FontWeight, PickerBackgroundStyle, BorderRadiuses, ShadowStyle, BlurStyle, ThemeColorMode,
  AdaptiveColor, BackgroundBlurStyleOptions, BackgroundEffectOptions, DialogAlignment, ButtonType, ButtonStyleMode,
  ButtonRole, FontStyle, PickerDialogButtonStyle, HoverModeAreaType, TextPickerResult, TextPickerDialogOptions,
  TextPickerDialogOptionsExt,PixelMap,ResourceStr ,ImageContent} from '@ohos.arkui.component'
import { State, Link, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import promptAction from '@ohos.promptAction'
import { LevelOrder, LevelMode } from '@ohos.promptAction'
import { UIContext } from '@ohos.arkui.UIContext'
import http from '@ohos.net.http';
import { BusinessError } from '@kit.BasicServicesKit';

@Observed
class MyModifier1 implements AttributeModifier<ImageAttribute> {
  private value: ImageRotateOrientation| undefined = undefined;

  constructor(v: ImageRotateOrientation| undefined) {
    this.value = v;
  }

  applyNormalAttribute(instance: ImageAttribute): void {
    instance.orientation(this.value)
  }
}

@Entry
@Component
struct ImageOrientation {
  @State orientation: ImageRotateOrientation | undefined  = ImageRotateOrientation.UP
  @State resource: Resource = $r('app.media.hello')
  @State modifier1: MyModifier1 = new MyModifier1(ImageRotateOrientation.UP_MIRRORED)
  @State modifier2: MyModifier1 = new MyModifier1(ImageRotateOrientation.RIGHT_MIRRORED)
  @State modifier3: MyModifier1 = new MyModifier1(ImageRotateOrientation.DOWN_MIRRORED)
  @State modifier4: MyModifier1 = new MyModifier1(ImageRotateOrientation.LEFT_MIRRORED)
  build() {
    Column() {
      Image(this.resource)
        .width(100)
        .height(100)
        .orientation(this.orientation)
        .margin(5)
        .key('imageOrientation')


      Row(){
        Button('LEFT_MIRRORED').height('8%').fontSize(12)
          .onClick(() => {
            this.orientation = ImageRotateOrientation.LEFT_MIRRORED
          })
          .id('LEFT_MIRRORED_ID')
        Image($r('app.media.hello'))
          .id('LEFT_MIRRORED_IDText')
          .attributeModifier(this.modifier4)
          .width('10%')
          .height('10%')
      }

      Row(){
        Button('RIGHT_MIRRORED').height('8%').fontSize(12)
          .onClick(() => {
            this.orientation = ImageRotateOrientation.RIGHT_MIRRORED
          })
          .id('RIGHT_MIRRORED_ID')

        Image($r('app.media.hello'))
          .id('RIGHT_MIRRORED_IDText')
          .attributeModifier(this.modifier2)
          .width('10%')
          .height('10%')
      }

      Row(){
        Button('UP_MIRRORED').height('8%').fontSize(12)
          .onClick(() => {
            this.orientation = ImageRotateOrientation.UP_MIRRORED
          })
          .id('UP_MIRRORED_ID')
        Image($r('app.media.hello'))
          .id('UP_MIRRORED_IDText')
          .attributeModifier(this.modifier1)
          .width('10%')
          .height('10%')
      }

      Row(){
        Button('DOWN_MIRRORED').height('8%').fontSize(12)
          .onClick(() => {
            this.orientation = ImageRotateOrientation.DOWN_MIRRORED
          })
          .id('DOWN_MIRRORED_ID')
        Image($r('app.media.hello'))
          .id('DOWN_MIRRORED_IDText')
          .attributeModifier(this.modifier3)
          .width('10%')
          .height('10%')
      }
    }
    .width('100%')
    .height('100%')
  }
}