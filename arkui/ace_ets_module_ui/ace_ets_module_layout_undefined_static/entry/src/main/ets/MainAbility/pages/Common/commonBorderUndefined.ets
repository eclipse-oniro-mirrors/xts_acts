'use static'
/**
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

import {  Entry,  Text,  Column,  ColumnOptions,  Component,  Button,  ClickEvent,  Color,  Row,  $r,
  BorderOptions,  BorderStyle, TextAlign, GradientDirection, RepeatMode,
  BorderImageOption } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct Index {
  @State isUndefined1: boolean = true;
  @State isUndefined2: boolean = true;
  @State isUndefined3: boolean = true;
  @State isUndefined4: boolean = true;
  @State isUndefined5: boolean = true;
  @State isUndefined6: boolean = true;
  build() {
    Column({space : 5} as ColumnOptions) {
      Button('border1')
        .id('Border_1')
        .border(this.isUndefined1 ? undefined : { width: 5.0 } as BorderOptions)
      Button('border2')
        .id('Border_2')
        .borderStyle(this.isUndefined2 ? undefined : BorderStyle.Dashed)
        .borderWidth(this.isUndefined3 ? undefined : 3.0)
        .borderColor(this.isUndefined4 ? undefined : Color.Red)
        .borderRadius(this.isUndefined5 ? undefined : 5.0)
      Button('border3')
        .id('Border_3')
        .borderImage(this.isUndefined6 ? undefined : {
          source: {
            angle: 90,
            direction: GradientDirection.Left,
            colors: [[0xAEE1E1, 0.0], [0xD3E0DC, 0.3], [0xFCD1D1, 1.0]]
          },
          slice: '10px',
          width: '10px',
          repeat: RepeatMode.Stretch,
          fill: false
        } as BorderImageOption)

      Row() {
        Button('btn1 : ' + this.isUndefined1)
          .id('Border_btn1')
          .onClick((e: ClickEvent) => {
            this.isUndefined1 = !this.isUndefined1
          })
        Button('btn2 : ' + this.isUndefined2)
          .id('Border_btn2')
          .onClick((e: ClickEvent) => {
            this.isUndefined2 = !this.isUndefined2
          })
        Button('btn3 : ' + this.isUndefined3)
          .id('Border_btn3')
          .onClick((e: ClickEvent) => {
            this.isUndefined3 = !this.isUndefined3
          })
      }

      Row() {
        Button('btn4 : ' + this.isUndefined4)
          .id('Border_btn4')
          .onClick((e: ClickEvent) => {
            this.isUndefined4 = !this.isUndefined4
          })
        Button('btn5 : ' + this.isUndefined5)
          .id('Border_btn5')
          .onClick((e: ClickEvent) => {
            this.isUndefined5 = !this.isUndefined5
          })
        Button('btn6 : ' + this.isUndefined6)
          .id('Border_btn6')
          .onClick((e: ClickEvent) => {
            this.isUndefined6 = !this.isUndefined6
          })
      }
    }

  }
}