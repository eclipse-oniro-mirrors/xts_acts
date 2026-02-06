'use static';
/*
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
import common from '@ohos.app.ability.common';
import window from '@ohos.window';
import router from '@ohos.router';
import {
  Entry,
  Component,
  Column,
  Text,
  Margin,
  Row,
  ClickEvent,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow,
  Color,
  $r,
  DatePicker,
  Button
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct DatePickerDialogExample {

  private changeOrientation(isLandscape: boolean) {
    // 获取UIAbility实例的上下文信息
    let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
    // 调用该接口手动改变设备横竖屏状态
    window.getLastWindow(context).then((lastWindow) => {
      lastWindow.setPreferredOrientation(isLandscape ? window.Orientation.LANDSCAPE : window.Orientation.PORTRAIT)
    });
  }
  selectedDate: Date = new Date("2010-2-2")

  build() {
    Column() {
      Button('Landscape')
        .fontColor(Color.Black)
        .focusable(true)
        .onClick((e:ClickEvent) => {
          this.changeOrientation(true);
        })

      Button('Portrait')
        .fontColor(Color.Black)
        .focusable(true)
        .onClick((e:ClickEvent) => {
          this.changeOrientation(false);
        })
      Button("DatePickerDialog")
        .margin(20)
        .onClick((e:ClickEvent) => {
          this.getUIContext().showDatePickerDialog({
            start: new Date("2000-1-1"),
            end: new Date("2100-12-31"),
            selected: this.selectedDate,
            onDateAccept: (value: Date) => {
              console.info("DatePickerDialog:onAccept()" + value.toString())
            },
            onCancel: () => {
              console.info("DatePickerDialog:onCancel()")
            },
            onDateChange: (value: Date) => {
              console.info("DatePickerDialog:onChange()" + value.toString())
            }
          })
        })

      Button("DatePickerDialog")
        .margin(20)
        .onClick((e:ClickEvent) => {
          this.getUIContext().showDatePickerDialog({
            start: new Date("2000-1-1"),
            end: new Date("2100-12-31"),
            selected: this.selectedDate,
            lunar: false,
            showTime: true,
            onDateAccept: (value: Date) => {
              this.selectedDate = value
              console.info("DatePickerDialog:onDateAccept()" + value.toString())
            },
            onCancel: () => {
              console.info("DatePickerDialog:onCancel()")
            },
            onDateChange: (value: Date):void => {
              console.info("DatePickerDialog:onDateChange()" + value.toString())
            }
          })
        })
      DatePicker({
        start: new Date('1970-1-1'),
        end: new Date('2100-1-1'),
        selected: this.selectedDate
      })
        .key('Stage_DatePicker_Test_0010')
        .id('Stage_DatePicker_Test_0010')
        .onDateChange((value: Date):void => {
          console.info('DatePicker:onDateChange() select current date is: ' + value.toString())
        })
    }.width('100%')
  }
}