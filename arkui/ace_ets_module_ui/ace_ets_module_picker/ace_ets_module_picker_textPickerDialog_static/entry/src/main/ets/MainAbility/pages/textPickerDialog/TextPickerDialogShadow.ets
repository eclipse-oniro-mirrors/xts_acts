'use static';
/*
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
import { Entry, Column, ColumnOptions, RowOptions, Component, Row, Button, ClickEvent, ShadowOptions, ShadowStyle,
  Flex, FlexWrap, ShadowType, Color,TextPickerDialogOptions, TextPickerDialogOptionsExt } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextPickerDialogShadow {
  showDialog(shadow: ShadowOptions | ShadowStyle) {
    this.getUIContext().showTextPickerDialog({
      range: ['apple1', 'orange2', 'peach3', 'grape4', 'banana5'],
      shadow: shadow,
    } as TextPickerDialogOptionsExt)
  }
  build() {
    Flex({wrap: FlexWrap.Wrap}) {
      Button('ShadowOptions')
        .onClick((e: ClickEvent) => {
          this.showDialog({
            radius: 30,
            color: Color.Red,
            offsetX: 100,
            offsetY: 100,
          } as ShadowOptions)
        })
        .id('shadow1')
      Button('OUTER_DEFAULT_XS')
        .onClick((e: ClickEvent) => {
          this.showDialog(ShadowStyle.OUTER_DEFAULT_XS)
        })
        .id('shadow2')
      Button('OUTER_DEFAULT_SM')
        .onClick((e: ClickEvent) => {
          this.showDialog(ShadowStyle.OUTER_DEFAULT_SM)
        })
        .id('shadow3')
      Button('OUTER_DEFAULT_MD')
        .onClick((e: ClickEvent) => {
          this.showDialog(ShadowStyle.OUTER_DEFAULT_MD)
        })
        .id('shadow4')
      Button('OUTER_DEFAULT_LG')
        .onClick((e: ClickEvent) => {
          this.showDialog(ShadowStyle.OUTER_DEFAULT_LG)
        })
        .id('shadow5')

      Button('OUTER_FLOATING_SM')
        .onClick((e: ClickEvent) => {
          this.showDialog(ShadowStyle.OUTER_FLOATING_SM)
        })
        .id('shadow6')
      Button('OUTER_FLOATING_MD')
        .onClick((e: ClickEvent) => {
          this.showDialog(ShadowStyle.OUTER_FLOATING_MD)
        })
        .id('shadow7')
    }.width('100%')
  }
}
