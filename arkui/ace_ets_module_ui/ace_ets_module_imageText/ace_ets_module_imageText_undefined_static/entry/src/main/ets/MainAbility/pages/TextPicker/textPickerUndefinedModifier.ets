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
  TextPickerTextStyle, TextOverflow, PickerTextStyle, AttributeModifier, TextPickerAttribute
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyModifier implements AttributeModifier<TextPickerAttribute> {
  public textStyleValue: TextPickerTextStyle = { font: {
    size: '30.00fp',
    weight: FontWeight.Regular
  } } as TextPickerTextStyle;
  public isDisableTextStyleAnimation: boolean = false;
  public isDefaultTextStyle: boolean = false;
  public isSelectedTextStyle: boolean = false;
  public isTextStyle: boolean = false;
  public isDisappearTextStyle: boolean = false;
  public isCanLoop: boolean = false;
  public isDefaultPickerItemHeight: boolean = false;
  applyNormalAttribute(instance: TextPickerAttribute): void {
    instance
      .width('80%')
      .height('30%')
      .disableTextStyleAnimation(this.isDisableTextStyleAnimation ? true : undefined)
      .defaultTextStyle(this.isDefaultTextStyle ? this.textStyleValue : undefined)
      .selectedTextStyle(this.isSelectedTextStyle ? this.textStyleValue : undefined)
      .textStyle(this.isTextStyle ? this.textStyleValue : undefined)
      .disappearTextStyle(this.isDisappearTextStyle ? this.textStyleValue : undefined)
      .canLoop(this.isCanLoop ? false : undefined)
      .defaultPickerItemHeight(this.isDefaultPickerItemHeight ? 20.00 : undefined)
  }
}

@Entry
@Component
struct TextPickerModifier1 {
  private fruits: string[] = ['apple1', 'orange2', 'peach3', 'grape4', 'pear5'];
  @State modifier: MyModifier = new MyModifier();

  build() {
    Column() {
      Text('TextPicker')
      TextPicker({
        range: this.fruits
      })
        .attributeModifier(this.modifier)
        .id('textPicker_action_modifier')

      Row() {
        Button('0' + this.modifier.isDisableTextStyleAnimation).onClick((event: ClickEvent) => {
          this.modifier.isDisableTextStyleAnimation = !this.modifier.isDisableTextStyleAnimation;
        }).margin(5).id('disableTextStyleAnimation_action_modifier')
        Button('1' + this.modifier.isDefaultTextStyle).onClick((event: ClickEvent) => {
          this.modifier.isDefaultTextStyle = !this.modifier.isDefaultTextStyle;
        }).margin(5).id('defaultTextStyle_action_modifier')
        Button('2' + this.modifier.isSelectedTextStyle).onClick((event: ClickEvent) => {
          this.modifier.isSelectedTextStyle = !this.modifier.isSelectedTextStyle;
        }).margin(5).id('selectedTextStyle_action_modifier')
        Button('3' + this.modifier.isTextStyle).onClick((event: ClickEvent) => {
          this.modifier.isTextStyle = !this.modifier.isTextStyle;
        }).margin(5).id('textStyle_action_modifier')
      }

      Row() {
        Button('4' + this.modifier.isDisappearTextStyle).onClick((event: ClickEvent) => {
          this.modifier.isDisappearTextStyle = !this.modifier.isDisappearTextStyle;
        }).margin(5).id('disappearTextStyle_action_modifier')
        Button('5' + this.modifier.isCanLoop).onClick((event: ClickEvent) => {
          this.modifier.isCanLoop = !this.modifier.isCanLoop;
        }).margin(5).id('canLoop_action_modifier')
        Button('6' + this.modifier.isDefaultPickerItemHeight).onClick((event: ClickEvent) => {
          this.modifier.isDefaultPickerItemHeight = !this.modifier.isDefaultPickerItemHeight;
        }).margin(5).id('defaultPickerItemHeight_action_modifier')
      }
    }
    .width('100%')
    .height('100%')
  }
}