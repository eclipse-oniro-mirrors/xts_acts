'use static'

import { Entry, Text, Column, Component, Button, ClickEvent, Row, Color,ResourceColor,ColorContent, Alignment,
  AttributeModifier, Scroll, $r,
  Stack, Image, ImageAttribute, ImageError, ImageRotateOrientation, ColorMetrics, TextClock, TextClockAttribute,
  TextTimer, TextTimerAttribute, Badge, BadgeParamWithNumber, BadgeParamWithString, BadgeStyle, BadgePosition,
  QRCode, DatePicker, DatePickerDialogOptions, DatePickerAttribute, Resource, TextPicker, TextOverflow,
  TextPickerTextStyle, FontWeight, PickerBackgroundStyle, BorderRadiuses, ShadowStyle, BlurStyle, ThemeColorMode,
  AdaptiveColor, BackgroundBlurStyleOptions, BackgroundEffectOptions, DialogAlignment, ButtonType, ButtonStyleMode,
  ButtonRole, FontStyle, PickerDialogButtonStyle, HoverModeAreaType, TextPickerResult, TextPickerDialogOptions,
  TextPickerDialogOptionsExt } from '@ohos.arkui.component'
import { State, Link, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import promptAction from '@ohos.promptAction'
import { LevelOrder, LevelMode } from '@ohos.promptAction'
import { UIContext } from '@ohos.arkui.UIContext'
@Observed
class MyModifier1 implements AttributeModifier<ImageAttribute> {
  private value: number | undefined = undefined;

  constructor(v: number | undefined) {
    this.value = v;
  }

  applyNormalAttribute(instance: ImageAttribute): void {
    instance.hdrBrightness(this.value)
  }
}
@Entry
@Component
struct ImageHdrBrightness {
  @State modifier1: MyModifier1 = new MyModifier1(undefined)
  @State modifier2: MyModifier1 = new MyModifier1(0.0)
  @State modifier3: MyModifier1 = new MyModifier1(0.3)
  @State modifier4: MyModifier1 = new MyModifier1(0.8)
  @State modifier5: MyModifier1 = new MyModifier1(1.0)
  @State modifier6: MyModifier1 = new MyModifier1(-1)
  @State modifier7: MyModifier1 = new MyModifier1(2)
  @State hdrBrightnessValue: number | undefined = 0.0

  build() {
    Column() {
      Text('hdrBrightness属性测试')
      Row() {
        Image($r('app.media.flower'))
          .width('32%')
          .aspectRatio(1)
          .hdrBrightness(this.hdrBrightnessValue)
          .key('hdrImageKey')
          .width('10%')
          .height(35)
        Image($r('app.media.flower'))
          .width('32%')
          .aspectRatio(1)
          .key('noHdrBrightnessImageKey')
          .width('10%')
          .height(35)
      }

      Row(){
        Button('0.0')
          .id('hdr00')
          .onClick(() => {
            this.hdrBrightnessValue = 0.0
          })
        Text('0')
        Image($r('app.media.flower'))
          .key('modifier2')
          .attributeModifier(this.modifier2)
          .width('10%')
          .height(35)
      }
      Row(){
        Button('0.3')
          .id('hdr03')
          .onClick(() => {
            this.hdrBrightnessValue = 0.3
          })
        Image($r('app.media.flower'))
          .key('modifier3')
          .attributeModifier(this.modifier3)
          .width('10%')
          .height(35)
      }

      Row(){
        Button('0.8')
          .id('hdr08')
          .onClick(() => {
            this.hdrBrightnessValue = 0.8
          })
        Image($r('app.media.flower'))
          .key('modifier4')
          .attributeModifier(this.modifier4)
          .width('10%')
          .height(35)
      }

      Row(){
        Button('1.0')
          .id('hdr10')
          .onClick(() => {
            this.hdrBrightnessValue = 1.0
          })
        Image($r('app.media.flower'))
          .key('modifier5')
          .attributeModifier(this.modifier5)
          .width('10%')
          .height(35)
      }

      Row(){
        Button('-1')
          .id('hdr_1')
          .onClick(() => {
            this.hdrBrightnessValue = -1
          })
        Image($r('app.media.flower'))
          .key('modifier6')
          .attributeModifier(this.modifier6)
          .width('10%')
          .height(35)
      }

      Row(){
        Button('2')
          .id('hdr20')
          .onClick(() => {
            this.hdrBrightnessValue = 2
          })
        Image($r('app.media.flower'))
          .key('modifier7')
          .attributeModifier(this.modifier7)
          .width('10%')
          .height(35)
      }

      Row(){
        Button('undefined')
          .id('hdrUndefined')
          .onClick(() => {
            this.hdrBrightnessValue = undefined
          })
        Image($r('app.media.flower'))
          .key('modifier1')
          .attributeModifier(this.modifier1)
          .width('10%')
          .height(35)
      }


    }.width('100%').padding({right: 10, top: 10})
    .height('100%')
  }
}
