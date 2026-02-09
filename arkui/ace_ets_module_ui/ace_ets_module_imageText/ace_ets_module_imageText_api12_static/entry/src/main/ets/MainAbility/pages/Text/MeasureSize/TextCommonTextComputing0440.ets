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
import { Entry, Component, Column, Row, Text, Button, ClickEvent, Margin, Color, SizeOptions } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextCommonTextComputing0440 {
  @State measure: MeasureUtils | undefined = undefined;
  @State message: string = 'this message is test for measureTextSize';
  @State textComputing0440_1: number = MeasureText.measureText({
    textContent: this.message
  })
  @State textComputing0440_2: SizeOptions = MeasureText.measureTextSize({
    textContent: this.message
  })
  @State textComputing0440_12: number = 0
  @State textComputing0440_22: SizeOptions = { width:0,height:0} as SizeOptions
  onPageShow(){
    this.measure = this.getUIContext().getMeasureUtils()
    this.textComputing0440_12 = this.getUIContext().getMeasureUtils().measureText({
      textContent: this.message,
    })
    this.textComputing0440_22 = this.getUIContext().getMeasureUtils().measureTextSize({
      textContent: this.message,
    })
  }
  build() {
    Row() {
      Column() {
        Column() {
          Text(this.message)
            .maxLines(5)
            .key('textComputing0440_tx')
            .margin(15)
            .fontSize(20)
            .fontColor(Color.Blue)
          Text('width: ' + this.textComputing0440_1).key('textComputing0440_1')
          Text('width: ' + this.textComputing0440_12).key('textComputing0440_12')
          Text('width: ' + this.textComputing0440_2.width).key('textComputing0440_2')
          Text('width: ' + this.textComputing0440_22.width).key('textComputing0440_22')
        }.width('95%').borderWidth(3)

        Row() {
          Button('maxLines_1')
            .id('maxLines_1').margin(10)
            .onClick((e:ClickEvent) => {
              this.message = 'this message is test for measure maxLines 1';
              this.textComputing0440_1 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 1
              })
              this.textComputing0440_2 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 1
              })
              this.textComputing0440_12 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 1
              })
              this.textComputing0440_22 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 1
              })
            })
          Button('maxLines_10')
            .id('maxLines_10').margin(10)
            .onClick((e:ClickEvent) => {
              this.message = 'this message is test for measure maxLines 10';
              this.textComputing0440_1 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 10
              })
              this.textComputing0440_2 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 10
              })
              this.textComputing0440_12 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 10
              })
              this.textComputing0440_22 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 10
              })
            })
        }.width('100%').margin({ top: 30 } as Margin)

        Row() {
          Button('maxLines_-5')
            .id('maxLines_-5').margin({ left: 10 } as Margin)
            .onClick((e:ClickEvent) => {
              this.message = 'this message is test for measure maxLines -5';
              this.textComputing0440_1 = this.measure!.measureText({
                textContent: this.message,
                maxLines: -5
              })
              this.textComputing0440_2 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: -5
              })
              this.textComputing0440_12 = this.measure!.measureText({
                textContent: this.message,
                maxLines: -5
              })
              this.textComputing0440_22 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: -5
              })
            })
        }.width('100%').margin({ top: 30 } as Margin)

        Row() {
          Button('lineHeight_-10')
            .id('lineHeight_-10').margin({ left: 10 } as Margin)
            .onClick((e:ClickEvent) => {
              this.message = 'this message is test for measure lineHeight -10';
              this.textComputing0440_1 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                lineHeight: -10
              })
              this.textComputing0440_2 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                lineHeight: -10
              })
              this.textComputing0440_12 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                lineHeight: -10
              })
              this.textComputing0440_22 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                lineHeight: -10
              })
            })
          Button('lineHeight_330')
            .id('lineHeight_330').margin({ left: 10 } as Margin)
            .onClick((e:ClickEvent) => {
              this.message = 'this message is test for measure lineHeight 330vp';
              this.textComputing0440_1 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                lineHeight: '330vp'
              })
              this.textComputing0440_2 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                lineHeight: '330vp'
              })
              this.textComputing0440_12 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                lineHeight: '330vp'
              })
              this.textComputing0440_22 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                lineHeight: '330vp'
              })
            })
        }.width('100%').margin({ top: 30 } as Margin)

        Row() {
          Button('lineHeight_320')
            .id('lineHeight_320').margin({ left: 10 } as Margin)
            .onClick((e:ClickEvent) => {
              this.message = 'this message is test for measure lineHeight 320';
              this.textComputing0440_1 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                lineHeight: 320
              })
              this.textComputing0440_2 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                lineHeight: 320
              })
              this.textComputing0440_12 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                lineHeight: 320
              })
              this.textComputing0440_22 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                lineHeight: 320
              })
            })

          Button('lineHeight_15')
            .id('lineHeight_15').margin({ left: 10 } as Margin)
            .onClick((e:ClickEvent) => {
              this.message = 'this message is test for measure lineHeight 15';
              this.textComputing0440_1 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                lineHeight: 15
              })
              this.textComputing0440_2 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                lineHeight: 15
              })
              this.textComputing0440_12 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                lineHeight: 15
              })
              this.textComputing0440_22 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                lineHeight: 15
              })
            })
        }.width('100%').margin({ top: 30 } as Margin)

        Row() {
          Button('baselineOffset_10vp')
            .id('baselineOffset_10vp').margin({ left: 10 } as Margin)
            .onClick((e:ClickEvent) => {
              this.message = 'this message is test for measure baselineOffset 10vp';
              this.textComputing0440_1 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                baselineOffset: '10vp'
              })
              this.textComputing0440_2 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                baselineOffset: '10vp'
              })
              this.textComputing0440_12 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                baselineOffset: '10vp'
              })
              this.textComputing0440_22 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                baselineOffset: '10vp'
              })
            })

          Button('baselineOffset_0')
            .id('baselineOffset_0').margin({ left: 10 } as Margin)
            .onClick((e:ClickEvent) => {
              this.message = 'this message is test for measure baselineOffset 0';
              this.textComputing0440_1 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                baselineOffset: 0
              })
              this.textComputing0440_2 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                baselineOffset: 0
              })
              this.textComputing0440_12 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                baselineOffset: 0
              })
              this.textComputing0440_22 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                baselineOffset: 0
              })
            })
        }.width('100%').margin({ top: 30 } as Margin)


        Row() {
          Button('baselineOffset_-10')
            .id('baselineOffset_-10').margin({ left: 10 } as Margin)
            .onClick((e:ClickEvent) => {
              this.message = 'this message is test for measure baselineOffset -10';
              this.textComputing0440_1 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                baselineOffset: -10
              })
              this.textComputing0440_2 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                baselineOffset: -10
              })
              this.textComputing0440_12 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                baselineOffset: -10
              })
              this.textComputing0440_22 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                baselineOffset: -10
              })
            })
        }.width('100%').margin({ top: 30 } as Margin)
      }
      .height('100%')
      .width('100%')
    }
    .height('100%')
  }
}