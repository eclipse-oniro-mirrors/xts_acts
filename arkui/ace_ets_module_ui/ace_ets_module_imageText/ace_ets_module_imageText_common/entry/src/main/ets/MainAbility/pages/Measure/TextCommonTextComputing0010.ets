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
struct TextCommonTextComputing0010 {
  @State uiContext: UIContext = this.getUIContext();
  @State measure: MeasureUtils = this.uiContext.getMeasureUtils();
  @State message: string = 'this message is test for measureTextSize';
  @State textComputing0010_1: number = MeasureText.measureText({
    textContent: this.message,
    maxLines: 2
  })
  @State textComputing0010_2: SizeOptions = MeasureText.measureTextSize({
    textContent: this.message,
    maxLines: 2
  })
  @State textComputing0010_12: number = this.measure.measureText({
    textContent: this.message,
    maxLines: 2
  })
  @State textComputing0010_22: SizeOptions = this.measure.measureTextSize({
    textContent: this.message,
    maxLines: 2
  })

  build() {
    Row() {
      Column() {
        Column() {
          Text(this.message)
            .maxLines(5)
            .key('textComputing0010_tx')
            .fontSize(20)
            .fontColor(Color.Blue)
            .height('50%')
          Text('width: ' + this.textComputing0010_1).key('textComputing0010_1').height('5%')
          Text('width: ' + this.textComputing0010_12).key('textComputing0010_12').height('5%')
          Text('width: ' + this.textComputing0010_2.width).key('textComputing0010_2').height('5%')
          Text('width: ' + this.textComputing0010_22.width).key('textComputing0010_22').height('5%')
        }.width('95%').borderWidth(3)

        Row() {
          Button('resetInChinese')
            .id('resetInChinese')
            .width('50%')
            .onClick(() => {
              this.message = '这个是用于测试文本计算接口的首行缩进变化下文本计算能力';
              this.textComputing0010_1 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2
              })
              this.textComputing0010_2 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2
              })
              this.textComputing0010_12 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2
              })
              this.textComputing0010_22 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2
              })
            })
          Button('resetInChEn')
            .id('resetInChEn')
            .width('50%')
            .onClick(() => {
              this.message = '这个是test for文本计算接口的首行缩进变化下文本计算能力 measure measureTextSize';
              this.textComputing0010_1 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2
              })
              this.textComputing0010_2 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2
              })
              this.textComputing0010_12 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2
              })
              this.textComputing0010_22 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2
              })
            })
        }.width('100%').height('5%')

        Row() {
          Button('resetInChEnJaHa')
            .id('resetInChEnJaHa')
            .width('50%')
            .onClick(() => {
              this.message =
                'ファーストラインのエンキデンス文本计算接口的Encement of the first line下文本첫 번째 줄의 제외计算能力';
              this.textComputing0010_1 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2
              })
              this.textComputing0010_2 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2
              })
              this.textComputing0010_12 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2
              })
              this.textComputing0010_22 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2
              })
            })
          Button('resetInChSym')
            .id('resetInChSym')
            .width('50%')
            .onClick(() => {
              this.message = '_@#%^&这个是用于测试文本计算接口的首行缩进^&*变化下文本计算能力L{}}">PKLOPLJK';
              this.textComputing0010_1 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2
              })
              this.textComputing0010_2 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2
              })
              this.textComputing0010_12 = this.measure.measureText({
                textContent: this.message,
                maxLines: 2
              })
              this.textComputing0010_22 = this.measure.measureTextSize({
                textContent: this.message,
                maxLines: 2
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