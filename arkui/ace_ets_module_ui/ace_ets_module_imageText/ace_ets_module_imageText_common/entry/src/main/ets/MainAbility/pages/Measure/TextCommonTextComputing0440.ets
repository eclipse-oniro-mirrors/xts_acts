/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { MeasureUtils } from '@ohos.arkui.UIContext';
import { MeasureText } from '@kit.ArkUI';

@Entry
@Component
struct TextCommonTextComputing0440 {
  @State uiContext: UIContext = this.getUIContext();
  @State measure: MeasureUtils = this.uiContext.getMeasureUtils();
  @State message: string = 'this message is test for measureTextSize';
  @State textComputing0440_1: number = MeasureText.measureText({
    textContent: this.message
  })
  @State textComputing0440_2: SizeOptions = MeasureText.measureTextSize({
    textContent: this.message
  })
  @State textComputing0440_12: number = this.measure.measureText({
    textContent: this.message
  })
  @State textComputing0440_22: SizeOptions = this.measure.measureTextSize({
    textContent: this.message
  })

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
          Text('width: ' + this.textComputing0440_1).key('textComputing0440_1').height('5%')
          Text('width: ' + this.textComputing0440_12).key('textComputing0440_12').height('5%')
          Text('width: ' + this.textComputing0440_2.width).key('textComputing0440_2').height('5%')
          Text('width: ' + this.textComputing0440_22.width).key('textComputing0440_22').height('5%')
        }.width('95%').borderWidth(3)

        Row() {
          Button('maxLines_1')
            .id('maxLines_1')
            .width('50%')
            .onClick(() => {
              this.message = 'this message is test for measure maxLines 1';
              this.textComputing0440_1 = this.measure.measureText({
                textContent: this.message,
                maxLines: 1
              })
              this.textComputing0440_2 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 1
              })
              this.textComputing0440_12 = this.measure.measureText({
                textContent: this.message,
                maxLines: 1
              })
              this.textComputing0440_22 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 1
              })
            })
          Button('maxLines_10')
            .id('maxLines_10')
            .width('50%')
            .onClick(() => {
              this.message = 'this message is test for measure maxLines 10';
              this.textComputing0440_1 = this.measure.measureText({
                textContent: this.message,
                maxLines: 10
              })
              this.textComputing0440_2 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 10
              })
              this.textComputing0440_12 = this.measure.measureText({
                textContent: this.message,
                maxLines: 10
              })
              this.textComputing0440_22 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 10
              })
            })
        }.width('100%').height('5%')
        Row() {
          Button('maxLines_-5')
            .id('maxLines_-5')
            .width('50%')
            .onClick(() => {
              this.message = 'this message is test for measure maxLines -5';
              this.textComputing0440_1 = this.measure.measureText({
                textContent: this.message,
                maxLines: -5
              })
              this.textComputing0440_2 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: -5
              })
              this.textComputing0440_12 = this.measure.measureText({
                textContent: this.message,
                maxLines: -5
              })
              this.textComputing0440_22 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: -5
              })
            })
          Button('baselineOffset_-10')
            .id('baselineOffset_-10')
            .width('50%')
            .onClick(() => {
              this.message = 'this message is test for measure baselineOffset -10';
              this.textComputing0440_1 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                baselineOffset: -10
              })
              this.textComputing0440_2 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                baselineOffset: -10
              })
              this.textComputing0440_12 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                baselineOffset: -10
              })
              this.textComputing0440_22 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                baselineOffset: -10
              })
            })
        }.width('100%').height('5%')

        Row() {
          Button('lineHeight_-10')
            .id('lineHeight_-10')
            .width('50%')
            .onClick(() => {
              this.message = 'this message is test for measure lineHeight -10';
              this.textComputing0440_1 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                lineHeight: -10
              })
              this.textComputing0440_2 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                lineHeight: -10
              })
              this.textComputing0440_12 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                lineHeight: -10
              })
              this.textComputing0440_22 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                lineHeight: -10
              })
            })
          Button('lineHeight_330')
            .id('lineHeight_330')
            .width('50%')
            .onClick(() => {
              this.message = 'this message is test for measure lineHeight 330vp';
              this.textComputing0440_1 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                lineHeight: '330vp'
              })
              this.textComputing0440_2 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                lineHeight: '330vp'
              })
              this.textComputing0440_12 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                lineHeight: '330vp'
              })
              this.textComputing0440_22 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                lineHeight: '330vp'
              })
            })
        }.width('100%').height('5%')

        Row() {
          Button('lineHeight_320')
            .id('lineHeight_320')
            .width('50%')
            .onClick(() => {
              this.message = 'this message is test for measure lineHeight 320';
              this.textComputing0440_1 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                lineHeight: 320
              })
              this.textComputing0440_2 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                lineHeight: 320
              })
              this.textComputing0440_12 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                lineHeight: 320
              })
              this.textComputing0440_22 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                lineHeight: 320
              })
            })

          Button('lineHeight_15')
            .id('lineHeight_15')
            .width('50%')
            .onClick(() => {
              this.message = 'this message is test for measure lineHeight 15';
              this.textComputing0440_1 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                lineHeight: 15
              })
              this.textComputing0440_2 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                lineHeight: 15
              })
              this.textComputing0440_12 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                lineHeight: 15
              })
              this.textComputing0440_22 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                lineHeight: 15
              })
            })
        }.width('100%').height('5%')

        Row() {
          Button('baselineOffset_10vp')
            .id('baselineOffset_10vp')
            .width('50%')
            .onClick(() => {
              this.message = 'this message is test for measure baselineOffset 10vp';
              this.textComputing0440_1 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                baselineOffset: '10vp'
              })
              this.textComputing0440_2 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                baselineOffset: '10vp'
              })
              this.textComputing0440_12 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                baselineOffset: '10vp'
              })
              this.textComputing0440_22 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                baselineOffset: '10vp'
              })
            })

          Button('baselineOffset_0')
            .id('baselineOffset_0')
            .width('50%')
            .onClick(() => {
              this.message = 'this message is test for measure baselineOffset 0';
              this.textComputing0440_1 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                baselineOffset: 0
              })
              this.textComputing0440_2 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                baselineOffset: 0
              })
              this.textComputing0440_12 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                baselineOffset: 0
              })
              this.textComputing0440_22 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                baselineOffset: 0
              })
            })
        }.width('100%').height('5%')
      }
      .height('100%')
      .width('100%')
    }
    .height('100%')
  }
}