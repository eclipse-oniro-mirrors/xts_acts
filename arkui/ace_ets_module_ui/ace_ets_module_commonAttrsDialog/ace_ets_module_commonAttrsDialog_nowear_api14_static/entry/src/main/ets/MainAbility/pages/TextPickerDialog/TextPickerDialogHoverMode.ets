'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
  $$,
  $r,
  BindOptions,
  Button,
  ButtonType,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FlexOptions,
  FontWeight,
  HoverModeAreaType,
  Image,
  ItemAlign,
  Margin,
  Scroll,
  SheetOptions,
  SheetType,
  Text,
  TextAlign,
  TextPickerDialogOptions,
  TextPickerResult
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, Link, State } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';

@Entry
@Component
struct TextPickerDialogHoverMode {
  @State v: string = '';
  @State enableHoverMode: boolean = false
  @State hoverModeArea: HoverModeAreaType = HoverModeAreaType.TOP_SCREEN
  private select: int | int[] = 0 as int;
  private fruits: Array<string> = ['apple1', 'orange2', 'peach3', 'grape4', 'banana5'] as Array<string>;

  build() {
    Column({ space: 20 } as ColumnOptions) {
      Button('change enableHoverMode ' + this.enableHoverMode)
        .id('btn1')
        .onClick((e: ClickEvent) => {
          this.enableHoverMode = true
        })
      Button('change hoverModeArea ' + this.hoverModeArea)
        .id('btn2')
        .onClick((e: ClickEvent) => {
          this.hoverModeArea = HoverModeAreaType.BOTTOM_SCREEN
        })
      Button('TextPickerDialog:' + this.v)
        .id('textPickerDialog')
        .margin(20)
        .onClick((e: ClickEvent) => {
          this.getUIContext().showTextPickerDialog({
            range: this.fruits,
            selected: this.select,
            disappearTextStyle: { color: Color.Red, font: { size: 15, weight: FontWeight.Lighter } },
            textStyle: { color: Color.Black, font: { size: 20, weight: FontWeight.Normal } },
            selectedTextStyle: { color: Color.Blue, font: { size: 30, weight: FontWeight.Bolder } },
            onAccept: (value: TextPickerResult) => {
              this.select = value.index;
              console.log(this.select + '');
              this.v = value.value as string;
              console.info('TextPickerDialog:onAccept()' + JSON.stringify(value));
            },
            onCancel: () => {
              console.info('TextPickerDialog:onCancel()');
            },
            onChange: (value: TextPickerResult) => {
              console.info('TextPickerDialog:onChange()' + JSON.stringify(value));
            },
            onScrollStop: (value: TextPickerResult) => {
              console.info('TextPickerDialog:onScrollStop()' + JSON.stringify(value));
            },
            onDidAppear: () => {
              console.info('TextPickerDialog:onDidAppear()');
            },
            onDidDisappear: () => {
              console.info('TextPickerDialog:onDidDisappear()');
            },
            onWillAppear: () => {
              console.info('TextPickerDialog:onWillAppear()');
            },
            onWillDisappear: () => {
              console.info('TextPickerDialog:onWillDisappear()');
            },
            enableHoverMode: this.enableHoverMode,
            hoverModeArea: this.hoverModeArea
          } as TextPickerDialogOptions)
        })
    }
    .id('col')
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}