'use static'

import { Entry, Text, Column, ColumnOptions, Component, Button, ClickEvent, Row, Color, Alignment, AttributeModifier,
  Scroll, $r, Stack, Image, ImageAttribute, ImageError, ImageRotateOrientation, ColorMetrics, TextClock,
  TextClockAttribute, TextTimer, TextTimerAttribute, Badge, BadgeParamWithNumber, BadgeParamWithString, BadgeStyle,
  BadgePosition, QRCode, DatePicker, DatePickerDialogOptions, DatePickerAttribute, Resource, TextPicker,
  TextPickerAttribute, TextOverflow, PickerTextStyle, TextPickerTextStyle, FontWeight, PickerBackgroundStyle,
  BorderRadiuses, ShadowStyle, BlurStyle, ThemeColorMode, AdaptiveColor, BackgroundBlurStyleOptions,
  BackgroundEffectOptions, DialogAlignment, ButtonType, ButtonStyleMode, ButtonRole, FontStyle, PickerDialogButtonStyle,
  HoverModeAreaType, TextPickerResult, TextPickerDialogOptions,
  TextPickerDialogOptionsExt ,Offset} from '@ohos.arkui.component'
import { State, Link, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import promptAction from '@ohos.promptAction'
import { LevelOrder, LevelMode } from '@ohos.promptAction'
import { UIContext } from '@ohos.arkui.UIContext'

@Entry
@Component
struct Index666 {
  private fruit: Resource = $r('app.strarray.range')
  @State select: Int | Int[] = 1;
  @State valueIndex: int= 0;
  build() {
    Column() {
      Stack({ alignContent: Alignment.Center }) {
        Column({ space: 5 } as ColumnOptions) {
          Button('dx: 40, dy: 0')
            .onClick((event: ClickEvent) => {
              this.getUIContext().showTextPickerDialog({
                range: this.fruit,
                selected: this.select,
                offset: { dx: 40, dy: 0 },
              } as TextPickerDialogOptionsExt);
            })
            .id('offset1')
          Button('dx: 40, dy: -200')
            .onClick((event: ClickEvent) => {
              this.getUIContext().showTextPickerDialog({
                range: this.fruit,
                selected: this.select,
                offset: { dx: 40, dy: -200 },
              } as TextPickerDialogOptionsExt);
            })
            .id('offset2')
          Button('dx: -1000, dy: -200')
            .onClick((event: ClickEvent) => {
              this.getUIContext().showTextPickerDialog({
                range: this.fruit,
                selected: this.select,
                offset: { dx: -40, dy: -40 },
              } as TextPickerDialogOptionsExt);
            })
            .id('offset3')
          Button('undefined')
            .onClick((event: ClickEvent) => {
              this.getUIContext().showTextPickerDialog({
                range: this.fruit,
                selected: this.select,
                offset: undefined,
              } as TextPickerDialogOptionsExt);
            })
            .id('offset4')
        }.width('100%')
      }
    }.width('100%').height('100%')
  }
}