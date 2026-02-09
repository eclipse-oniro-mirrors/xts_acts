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
import { Entry, Component, Column, Row, Text, Button, ClickEvent, Margin, Color, WordBreak, SizeOptions } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextCommonTextComputing0570 {
  @State measure: MeasureUtils | undefined = undefined;
  @State message: string = 'this message is test for measureTextSize';
  @State textComputing0570_1: number = MeasureText.measureText({
    textContent: this.message
  })
  @State textComputing0570_2: SizeOptions = MeasureText.measureTextSize({
    textContent: this.message
  })
  @State textComputing0570_12: number = 0
  @State textComputing0570_22: SizeOptions = { width:0,height:0} as SizeOptions
  onPageShow(){
    this.measure = this.getUIContext().getMeasureUtils()
    this.textComputing0570_12 = this.getUIContext().getMeasureUtils().measureText({
      textContent: this.message,
    })
    this.textComputing0570_22 = this.getUIContext().getMeasureUtils().measureTextSize({
      textContent: this.message,
    })
  }
  build() {
    Row() {
      Column() {
        Column() {
          Text(this.message)
            .maxLines(5)
            .key('textComputing0570_tx')
            .margin(15)
            .fontSize(20)
            .fontColor(Color.Blue)
          Text('width: ' + this.textComputing0570_1).key('textComputing0570_1')
          Text('width: ' + this.textComputing0570_12).key('textComputing0570_12')
          Text('width: ' + this.textComputing0570_2.width).key('textComputing0570_2')
          Text('width: ' + this.textComputing0570_22.width).key('textComputing0570_22')
        }.width('95%').borderWidth(3)

        Row() {
          Button('wordBreak_all')
            .id('wordBreak_all').margin(10)
            .onClick((e:ClickEvent) => {
              this.message = 'this message is test for measure WordBreak.BREAK_ALL';
              this.textComputing0570_1 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                wordBreak: WordBreak.BREAK_ALL
              })
              this.textComputing0570_2 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                wordBreak: WordBreak.BREAK_ALL
              })
              this.textComputing0570_12 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                wordBreak: WordBreak.BREAK_ALL
              })
              this.textComputing0570_22 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                wordBreak: WordBreak.BREAK_ALL
              })
            })
          Button('wordBreak_NORMAL')
            .id('wordBreak_NORMAL').margin(10)
            .onClick((e:ClickEvent) => {
              this.message = 'this message is test for measure WordBreak.NORMAL';
              this.textComputing0570_1 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                wordBreak: WordBreak.NORMAL
              })
              this.textComputing0570_2 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                wordBreak: WordBreak.NORMAL
              })
              this.textComputing0570_12 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                wordBreak: WordBreak.NORMAL
              })
              this.textComputing0570_22 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                wordBreak: WordBreak.NORMAL
              })
            })
        }.width('100%').margin({ top: 30 } as Margin)

        Row() {
          Button('wordBreak_word')
            .id('wordBreak_word').margin({ left: 10 } as Margin)
            .onClick((e:ClickEvent) => {
              this.message = 'this message is test for measure WordBreak.BREAK_WORD';
              this.textComputing0570_1 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                wordBreak: WordBreak.BREAK_WORD
              })
              this.textComputing0570_2 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: -2,
                wordBreak: WordBreak.BREAK_WORD
              })
              this.textComputing0570_12 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                wordBreak: WordBreak.BREAK_WORD
              })
              this.textComputing0570_22 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                wordBreak: WordBreak.BREAK_WORD
              })
            })
        }.width('100%').margin({ top: 30 } as Margin)

        Row() {
          Button('textIndent-5%')
            .id('textIndent-5%').margin({ left: 10 } as Margin)
            .onClick((e:ClickEvent) => {
              this.message = 'this message is test for measure textIndent 5%';
              this.textComputing0570_1 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                textIndent: '5%'
              })
              this.textComputing0570_2 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                textIndent: '5%'
              })
              this.textComputing0570_12 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                textIndent: '5%'
              })
              this.textComputing0570_22 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                textIndent: '5%'
              })
            })
        }.width('100%').margin({ top: 30 } as Margin)

        Row() {
          Button('textIndent-10')
            .id('textIndent-10').margin({ left: 10 } as Margin)
            .onClick((e:ClickEvent) => {
              this.message = 'this message is test for measure textIndent -10';
              this.textComputing0570_1 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                textIndent: -10
              })
              this.textComputing0570_2 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                textIndent: -10
              })
              this.textComputing0570_12 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                textIndent: -10
              })
              this.textComputing0570_22 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                textIndent: -10
              })
            })
          Button('textIndent_100')
            .id('textIndent_100').margin({ left: 10 } as Margin)
            .onClick((e:ClickEvent) => {
              this.message = 'this message is test for measure textIndent 100';
              this.textComputing0570_1 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                textIndent: 100
              })
              this.textComputing0570_2 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                textIndent: 100
              })
              this.textComputing0570_12 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                textIndent: 100
              })
              this.textComputing0570_22 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                textIndent: 100
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