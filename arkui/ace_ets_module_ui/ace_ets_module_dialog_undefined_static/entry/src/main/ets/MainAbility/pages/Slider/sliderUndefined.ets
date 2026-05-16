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
import {
  Entry,
  Text,
  Column,
  ColumnOptions,
  Component,
  Button,
  ClickEvent,
  Color,
  Row,
  $r,
  Radio,
  RadioStyle,
  RowOptions,
  Slider,
  SliderOptions,
  SliderStyle
} from '@ohos.arkui.component'
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

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Slider({
        value: 4,
        min: 0,
        max: 10,
        style: SliderStyle.InSet
      } as SliderOptions)
        .id('Slider_1')
        .showSteps(true)
        .stepColor(this.isUndefined1 ? undefined : Color.Red)
        .stepSize(this.isUndefined2 ? undefined : '8vp')
        .trackBorderRadius(this.isUndefined3 ? undefined : '1vp')
        .trackColor(this.isUndefined4 ? undefined : '#FFFFCC00')
        .trackThickness(this.isUndefined5 ? undefined : '25vp')
      Row() {
        Button('btn1 : ' + this.isUndefined1)
          .id('Slider_btn1')
          .onClick((e: ClickEvent) => {
            this.isUndefined1 = !this.isUndefined1
          })
        Button('btn2 : ' + this.isUndefined2)
          .id('Slider_btn2')
          .onClick((e: ClickEvent) => {
            this.isUndefined2 = !this.isUndefined2
          })
        Button('btn3 : ' + this.isUndefined3)
          .id('Slider_btn3')
          .onClick((e: ClickEvent) => {
            this.isUndefined3 = !this.isUndefined3
          })
      }

      Row() {

        Button('btn4 : ' + this.isUndefined4)
          .id('Slider_btn4')
          .onClick((e: ClickEvent) => {
            this.isUndefined4 = !this.isUndefined4
          })

        Button('btn5 : ' + this.isUndefined5)
          .id('Slider_btn5')
          .onClick((e: ClickEvent) => {
            this.isUndefined5 = !this.isUndefined5
          })
      }
    }
    .width('100%').height('100%')
  }
}