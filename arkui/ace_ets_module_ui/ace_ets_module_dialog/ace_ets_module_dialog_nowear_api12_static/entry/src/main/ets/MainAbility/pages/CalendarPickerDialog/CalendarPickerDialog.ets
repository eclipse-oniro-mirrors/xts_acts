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
  Row, ClickEvent, Margin, ColumnOptions, CalendarPickerDialog, ButtonType, ButtonStyleMode, ButtonRole, Color, FontStyle} from '@ohos.arkui.component'
import { UIContext } from '@ohos.arkui.UIContext';
import events_emitter from '@ohos.events.emitter';
import { State } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct CalendarPickerDialogExample {
  private selectedDate: Date = new Date()
  @State AppearText: string = ''
  // onWillAppear_onDidAppear_onWillDisappear_onDidDisappear
  build() {
    Row() {
      Column() {
        Text(this.AppearText)
          .fontSize(20)
          .margin(10)
          .id('AppearText')
        Button("Show CalendarPicker Dialog")
          .margin(20)
          .id('CalendarPicker')
          .onClick((e:ClickEvent) => {
            console.info("CalendarDialog.show")
            CalendarPickerDialog.show({
              selected: this.selectedDate,
              onAccept: (value: Date):void => {
                console.info("calendar onAccept:" + JSON.stringify(value))
              },
              onCancel: () => {
                console.info("calendar onCancel")
              },
              onChange: (value:Date):void => {
                console.info("calendar onChange:" + JSON.stringify(value))
              },
              onDidAppear: () => {
                console.info("============================: onDidAppear")
                this.AppearText = this.AppearText + "onDidAppear_"
              },
              onDidDisappear: () => {
                console.info("============================: onDidDisappear")
                this.AppearText = this.AppearText + "onDidDisappear"
              },
              onWillAppear: () => {
                console.info("============================: onWillAppear_")
                this.AppearText = this.AppearText + "onWillAppear_"
              },
              onWillDisappear: () => {
                console.info("============================: onWillDisappear_")
                this.AppearText = this.AppearText + "onWillDisappear_"
              }
            })
          })
      }.width('100%')
    }.height('100%').id('row')
  }
}