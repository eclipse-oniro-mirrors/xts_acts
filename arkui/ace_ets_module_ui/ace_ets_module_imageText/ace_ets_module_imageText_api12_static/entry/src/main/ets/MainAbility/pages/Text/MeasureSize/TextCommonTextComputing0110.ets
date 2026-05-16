'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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

import { MeasureUtils, UIContext } from '@ohos.arkui.UIContext';
import MeasureText  from '@ohos.measure';
import { Entry, Component, Column, Row, Text, Button, ClickEvent , Margin, Color, SizeOptions } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextCommonTextComputing0110 {
  @State measure: MeasureUtils | undefined = undefined;
  @State message: string = 'this message is test for measureTextSize';
  @State textComputing0110_1: number = MeasureText.measureText({
    textContent: this.message,
    maxLines: 2
  })
  @State textComputing0110_2: SizeOptions = MeasureText.measureTextSize({
    textContent: this.message,
    maxLines: 2
  })
  @State textComputing0110_12: number = 0
  @State textComputing0110_22: SizeOptions = {width:0,height:0} as SizeOptions
  onPageShow(){
    this.measure = this.getUIContext().getMeasureUtils()
    this.textComputing0110_12 = this.getUIContext().getMeasureUtils().measureText({
      textContent: this.message,
      maxLines: 2
    })
    this.textComputing0110_22 = this.getUIContext().getMeasureUtils().measureTextSize({
      textContent: this.message,
      maxLines: 2
    })
  }
  build() {
    Row() {
      Column() {
        Column() {
          Text(this.message)
            .maxLines(5)
            .key('textComputing0110_tx')
            .margin(15)
            .fontSize(20)
            .fontColor(Color.Blue)
          Text('width: ' + this.textComputing0110_1).key('textComputing0110_1')
          Text('width: ' + this.textComputing0110_12).key('textComputing0110_12')
          Text('width: ' + this.textComputing0110_2.width).key('textComputing0110_2')
          Text('width: ' + this.textComputing0110_22.width).key('textComputing0110_22')
        }.width('95%').borderWidth(3)

        Row() {
          Button('fontSize_20')
            .id('fontSize_20').margin(20)
            .onClick((e:ClickEvent) => {
              this.message = 'this message is test for measure fontSize:20fp';
              this.textComputing0110_1 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                fontSize: '20fp'
              })
              this.textComputing0110_2 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                fontSize: '20fp'
              })
              this.textComputing0110_12 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                fontSize: '20fp'
              })
              this.textComputing0110_22 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                fontSize: '20fp'
              })
            })
          Button('fontSize_$-30')
            .id('fontSize_30').margin(20)
            .onClick((e:ClickEvent) => {
              this.message = 'this message is test for measure fontSize:$-30';
              this.textComputing0110_1 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                fontSize: '$-30'
              })
              this.textComputing0110_2 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                fontSize: '$-30'
              })
              this.textComputing0110_12 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                fontSize: '$-30'
              })
              this.textComputing0110_22 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                fontSize: '$-30'
              })
            })
        }.width('100%').margin({ top: 30 } as Margin)

        Row() {
          Button('fontSize_-10')
            .id('fontSize_-10').margin({ left: 20 } as Margin)
            .onClick((e:ClickEvent) => {
              this.message = 'this message is test for measure fontSize -10';
              this.textComputing0110_1 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                fontSize: -10
              })
              this.textComputing0110_2 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                fontSize: -10
              })
              this.textComputing0110_12 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                fontSize: -10
              })
              this.textComputing0110_22 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                fontSize: -10
              })
            })
          Button('fontSize_calc')
            .id('fontSize_calc').margin({ left: 20 } as Margin)
            .onClick((e:ClickEvent) => {
              this.message = 'this message is test for measure fontSize calc(20%-20px)';
              this.textComputing0110_1 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                fontSize: 'calc(20%-20px)'
              })
              this.textComputing0110_2 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                fontSize: 'calc(20%-20px)'
              })
              this.textComputing0110_12 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                fontSize: 'calc(20%-20px)'
              })
              this.textComputing0110_22 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                fontSize: 'calc(20%-20px)'
              })
            })
        }.width('100%')

        Button('fontSize_50%')
          .id('fontSize_50%').margin(20)
          .onClick((e:ClickEvent) => {
            this.message = 'this message is test for measure fontSize 50%';
            this.textComputing0110_1 = this.measure!.measureText({
              textContent: this.message,
              maxLines: 2,
              fontSize: '50%'
            })
            this.textComputing0110_2 = this.measure!.measureTextSize({
              textContent: this.message,
              maxLines: 2,
              fontSize: '50%'
            })
            this.textComputing0110_12 = this.measure!.measureText({
              textContent: this.message,
              maxLines: 2,
              fontSize: '50%'
            })
            this.textComputing0110_22 = this.measure!.measureTextSize({
              textContent: this.message,
              maxLines: 2,
              fontSize: '50%'
            })
          })
      }
      .height('100%')
      .width('100%')
    }
    .height('100%')
  }
}