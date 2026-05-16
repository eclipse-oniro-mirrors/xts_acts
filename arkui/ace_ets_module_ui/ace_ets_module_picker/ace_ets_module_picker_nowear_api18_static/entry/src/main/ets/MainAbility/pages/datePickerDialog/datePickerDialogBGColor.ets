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
import { Entry, Column, Component, $r, ResourceColor, Flex, FlexWrap, Button, Color, BlurStyle, ShadowStyle, ClickEvent, Margin, Resource } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct DatePickerDialogBGColor {
  showDialog(color: null|undefined|Color|Double|String|Resource) {
  this.getUIContext().showDatePickerDialog({
    start: new Date('2000-1-1'),
    end: new Date('2100-12-31'),
    backgroundColor: (color as undefined|Color|Int|String|Resource),
    backgroundBlurStyle: BlurStyle.NONE,
    dateTimeOptions: { hour: 'numeric', minute: '2-digit' },
  })
}
  build() {
    Flex({wrap: FlexWrap.Wrap}) {
      Button('Color.White')
        .onClick((e: ClickEvent) => {
          this.showDialog(Color.White)
        })
        .id('ColorWhiteID')
      Button('rgb(255, 100, 255)')
        .onClick((e: ClickEvent) => {
          this.showDialog('rgb(255, 100, 255)')
        })
        .id('rgb(255, 100, 255)ID')
      Button('0x008080')
        .onClick((e: ClickEvent) => {
          this.showDialog(0x008080)
        })
        .id('0x008080ID')
      Button('#00FFFF')
        .onClick((e: ClickEvent) => {
          this.showDialog('#00FFFF')
        })
        .id('00FFFFID')
      Button('$r(app.color.blue)')
        .onClick((e: ClickEvent) => {
          this.showDialog($r('app.color.blue'))
        })
        .id('colorBlueID')

      Button('null')
        .onClick((e: ClickEvent) => {
          this.showDialog(null)
        })
        .id('nullID')
      Button('undefined')
        .onClick((e: ClickEvent) => {
          this.showDialog(undefined)
        })
        .id('undefinedID')
      Button('xxx')
        .onClick((e: ClickEvent) => {
          this.showDialog('xxx')
        })
        .id('xxxID')
      Button('-100')
        .onClick((e: ClickEvent) => {
          this.showDialog(-100)
        })
        .id('-100ID')
    }.width('100%')
  }
}