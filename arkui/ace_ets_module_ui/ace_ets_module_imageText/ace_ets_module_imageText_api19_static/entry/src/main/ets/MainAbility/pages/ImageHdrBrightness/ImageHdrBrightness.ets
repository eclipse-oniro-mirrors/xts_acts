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
import { Entry, Component, Column, ColumnOptions, Text, Row, Image, $r, Flex, FlexOptions, FlexWrap, FlexAlign, Button, ClickEvent, Padding } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct ImageHdrBrightness {
  @State hdrBrightnessValue: double | undefined = 0.0

  build() {
    Column({space: 8} as ColumnOptions) {
      Text('hdrBrightness属性测试')
      Row() {
        Image($r('app.media.flower'))
          .width('32%')
          .aspectRatio(1)
          .hdrBrightness(this.hdrBrightnessValue)
          .key('hdrImageKey')
        Image($r('app.media.flower'))
          .width('32%')
          .aspectRatio(1)
          .key('noHdrBrightnessImageKey')
      }

      Flex({ wrap: FlexWrap.Wrap, alignContent: FlexAlign.Center } as FlexOptions) {
        Button('0.0')
          .id('hdr00')
          .onClick((e: ClickEvent) => {
            this.hdrBrightnessValue = 0.0
          })
        Button('0.3')
          .id('hdr03')
          .onClick((e: ClickEvent) => {
            this.hdrBrightnessValue = 0.3
          })
        Button('0.8')
          .id('hdr08')
          .onClick((e: ClickEvent) => {
            this.hdrBrightnessValue = 0.8
          })
        Button('1.0')
          .id('hdr10')
          .onClick((e: ClickEvent) => {
            this.hdrBrightnessValue = 1.0
          })
        Button('-1')
          .id('hdr_1')
          .onClick((e: ClickEvent) => {
            this.hdrBrightnessValue = -1
          })
        Button('2')
          .id('hdr20')
          .onClick((e: ClickEvent) => {
            this.hdrBrightnessValue = 2
          })
        Button('null')
          .id('hdrNull')
          .onClick((e: ClickEvent) => {

          })
        Button('undefined')
          .id('hdrUndefined')
          .onClick((e: ClickEvent) => {
            this.hdrBrightnessValue = undefined
          })
      }
    }.width('100%').padding({right: 10, top: 10} as Padding)
    .height('100%')
  }
}
