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
struct TextCommonTextComputing0160 {
  @State uiContext: UIContext = this.getUIContext();
  @State measure: MeasureUtils = this.uiContext.getMeasureUtils();
  @State message: string = 'this message is test for measureTextSize';
  @State textComputing0160_1: number = MeasureText.measureText({
    textContent: this.message,
    maxLines: 2
  })
  @State textComputing0160_2: SizeOptions = MeasureText.measureTextSize({
    textContent: this.message,
    maxLines: 2
  })
  @State textComputing0160_12: number = this.measure.measureText({
    textContent: this.message,
    maxLines: 2
  })
  @State textComputing0160_22: SizeOptions = this.measure.measureTextSize({
    textContent: this.message,
    maxLines: 2
  })

  build() {
    Row() {
      Column() {
        Column() {
          Text(this.message)
            .maxLines(5)
            .key('textComputing0160_tx')
            .margin(15)
            .fontSize(20)
            .fontColor(Color.Blue)
          Text('width: ' + this.textComputing0160_1).key('textComputing0160_1').height('5%')
          Text('width: ' + this.textComputing0160_12).key('textComputing0160_12').height('5%')
          Text('width: ' + this.textComputing0160_2.width).key('textComputing0160_2').height('5%')
          Text('width: ' + this.textComputing0160_22.width).key('textComputing0160_22').height('5%')
        }.width('95%').borderWidth(3)

        Row() {
          Button('fontStyle_normal')
            .id('fontStyle_normal')
            .width('50%')
            .onClick(() => {
              this.message = 'this message is test for measure FontStyle.Normal';
              this.textComputing0160_1 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                fontStyle: FontStyle.Normal
              })
              this.textComputing0160_2 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                fontStyle: FontStyle.Normal
              })
              this.textComputing0160_12 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                fontStyle: FontStyle.Normal
              })
              this.textComputing0160_22 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                fontStyle: FontStyle.Normal
              })
            })
          Button('fontStyle_Italic')
            .id('fontStyle_Italic')
            .width('50%')
            .onClick(() => {
              this.message = 'this message is test for measure FontStyle.Italic';
              this.textComputing0160_1 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                fontStyle: FontStyle.Italic
              })
              this.textComputing0160_2 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                fontStyle: FontStyle.Italic
              })
              this.textComputing0160_12 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                fontStyle: FontStyle.Italic
              })
              this.textComputing0160_22 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                fontStyle: FontStyle.Italic
              })
            })
        }.width('100%').height('5%')

        Row() {
          Button('fontStyle-100')
            .id('fontStyle-100')
            .onClick(() => {
              this.message = 'this message is test for measure FontStyle -100';
              this.textComputing0160_1 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                fontStyle: -100
              })
              this.textComputing0160_2 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                fontStyle: -100
              })
              this.textComputing0160_12 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                fontStyle: -100
              })
              this.textComputing0160_22 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                fontStyle: -100
              })
            })
        }.width('100%').height('5%')


        Row() {
          Button('fontFamily_res')
            .id('fontFamily_res')
            .width('50%')
            .onClick(() => {
              this.message = 'this message is test for measure fontFamily';
              this.textComputing0160_1 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                fontFamily: $r('app.string.fontfamily_1')
              })
              this.textComputing0160_2 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                fontFamily: $r('app.string.fontfamily_1')
              })
              this.textComputing0160_12 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                fontFamily: $r('app.string.fontfamily_1')
              })
              this.textComputing0160_22 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                fontFamily: $r('app.string.fontfamily_1')
              })
            })

          Button('fontFamily_oh')
            .id('fontFamily_oh')
            .width('50%')
            .onClick(() => {
              this.message = 'this message is test for measure fontFamily';
              this.textComputing0160_1 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                fontFamily: 'HarmonyOS Sans'
              })
              this.textComputing0160_2 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                fontFamily: 'HarmonyOS Sans'
              })
              this.textComputing0160_12 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2,
                fontFamily: 'HarmonyOS Sans'
              })
              this.textComputing0160_22 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                fontFamily: 'HarmonyOS Sans'
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