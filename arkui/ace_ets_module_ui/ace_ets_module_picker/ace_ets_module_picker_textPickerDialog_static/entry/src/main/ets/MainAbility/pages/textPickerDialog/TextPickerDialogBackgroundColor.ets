'use static'

import { Entry, Text, Column, ColumnOptions, Component, Button, ClickEvent, Row, Color, Alignment, AttributeModifier,
  Scroll, $r, Stack, Image, ImageAttribute, ImageError, ImageRotateOrientation, ColorMetrics, TextClock,
  TextClockAttribute, TextTimer, TextTimerAttribute, Badge, BadgeParamWithNumber, BadgeParamWithString, BadgeStyle,
  BadgePosition, QRCode, DatePicker, DatePickerDialogOptions, DatePickerAttribute, Resource, TextPicker,
  TextPickerAttribute, TextOverflow, PickerTextStyle, TextPickerTextStyle, FontWeight, PickerBackgroundStyle,
  BorderRadiuses, ShadowStyle, BlurStyle, ThemeColorMode, AdaptiveColor, BackgroundBlurStyleOptions,
  BackgroundEffectOptions, DialogAlignment, ButtonType, ButtonStyleMode, ButtonRole, FontStyle, PickerDialogButtonStyle,
  HoverModeAreaType, TextPickerResult, TextPickerDialogOptions,
  TextPickerDialogOptionsExt ,ResourceColor} from '@ohos.arkui.component'
import { State, Link, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import promptAction from '@ohos.promptAction'
import { LevelOrder, LevelMode } from '@ohos.promptAction'
import { UIContext } from '@ohos.arkui.UIContext'

@Entry
@Component
struct TextPickerDialogBackgroundColor {
  private fruit: Resource = $r('app.strarray.range')
  @State select: Int | Int[] = 1;

  build() {
    Column() {
      Stack({ alignContent: Alignment.Center }) {
        Column({ space: 5 } as ColumnOptions) {
          Button('Color.Pink')
            .id('BG001')
            .onClick((event: ClickEvent) => {
              this.getUIContext().showTextPickerDialog({
                range: this.fruit,
                selected: this.select,
                backgroundColor: Color.Pink,
              } as TextPickerDialogOptionsExt);
            })
          Button('#a90b5df8')
            .id('BG002')
            .onClick((event: ClickEvent) => {
              this.getUIContext().showTextPickerDialog({
                range: this.fruit,
                selected: this.select,
                backgroundColor: '#a90b5df8',
              } as TextPickerDialogOptionsExt);
            })
          Button('$r(\'app.color.start_window_background\')')
            .id('BG003')
            .onClick((event: ClickEvent) => {
              this.getUIContext().showTextPickerDialog({
                range: this.fruit,
                selected: this.select,
                backgroundColor: $r('app.color.start_window_background'),
              } as TextPickerDialogOptionsExt);
            })
          Button('undefined')
            .id('BG004')
            .onClick((event: ClickEvent) => {
              this.getUIContext().showTextPickerDialog({
                range: this.fruit,
                selected: this.select,
                backgroundColor: undefined,
              } as TextPickerDialogOptionsExt);
            })
        }.width('100%')
      }
    }.width('100%').height('100%')
  }
}