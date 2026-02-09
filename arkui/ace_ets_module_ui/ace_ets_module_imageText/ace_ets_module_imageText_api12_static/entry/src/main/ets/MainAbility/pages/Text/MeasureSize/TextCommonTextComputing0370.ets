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
import { Entry, Component, Column, Row, Text, Button, ClickEvent, Margin, Color, TextOverflow, TextCase, SizeOptions  } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextCommonTextComputing0370 {
  @State measure: MeasureUtils | undefined = undefined;
  @State message: string = 'this message is test for measureTextSize';
  @State textComputing0370_1: number = MeasureText.measureText({
    textContent: this.message,
    maxLines: 2
  })
  @State textComputing0370_2: SizeOptions = MeasureText.measureTextSize({
    textContent: this.message,
    maxLines: 2
  })
  @State textComputing0370_12: number = 0
  @State textComputing0370_22: SizeOptions ={ width:0,height:0} as SizeOptions
  onPageShow(){
    this.measure = this.getUIContext().getMeasureUtils()
    this.textComputing0370_12 = this.getUIContext().getMeasureUtils().measureText({
      textContent: this.message,
      maxLines: 2
    })
    this.textComputing0370_22 = this.getUIContext().getMeasureUtils().measureTextSize({
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
            .key('textComputing0370_tx')
            .margin(15)
            .fontSize(20)
            .fontColor(Color.Blue)
          Text('width: ' + this.textComputing0370_1).key('textComputing0370_1')
          Text('width: ' + this.textComputing0370_12).key('textComputing0370_12')
          Text('width: ' + this.textComputing0370_2.width).key('textComputing0370_2')
          Text('width: ' + this.textComputing0370_22.width).key('textComputing0370_22')
        }.width('95%').borderWidth(3)

        Row() {
          Button('overflow_Ellipsis')
            .id('overflow_Ellipsis').margin(10)
            .onClick((e:ClickEvent) => {
              this.message = 'this message is test for measure TextOverflow.Ellipsis';
              this.textComputing0370_1 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                overflow: TextOverflow.Ellipsis
              })
              this.textComputing0370_2 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                overflow: TextOverflow.Ellipsis
              })
              this.textComputing0370_12 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                overflow: TextOverflow.Ellipsis
              })
              this.textComputing0370_22 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                overflow: TextOverflow.Ellipsis
              })
            })
          Button('overflow_Clip')
            .id('overflow_Clip').margin(10)
            .onClick((e:ClickEvent) => {
              this.message = 'this message is test for measure TextOverflow.Clip';
              this.textComputing0370_1 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                overflow: TextOverflow.Clip
              })
              this.textComputing0370_2 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                overflow: TextOverflow.Clip
              })
              this.textComputing0370_12 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                overflow: TextOverflow.Clip
              })
              this.textComputing0370_22 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                overflow: TextOverflow.Clip
              })
            })
        }.width('100%').margin({ top: 30 } as Margin)

        Row() {
          Button('overflow_None')
            .id('overflow_None').margin({ left: 10 } as Margin)
            .onClick((e:ClickEvent) => {
              this.message = 'this message is test for measure TextOverflow.None';
              this.textComputing0370_1 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                overflow: TextOverflow.None
              })
              this.textComputing0370_2 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                overflow: TextOverflow.None
              })
              this.textComputing0370_12 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                overflow: TextOverflow.None
              })
              this.textComputing0370_22 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                overflow: TextOverflow.None
              })
            })
          Button('overflow_MARQUEE')
            .id('overflow_MARQUEE').margin({ left: 10 } as Margin)
            .onClick((e:ClickEvent) => {
              this.message = 'this message is test for measure TextOverflow.MARQUEE';
              this.textComputing0370_1 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                overflow: TextOverflow.MARQUEE
              })
              this.textComputing0370_2 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                overflow: TextOverflow.MARQUEE
              })
              this.textComputing0370_12 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                overflow: TextOverflow.MARQUEE
              })
              this.textComputing0370_22 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                overflow: TextOverflow.MARQUEE
              })
            })
        }.width('100%').margin({ top: 30 } as Margin)

        Row() {
          Button('textCase_Normal')
            .id('textCase_Normal').margin({ left: 10 } as Margin)
            .onClick((e:ClickEvent) => {
              this.message = 'this message is test for measure TextCase.Normal';
              this.textComputing0370_1 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                textCase: TextCase.Normal
              })
              this.textComputing0370_2 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                textCase: TextCase.Normal
              })
              this.textComputing0370_12 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                textCase: TextCase.Normal
              })
              this.textComputing0370_22 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                textCase: TextCase.Normal
              })
            })
          Button('textCase_LowerCase')
            .id('textCase_LowerCase').margin({ left: 10 } as Margin)
            .onClick((e:ClickEvent) => {
              this.message = 'this message is test for measure TextCase.LowerCase';
              this.textComputing0370_1 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                textCase: TextCase.LowerCase
              })
              this.textComputing0370_2 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                textCase: TextCase.LowerCase
              })
              this.textComputing0370_12 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                textCase: TextCase.LowerCase
              })
              this.textComputing0370_22 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                textCase: TextCase.LowerCase
              })
            })
        }.width('100%').margin({ top: 30 } as Margin)

        Row() {
          Button('textCase_UpperCase')
            .id('textCase_UpperCase').margin({ left: 10 } as Margin)
            .onClick((e:ClickEvent) => {
              this.message = 'this message is test for measure TextCase.UpperCase';
              this.textComputing0370_1 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                textCase: TextCase.UpperCase
              })
              this.textComputing0370_2 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                textCase: TextCase.UpperCase
              })
              this.textComputing0370_12 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                textCase: TextCase.UpperCase
              })
              this.textComputing0370_22 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                textCase: TextCase.UpperCase
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