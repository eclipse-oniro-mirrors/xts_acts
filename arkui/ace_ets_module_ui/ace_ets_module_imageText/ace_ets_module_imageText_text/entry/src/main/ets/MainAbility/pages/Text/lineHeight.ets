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

import { LengthMetrics, LengthUnit } from '@kit.ArkUI';

@Entry
@Component
struct TextLineHeightTest {
  @State message1: string = 'lineHeight';
  @State message2: string = 'max&min';
  @State isLineHeightMultiple: (number | null | undefined)[] = [2, null, undefined];
  @State isLineHeightMultipleIndex: number = 0;
  @State isLineHeight: (LengthMetrics | undefined | null)[] =
    [{ value: 2, unit: LengthUnit.PX }, { value: 2, unit: LengthUnit.LPX }, LengthMetrics.vp(2),
      LengthMetrics.fp(2), LengthMetrics.percent(2),
      LengthMetrics.resource($r('app.string.Text_LineHeight_2fp')), null, undefined];
  @State isLineHeightIndex: number = 0;

  build() {

    Column() {
      Row() {
        Text(this.message1)
          .id('textLineHeightMultiple')
          .lineHeight(1)
          .backgroundColor(Color.Blue)
          .lineHeightMultiple(this.isLineHeightMultiple[this.isLineHeightMultipleIndex])
        Text(this.message2)
          .id('textLineHeight')
          .backgroundColor(Color.Blue)
          .maxLineHeight(this.isLineHeight[this.isLineHeightIndex])
          .minLineHeight(this.isLineHeight[this.isLineHeightIndex])
      }

      Row() {
        Button('1').onClick(() => {
          this.isLineHeightMultipleIndex = 0
        }).id('Multiple5')
        Button('2').onClick(() => {
          this.isLineHeightMultipleIndex = 1
        }).id('MultipleNull')
        Button('3').onClick(() => {
          this.isLineHeightMultipleIndex = 2
        }).id('MultipleUndefined')
      }

      Row() {
        Button('4').onClick(() => {
          this.isLineHeightIndex = 0
        }).id('LineHeight30pxUnit')
        Button('5').onClick(() => {
          this.isLineHeightIndex = 1
        }).id('LineHeight30lpxUnit')
        Button('6').onClick(() => {
          this.isLineHeightIndex = 2
        }).id('LineHeight20vp')
        Button('7').onClick(() => {
          this.isLineHeightIndex = 3
        }).id('LineHeight20fp')
      }

      Row() {
        Button('8').onClick(() => {
          this.isLineHeightIndex = 4
        }).id('LineHeight30percent')
        Button('9').onClick(() => {
          this.isLineHeightIndex = 5
        }).id('LineHeightResource50fp')
        Button('10').onClick(() => {
          this.isLineHeightIndex = 6
        }).id('LineHeightNull')
        Button('11').onClick(() => {
          this.isLineHeightIndex = 7
        }).id('LineHeightUndefined')
      }
    }
    .height('100%')
    .width('100%')
  }
}