'use static';
/**
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

import {
  Entry, Text, Column, Row, Component, Button, ClickEvent, OffsetOptions, TextPicker, FontWeight, Color,
  TextPickerTextStyle, TextOverflow, PickerTextStyle
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextPicker1 {
  private fruits: string[] = ['apple1', 'orange2', 'peach3', 'grape4', 'pear5'];
  @State textStyleValue: TextPickerTextStyle = { font: {
    size: '30.00fp',
    weight: FontWeight.Regular
  } } as TextPickerTextStyle;
  @State isDisableTextStyleAnimation: boolean = false;
  @State isDefaultTextStyle: boolean = false;
  @State isSelectedTextStyle: boolean = false;
  @State isTextStyle: boolean = false;
  @State isDisappearTextStyle: boolean = false;
  @State isCanLoop: boolean = false;
  @State isDefaultPickerItemHeight: boolean = false;

  build() {
    Column() {
      Text('TextPicker')
      TextPicker({
        range: this.fruits
      })
        .width('80%')
        .height('30%')
        .disableTextStyleAnimation(this.isDisableTextStyleAnimation ? true : undefined)
        .defaultTextStyle(this.isDefaultTextStyle ? this.textStyleValue : undefined)
        .selectedTextStyle(this.isSelectedTextStyle ? this.textStyleValue : undefined)
        .textStyle(this.isTextStyle ? this.textStyleValue : undefined)
        .disappearTextStyle(this.isDisappearTextStyle ? this.textStyleValue : undefined)
        .canLoop(this.isCanLoop ? false : undefined)
        .defaultPickerItemHeight(this.isDefaultPickerItemHeight ? 20.00 : undefined)
        .id('textPicker_action')

      Row() {
        Button('0' + this.isDisableTextStyleAnimation).onClick((event: ClickEvent) => {
          this.isDisableTextStyleAnimation = !this.isDisableTextStyleAnimation;
        }).margin(5).id('disableTextStyleAnimation_action')
        Button('1' + this.isDefaultTextStyle).onClick((event: ClickEvent) => {
          this.isDefaultTextStyle = !this.isDefaultTextStyle;
        }).margin(5).id('defaultTextStyle_action')
        Button('2' + this.isSelectedTextStyle).onClick((event: ClickEvent) => {
          this.isSelectedTextStyle = !this.isSelectedTextStyle;
        }).margin(5).id('selectedTextStyle_action')
        Button('3' + this.isTextStyle).onClick((event: ClickEvent) => {
          this.isTextStyle = !this.isTextStyle;
        }).margin(5).id('textStyle_action')
      }

      Row() {
        Button('4' + this.isDisappearTextStyle).onClick((event: ClickEvent) => {
          this.isDisappearTextStyle = !this.isDisappearTextStyle;
        }).margin(5).id('disappearTextStyle_action')
        Button('5' + this.isCanLoop).onClick((event: ClickEvent) => {
          this.isCanLoop = !this.isCanLoop;
        }).margin(5).id('canLoop_action')
        Button('6' + this.isDefaultPickerItemHeight).onClick((event: ClickEvent) => {
          this.isDefaultPickerItemHeight = !this.isDefaultPickerItemHeight;
        }).margin(5).id('defaultPickerItemHeight_action')
      }
    }
    .width('100%')
    .height('100%')
  }
}