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

import {
  Entry, Component,
  Column, ColumnOptions, Row, RowOptions, Color,
  Text, Button, FontWeight, ClickEvent, Margin, 
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct UIContextApi1 {
  @State inputValue: string = ''
  @State btColor: Color = Color.Blue

  build() {
    Column({ space: 20 } as ColumnOptions) {
      Column({ space: 5 } as ColumnOptions) {
        Button('button1')
          .width(200)
          .height(70)
          .fontColor(Color.White)
          .focusOnTouch(true)
          .backgroundColor(this.btColor)
          .defaultFocus(true)
          .onFocus(() => {
            this.btColor = Color.Red
          })
          .onBlur(() => {
            this.btColor = Color.Blue
          })
          .id('UIContextApi1_btn1')
        Button('clearFocus')
          .width(200)
          .height(70)
          .fontColor(Color.White)
          .backgroundColor(Color.Blue)
          .onClick((e:ClickEvent) => {
            this.getUIContext().getFocusController().clearFocus()
          })
          .id('UIContextApi1_btn2')
      }
    }
    .width('100%')
    .height('100%')
  }
}