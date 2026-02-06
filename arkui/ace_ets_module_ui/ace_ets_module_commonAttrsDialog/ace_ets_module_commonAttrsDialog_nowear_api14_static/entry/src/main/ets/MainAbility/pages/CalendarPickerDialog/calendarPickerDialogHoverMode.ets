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
  CalendarDialogOptions,
  CalendarPickerDialog,
  ClickEvent,
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
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, Link, State } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';

@Entry
@Component
struct calendarPickerDialogHoverMode {
  @State enableHoverMode: boolean = false
  @State hoverModeArea: HoverModeAreaType = HoverModeAreaType.TOP_SCREEN
  private selectedDate: Date = new Date('2024-04-23');

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
      Button('Show CalendarPicker Dialog')
        .id('calendarPickerDialog')
        .margin(20)
        .onClick((e: ClickEvent) => {
          console.info('CalendarDialog.show')
          CalendarPickerDialog.show({
            selected: this.selectedDate,
            onAccept: (value: Date): void => {
              console.info('calendar onAccept:' + JSON.stringify(value))
            },
            onCancel: () => {
              console.info('calendar onCancel')
            },
            onChange: (value: Date): void => {
              console.info('calendar onChange:' + JSON.stringify(value))
            },
            onDidAppear: () => {
              console.info('calendar onDidAppear')
            },
            onDidDisappear: () => {
              console.info('calendar onDidDisappear')
            },
            onWillAppear: () => {
              console.info('calendar onWillAppear')
            },
            onWillDisappear: () => {
              console.info('calendar onWillDisappear')
            },
            enableHoverMode: this.enableHoverMode,
            hoverModeArea: this.hoverModeArea,
          } as CalendarDialogOptions)
        })
    }
    .id('col')
    .justifyContent(FlexAlign.Center)
    .height('100%')
    .width('100%')
  }
}