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
import { Entry, Component, Column, Row, Text, Button, ClickEvent, Margin, Color, TextAlign, SizeOptions  } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextCommonTextComputing0290 {
  @State measure: MeasureUtils | undefined = undefined;
  @State message: string = 'this message is test for measureTextSize';
  @State textComputing0290_1: number = MeasureText.measureText({
    textContent: this.message,
    maxLines: 2
  })
  @State textComputing0290_2: SizeOptions = MeasureText.measureTextSize({
    textContent: this.message,
    maxLines: 2
  })
  @State textComputing0290_12: number = 0
  @State textComputing0290_22: SizeOptions = { width:0,height:0} as SizeOptions
  onPageShow(){
    this.measure = this.getUIContext().getMeasureUtils()
    this.textComputing0290_12 = this.getUIContext().getMeasureUtils().measureText({
      textContent: this.message,
      maxLines: 2
    })
    this.textComputing0290_22 = this.getUIContext().getMeasureUtils().measureTextSize({
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
            .key('textComputing0290_tx')
            .margin(15)
            .fontSize(20)
            .fontColor(Color.Blue)
          Text('width: ' + this.textComputing0290_1).key('textComputing0290_1')
          Text('width: ' + this.textComputing0290_12).key('textComputing0290_12')
          Text('width: ' + this.textComputing0290_2.width).key('textComputing0290_2')
          Text('width: ' + this.textComputing0290_22.width).key('textComputing0290_22')
        }.width('95%').borderWidth(3)

        Row() {
          Button('letterSpacing_10vp')
            .id('letterSpacing_10vp').margin(10)
            .onClick((e:ClickEvent) => {
              this.message = 'this message is test for measure letterSpacing 10vp';
              this.textComputing0290_1 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                letterSpacing: '10vp'
              })
              this.textComputing0290_2 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                letterSpacing: '10vp'
              })
              this.textComputing0290_12 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                letterSpacing: '10vp'
              })
              this.textComputing0290_22 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                letterSpacing: '10vp'
              })
            })
          Button('letterSpacing_-5')
            .id('letterSpacing_-5').margin(10)
            .onClick((e:ClickEvent) => {
              this.message = 'this message is test for measure letterSpacing -5';
              this.textComputing0290_1 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                letterSpacing: -5
              })
              this.textComputing0290_2 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                letterSpacing: -5
              })
              this.textComputing0290_12 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                letterSpacing: -5
              })
              this.textComputing0290_22 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                letterSpacing: -5
              })
            })
        }.width('100%').margin({ top: 30 } as Margin)

        Row() {
          Button('letterSpacing_20')
            .id('letterSpacing_20').margin({ left: 10 } as Margin)
            .onClick((e:ClickEvent) => {
              this.message = 'this message is test for measure letterSpacing 20';
              this.textComputing0290_1 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                letterSpacing: 20
              })
              this.textComputing0290_2 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                letterSpacing: 20
              })
              this.textComputing0290_12 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                letterSpacing: 20
              })
              this.textComputing0290_22 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                letterSpacing: 20
              })
            })
        }.width('100%').margin({ top: 30 } as Margin)

        Row() {
          Button('textAlign_end')
            .id('textAlign_end').margin({ left: 10 } as Margin)
            .onClick((e:ClickEvent) => {
              this.message = 'this message is test for measure TextAlign.End';
              this.textComputing0290_1 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                textAlign: TextAlign.End
              })
              this.textComputing0290_2 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                textAlign: TextAlign.End
              })
              this.textComputing0290_12 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                textAlign: TextAlign.End
              })
              this.textComputing0290_22 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                textAlign: TextAlign.End
              })
            })
          Button('textAlign_JUSTIFY')
            .id('textAlign_JUSTIFY').margin({ left: 10 } as Margin)
            .onClick((e:ClickEvent) => {
              this.message = 'this message is test for measure TextAlign.JUSTIFY';
              this.textComputing0290_1 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                textAlign: TextAlign.JUSTIFY
              })
              this.textComputing0290_2 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                textAlign: TextAlign.JUSTIFY
              })
              this.textComputing0290_12 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                textAlign: TextAlign.JUSTIFY
              })
              this.textComputing0290_22 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                textAlign: TextAlign.JUSTIFY
              })
            })
        }.width('100%').margin({ top: 30 } as Margin)

        Row() {
          Button('textAlign_Start')
            .id('textAlign_Start').margin({ left: 10 } as Margin)
            .onClick((e:ClickEvent) => {
              this.message = 'this message is test for measure TextAlign.Start';
              this.textComputing0290_1 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                textAlign: TextAlign.Start
              })
              this.textComputing0290_2 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                textAlign: TextAlign.Start
              })
              this.textComputing0290_12 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                textAlign: TextAlign.Start
              })
              this.textComputing0290_22 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                textAlign: TextAlign.Start
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