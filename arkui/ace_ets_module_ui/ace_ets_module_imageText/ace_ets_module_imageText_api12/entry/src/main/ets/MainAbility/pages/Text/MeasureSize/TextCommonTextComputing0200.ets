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
struct TextCommonTextComputing0200 {
  @State uiContext: UIContext = this.getUIContext();
  @State measure: MeasureUtils = this.uiContext.getMeasureUtils();
  @State message: string = 'this message is test for measureTextSize';
  @State textComputing0200_1: number = MeasureText.measureText({
    textContent: this.message,
    maxLines: 2
  })
  @State textComputing0200_2: SizeOptions = MeasureText.measureTextSize({
    textContent: this.message,
    maxLines: 2
  })
  @State textComputing0200_12: number = this.measure.measureText({
    textContent: this.message,
    maxLines: 2
  })
  @State textComputing0200_22: SizeOptions = this.measure.measureTextSize({
    textContent: this.message,
    maxLines: 2
  })

  build() {
    Row() {
      Column() {
        Column() {
          Text(this.message)
            .maxLines(5)
            .key('textComputing0200_tx')
            .margin(15)
            .fontSize(20)
            .fontColor(Color.Blue)
          Text('width: ' + this.textComputing0200_1).key('textComputing0200_1').height('5%')
          Text('width: ' + this.textComputing0200_12).key('textComputing0200_12').height('5%')
          Text('width: ' + this.textComputing0200_2.width).key('textComputing0200_2').height('5%')
          Text('width: ' + this.textComputing0200_22.width).key('textComputing0200_22').height('5%')
        }.width('95%').borderWidth(3)

        Row() {
          Button('fontWeight_Bold')
            .id('fontWeight_Bold')
            .width('50%')
            .onClick(() => {
              this.message = 'this message is test for measure FontWeight.Bold';
              this.textComputing0200_1 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                fontWeight: FontWeight.Bold
              })
              this.textComputing0200_2 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                fontWeight: FontWeight.Bold
              })
              this.textComputing0200_12 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                fontWeight: FontWeight.Bold
              })
              this.textComputing0200_22 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                fontWeight: FontWeight.Bold
              })
            })
          Button('fontWeight_Medium')
            .id('fontWeight_Medium')
            .width('50%')
            .onClick(() => {
              this.message = 'this message is test for measure FontWeight.Medium';
              this.textComputing0200_1 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                fontWeight: FontWeight.Medium
              })
              this.textComputing0200_2 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                fontWeight: FontWeight.Medium
              })
              this.textComputing0200_12 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                fontWeight: FontWeight.Medium
              })
              this.textComputing0200_22 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                fontWeight: FontWeight.Medium
              })
            })
        }.width('100%').height('5%')

        Row() {
          Button('fontWeight_Lighter')
            .id('fontWeight_Lighter')
            .width('50%')
            .onClick(() => {
              this.message = 'this message is test for measure FontWeight.Lighter';
              this.textComputing0200_1 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                fontWeight: FontWeight.Lighter
              })
              this.textComputing0200_2 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                fontWeight: FontWeight.Lighter
              })
              this.textComputing0200_12 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                fontWeight: FontWeight.Lighter
              })
              this.textComputing0200_22 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                fontWeight: FontWeight.Lighter
              })
            })
          Button('fontWeight_Normal')
            .id('fontWeight_Normal')
            .width('50%')
            .onClick(() => {
              this.message = 'this message is test for measure FontWeight.Normal';
              this.textComputing0200_1 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                fontWeight: FontWeight.Normal
              })
              this.textComputing0200_2 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                fontWeight: FontWeight.Normal
              })
              this.textComputing0200_12 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                fontWeight: FontWeight.Normal
              })
              this.textComputing0200_22 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                fontWeight: FontWeight.Normal
              })
            })
        }.width('100%').height('5%')

        Row() {
          Button('fontWeight_200')
            .id('fontWeight_200')
            .width('50%')
            .onClick(() => {
              this.message = 'this message is test for measure FontWeight 200';
              this.textComputing0200_1 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                fontWeight: 200
              })
              this.textComputing0200_2 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                fontWeight: 200
              })
              this.textComputing0200_12 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                fontWeight: 200
              })
              this.textComputing0200_22 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                fontWeight: 200
              })
            })
          Button('fontWeight_500')
            .id('fontWeight_500')
            .width('50%')
            .onClick(() => {
              this.message = 'this message is test for measure FontWeight 500';
              this.textComputing0200_1 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                fontWeight: 500
              })
              this.textComputing0200_2 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                fontWeight: 500
              })
              this.textComputing0200_12 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                fontWeight: 500
              })
              this.textComputing0200_22 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                fontWeight: 500
              })
            })
        }.width('100%').height('5%')

        Row() {
          Button('fontWeight_-700')
            .id('fontWeight_-700')
            .onClick(() => {
              this.message = 'this message is test for measure FontWeight -700';
              this.textComputing0200_1 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                fontWeight: -700
              })
              this.textComputing0200_2 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                fontWeight: -700
              })
              this.textComputing0200_12 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                fontWeight: -700
              })
              this.textComputing0200_22 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                fontWeight: -700
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