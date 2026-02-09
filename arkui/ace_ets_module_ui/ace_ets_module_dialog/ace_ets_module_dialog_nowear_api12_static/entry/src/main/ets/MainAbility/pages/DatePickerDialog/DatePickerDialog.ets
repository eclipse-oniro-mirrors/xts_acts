'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Entry, Column, Component, Flex, FlexDirection, ItemAlign, FlexAlign, Text, Button, FontWeight,
  DismissPopupAction,PopupOptions,Placement,PopupStateChangeParam,DismissReason,DialogAlignment,
  Row, ClickEvent, Margin, ColumnOptions, CalendarPickerDialog, ButtonType, ButtonStyleMode, ButtonRole, Color, FontStyle} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { UIContext } from '@ohos.arkui.UIContext';
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct DatePickerDialogExample {
  selectedDate: Date = new Date("2010-1-1")
  uiContext: UIContext = this.getUIContext()
  @State AppearText: string = ''

  build() {
    Row() {
      Column() {
        Text(this.AppearText)
          .fontSize(20)
          .margin(10)
          .id('AppearText')
        Button("DatePickerDialog")
          .id('DatePickerDialog')
          .margin(20)
          .onClick((e:ClickEvent) => {
            this.uiContext.showDatePickerDialog({
              alignment: DialogAlignment.Bottom,
              start: new Date("2000-1-1"),
              end: new Date("2100-12-31"),
              selected: this.selectedDate,
              showTime:true,
              useMilitaryTime:false,
              disappearTextStyle: {color: Color.Pink, font: {size: '22fp', weight: FontWeight.Bold}},
              textStyle: {color: '#ff00ff00', font: {size: '18fp', weight: FontWeight.Normal}},
              selectedTextStyle: {color: '#ff182431', font: {size: '14fp', weight: FontWeight.Regular}},
              onDateAccept: (value: Date) => {
                // 通过Date的setFullYear方法设置按下确定按钮时的日期，这样当弹窗再次弹出时显示选中的是上一次确定的日期
                this.selectedDate = value
                // console.info("DatePickerDialog:onDateAccept()" + value.toString())
              },
              onCancel: () => {
                console.info("DatePickerDialog:onCancel()")
              },
              onDateChange: (value: Date) => {
     
              },
              onDidAppear: () => {
                this.AppearText = this.AppearText + "onDidAppear_"
              },
              onDidDisappear: () => {
                this.AppearText = this.AppearText + "onDidDisappear"
              },
              onWillAppear: () => {
                this.AppearText = this.AppearText + "onWillAppear_"
              },
              onWillDisappear: () => {
                this.AppearText = this.AppearText + "onWillDisappear_"
              }
            })
          })
      }.width('100%')
    }.height('100%').id('row')
  }
}