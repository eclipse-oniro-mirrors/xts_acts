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
  Entry,
  Component,
  $r,
  Column,
  ColumnOptions,
  Text,
  Color,
  Flex,
  FlexDirection,
  ItemAlign,
  Row,
  Button,
  ClickEvent,
  Week,
  FontWeight,RowOptions,
  Axis,AlertDialogParamWithButtons,DialogAlignment,DialogButtonStyle,DialogAlignment,
  Margin,TransitionEffect,FlexAlign,TransitionEdge,AlertDialogParamWithConfirm,
  PickerTextStyle, CalendarAlign, CalendarPicker,Builder,TextOverflow, TextHeightAdaptivePolicy,
  ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController
} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef
} from '@ohos.arkui.stateManagement';

@Entry
@Component
struct DatePickerDialogOptions0 {
  @State isLunar: boolean = false
  selectedDate: Date = new Date("2023-7-24")

  build() {
    Column() {
      Button("DatePickerDialog")
        .margin(20)
        .onClick(() : void => {
          this.getUIContext().showDatePickerDialog({
            alignment: DialogAlignment.TopStart,
            offset: { dx: 10, dy: 100 },
            maskRect: { x: 0, y: 90, width: 1000, height: 250  },
            start: new Date("2000-1-1"),
            end: new Date("2100-12-31"),
            selected: this.selectedDate,
            lunarSwitch:true,
            lunar: this.isLunar,
            showTime:true,
            useMilitaryTime:false,
            onDateAccept: (value: Date)=> {
              this.selectedDate = value
              console.info("DatePickerDialog:onDateAccept()" + value.toString())
            },
            onCancel:()=> {
              console.info("DatePickerDialog: onCancel()")
            },
            onDateChange: (value: Date)=> {
              console.info("DatePickerDialog: onChange()" + value.toString())
            }
          })
        }).key('DatePickerDialog')
		
    }.width('100%')
  }
}