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
struct Index {
  private fruit: Resource = $r('app.strarray.range')
  @State select: Int | Int[] = 1;
  @State valueIndex: int= 0;
  build() {
    Column() {
      Stack({ alignContent: Alignment.Center }) {
        Image($r('app.media.bg'))
        Column({ space: 5 } as ColumnOptions) {
          Button('DialogAlignment.Top')
            .id('show1')
            .onClick((event: ClickEvent) => {
              this.getUIContext().showTextPickerDialog({
                range: this.fruit,
                selected: this.select,
                alignment: DialogAlignment.Top,
              } as TextPickerDialogOptionsExt);
            })
          Button('DialogAlignment.Center')
            .id('show2')
            .onClick((event: ClickEvent) => {
              this.getUIContext().showTextPickerDialog({
                range: this.fruit,
                selected: this.select,
                alignment: DialogAlignment.Center,
              } as TextPickerDialogOptionsExt);
            })
          Button('DialogAlignment.Bottom')
            .id('show3')
            .onClick((event: ClickEvent) => {
              this.getUIContext().showTextPickerDialog({
                range: this.fruit,
                selected: this.select,
                alignment: DialogAlignment.Bottom,
              } as TextPickerDialogOptionsExt);
            })
          Button('DialogAlignment.Default')
            .id('show4')
            .onClick((event: ClickEvent) => {
              this.getUIContext().showTextPickerDialog({
                range: this.fruit,
                selected: this.select,
                alignment: DialogAlignment.Default,
              } as TextPickerDialogOptionsExt);
            })
          Button('DialogAlignment.TopStart')
            .id('show5')
            .onClick((event: ClickEvent) => {
              this.getUIContext().showTextPickerDialog({
                range: this.fruit,
                selected: this.select,
                alignment: DialogAlignment.TopStart,
              } as TextPickerDialogOptionsExt);
            })
          Button('undefined')
            .id('show6')
            .onClick((event: ClickEvent) => {
              this.getUIContext().showTextPickerDialog({
                range: this.fruit,
                selected: this.select,
                alignment: undefined,
              } as TextPickerDialogOptionsExt);
            })
        }.width('100%')
      }
    }.width('100%').height('100%')
  }
}