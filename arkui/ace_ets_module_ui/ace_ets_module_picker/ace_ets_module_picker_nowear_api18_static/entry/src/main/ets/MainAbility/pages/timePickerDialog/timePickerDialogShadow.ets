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
import { Entry, Column, ColumnOptions, Component, $r, Button, ClickEvent, ShadowStyle, Flex, FlexWrap, ShadowOptions, TimePickerFormat, ShadowType, Color } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TimePickerDialogShadow {
  showDialog(shadow: ShadowOptions | ShadowStyle) {
    this.getUIContext().showTimePickerDialog({
      format: TimePickerFormat.HOUR_MINUTE,
      useMilitaryTime: false,
      dateTimeOptions: { hour: 'numeric', minute: '2-digit' },
      shadow: shadow,
    })
}
  build() {
    Flex({wrap: FlexWrap.Wrap}) {
      Button('ShadowOptions')
        .onClick((e: ClickEvent) => {
          this.showDialog({
            radius: 30,
            type: ShadowType.COLOR,
            color: Color.Red,
            offsetX: 100,
            offsetY: 100,
            fill: true,
          } as ShadowOptions)
        })
        .id('shadowOptionID')
      Button('OUTER_DEFAULT_XS')
        .onClick((e: ClickEvent) => {
          this.showDialog(ShadowStyle.OUTER_DEFAULT_XS)
        })
        .id('OUTER_DEFAULT_XS_ID')
      Button('OUTER_DEFAULT_SM')
        .onClick((e: ClickEvent) => {
          this.showDialog(ShadowStyle.OUTER_DEFAULT_SM)
        })
        .id('OUTER_DEFAULT_SM_ID')
      Button('OUTER_DEFAULT_MD')
        .onClick((e: ClickEvent) => {
          this.showDialog(ShadowStyle.OUTER_DEFAULT_MD)
        })
        .id('OUTER_DEFAULT_MD_ID')
      Button('OUTER_DEFAULT_LG')
        .onClick((e: ClickEvent) => {
          this.showDialog(ShadowStyle.OUTER_DEFAULT_LG)
        })
        .id('OUTER_DEFAULT_LG_ID')

      Button('OUTER_FLOATING_SM')
        .onClick((e: ClickEvent) => {
          this.showDialog(ShadowStyle.OUTER_FLOATING_SM)
        })
        .id('OUTER_FLOATING_SM_ID')
      Button('OUTER_FLOATING_MD')
        .onClick((e: ClickEvent) => {
          this.showDialog(ShadowStyle.OUTER_FLOATING_MD)
        })
        .id('OUTER_FLOATING_MD_ID')
    }.width('100%')
  }
}