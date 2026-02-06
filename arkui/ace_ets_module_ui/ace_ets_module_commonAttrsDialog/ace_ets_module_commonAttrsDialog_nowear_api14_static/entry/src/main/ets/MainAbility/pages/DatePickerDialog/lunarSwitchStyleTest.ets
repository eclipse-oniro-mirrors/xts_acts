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
  Color,
  Column,
  ColumnOptions,
  Component,
  DatePickerDialogOptions,
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
  TextAlign
} from '@ohos.arkui.component';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, Link, State } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';

@Entry
@Component
struct lunarSwitchStyleTest {
  selectedDate: Date = new Date('2010-1-1')
  @State lunar: string = ''

  build() {
    Column() {
      Text('' + this.lunar)
        .id('text')
      Button('Lunar DatePickerDialog')
        .id('btn')
        .margin(20)
        .onClick((e: ClickEvent) => {
          this.getUIContext().showDatePickerDialog({
            start: new Date('2000-1-1'),
            end: new Date('2100-12-31'),
            selected: this.selectedDate,
            lunar: true,
            lunarSwitch: true,
            lunarSwitchStyle: {
              selectedColor: Color.Pink,
              strokeColor: Color.Green,
              unselectedColor: Color.Grey
            },
            disappearTextStyle: { color: Color.Pink, font: { size: '22fp', weight: FontWeight.Bold } },
            textStyle: { color: '#ff00ff00', font: { size: '18fp', weight: FontWeight.Normal } },
            selectedTextStyle: { color: '#ff182431', font: { size: '14fp', weight: FontWeight.Regular } },
            onDateAccept: (value: Date) => {
              this.selectedDate = value
              console.info('DatePickerDialog:onDateAccept()' + value.toString())
            },
            onCancel: () => {
              console.info('DatePickerDialog:onCancel()')
            },
            onDateChange: (value: Date) => {
              console.info('DatePickerDialog:onDateChange()' + value.toString())
            },
            onDidAppear: () => {
              console.info('DatePickerDialog:onDidAppear()')
            },
            onDidDisappear: () => {
              this.lunar = 'lunarSwitchStyle'
              console.info('DatePickerDialog:onDidDisappear()')
            },
            onWillAppear: () => {
              console.info('DatePickerDialog:onWillAppear()')
            },
            onWillDisappear: () => {
              console.info('DatePickerDialog:onWillDisappear()')
            }
          } as DatePickerDialogOptions)
        })
    }.width('100%')
  }
}