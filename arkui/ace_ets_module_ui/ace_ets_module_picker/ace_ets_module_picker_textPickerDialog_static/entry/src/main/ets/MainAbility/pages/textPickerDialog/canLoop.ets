'use static'

import { Entry, Text, Column, ColumnOptions, Component, Button, ClickEvent, Row, Color, Alignment, AttributeModifier,
  Scroll, $r, Stack, Image, ImageAttribute, ImageError, ImageRotateOrientation, ColorMetrics, TextClock,
  TextClockAttribute, TextTimer, TextTimerAttribute, Badge, BadgeParamWithNumber, BadgeParamWithString, BadgeStyle,
  BadgePosition, QRCode, DatePicker, DatePickerDialogOptions, DatePickerAttribute, Resource, TextPicker,
  TextPickerAttribute, TextOverflow, PickerTextStyle, TextPickerTextStyle, FontWeight, PickerBackgroundStyle,
  BorderRadiuses, ShadowStyle, BlurStyle, ThemeColorMode, AdaptiveColor, BackgroundBlurStyleOptions,
  BackgroundEffectOptions, DialogAlignment, ButtonType, ButtonStyleMode, ButtonRole, FontStyle, PickerDialogButtonStyle,
  HoverModeAreaType, TextPickerResult, TextPickerDialogOptions,
  TextPickerDialogOptionsExt } from '@ohos.arkui.component'
import { State, Link, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import promptAction from '@ohos.promptAction'
import { LevelOrder, LevelMode } from '@ohos.promptAction'
import { UIContext } from '@ohos.arkui.UIContext'

@Entry
@Component
struct Index44 {
  private fruit: Resource = $r('app.strarray.range')
  @State select: Int | Int[] = 1;
  @State valueIndex: int= 0;
  build() {
    Column() {
      Stack({ alignContent: Alignment.Center }) {
        Column({ space: 5 } as ColumnOptions) {
          Button('false')
            .onClick((event: ClickEvent) => {
              this.getUIContext().showTextPickerDialog({
                range: this.fruit,
                selected: this.select,
                canLoop: false,
              } as TextPickerDialogOptionsExt);
            })
            .id('loopFalse')
          Button('true')
            .onClick((event: ClickEvent) => {
              this.getUIContext().showTextPickerDialog({
                range: this.fruit,
                selected: this.select,
                canLoop: true,
              } as TextPickerDialogOptionsExt);
            })
            .id('loopTrue')
          Button('undefined')
            .onClick((event: ClickEvent) => {
              this.getUIContext().showTextPickerDialog({
                range: this.fruit,
                selected: this.select,
                canLoop: undefined,
              } as TextPickerDialogOptionsExt);
            })
            .id('loopUndefined')
        }.width('100%')
      }
    }.width('100%').height('100%')
  }
}