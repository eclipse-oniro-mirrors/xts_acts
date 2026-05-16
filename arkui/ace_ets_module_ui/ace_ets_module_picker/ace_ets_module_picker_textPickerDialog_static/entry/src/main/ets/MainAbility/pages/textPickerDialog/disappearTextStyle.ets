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
struct Index42 {
  private fruit: Resource = $r('app.strarray.range')
  @State select: Int | Int[] = 3;
  build() {
    Column() {
      Stack({ alignContent: Alignment.Center }) {
        Column({ space: 5 } as ColumnOptions) {
          Button('Color.Red maxFontSize:30 TextOverflow.Ellipsis')
            .onClick((event: ClickEvent) => {
              this.getUIContext().showTextPickerDialog({
                range: this.fruit,
                selected: this.select,
                defaultPickerItemHeight: 60,
                disappearTextStyle: {
                  color: Color.Red,
                  font: { size: 50 },
                  minFontSize: 30,
                  maxFontSize: 30,
                  overflow: TextOverflow.Ellipsis
                } as TextPickerTextStyle,
              } as TextPickerDialogOptionsExt);
            })
            .id('disappearTextStyleId1')
          Button('Color.Red maxFontSize:30 TextOverflow.Ellipsis')
            .onClick((event: ClickEvent) => {
              this.getUIContext().showTextPickerDialog({
                range: this.fruit,
                selected: this.select,
                defaultPickerItemHeight: 60,
                disappearTextStyle: {
                  color: '#ffdd1e13',
                  font: { size: 50, weight: FontWeight.Bold },
                  minFontSize: '30',
                  maxFontSize: '30',
                  overflow: TextOverflow.Clip
                } as TextPickerTextStyle,
              } as TextPickerDialogOptionsExt);
            })
            .id('disappearTextStyleId2')
          Button('#ffdd1e13 fontsize:50 FontWeight.Bold TextOverflow.Clip')
            .onClick((event: ClickEvent) => {
              this.getUIContext().showTextPickerDialog({
                range: this.fruit,
                selected: this.select,
                defaultPickerItemHeight: 60,
                disappearTextStyle: {
                  color: '#ffdd1e13',
                  font: { size: 50, weight: FontWeight.Bold },
                  overflow: TextOverflow.Clip
                } as TextPickerTextStyle,
              } as TextPickerDialogOptionsExt);
            })
            .id('disappearTextStyleId3')
          Button('{ } as TextPickerTextStyle')
            .onClick((event: ClickEvent) => {
              this.getUIContext().showTextPickerDialog({
                range: this.fruit,
                selected: this.select,
                defaultPickerItemHeight: 60,
                disappearTextStyle: { } as TextPickerTextStyle,
              } as TextPickerDialogOptionsExt);
            })
            .id('disappearTextStyleId4')
          Button('undefined')
            .onClick((event: ClickEvent) => {
              this.getUIContext().showTextPickerDialog({
                range: this.fruit,
                selected: this.select,
                defaultPickerItemHeight: 60,
                disappearTextStyle: undefined,
              } as TextPickerDialogOptionsExt);
            })
            .id('disappearTextStyleId5')
        }.width('100%')
      }
    }.width('100%').height('100%')
  }
}