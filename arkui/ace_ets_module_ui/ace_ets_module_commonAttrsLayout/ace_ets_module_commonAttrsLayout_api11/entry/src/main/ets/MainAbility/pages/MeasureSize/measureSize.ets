/**
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

import measure from '@ohos.measure'

@Entry
@Component
struct Index {
  @State message: string = 'this message is test for measure measureTextSize in english';
  @State textIndent: number = 10;
  @State textWordBreak: WordBreak = WordBreak.BREAK_ALL;
  @State textSizeMaxLine2: SizeOptions = measure.measureTextSize({
    textContent: this.message,
    fontSize: '15vp',
    constraintWidth: '220vp',
    wordBreak: this.textWordBreak,
    maxLines: 2,
    textIndent: this.textIndent
  })
  @State textSizeMaxLine3: SizeOptions = measure.measureTextSize({
    textContent: this.message,
    fontSize: '15vp',
    constraintWidth: '220vp',
    wordBreak: this.textWordBreak,
    maxLines: 3,
    textIndent: this.textIndent
  })

  build() {
    Row() {
      Column({space:2}) {
        Text(this.message)
          .height(40)
          .width('220vp')
          .maxFontSize('20vp')
          .minFontSize('15vp')
          .maxLines(2)
          .textIndent(this.textIndent)
          .wordBreak(this.textWordBreak)
        Row({space:3}){
          Text("" + this.textSizeMaxLine2.height).key('textSizeMaxLine2').height(20)
          Text("" + this.textSizeMaxLine3.height).key('textSizeMaxLine3').height(20)
        }
        Button('testForTextIndent')
          .height(20)
          .id('testForTextIndent')
          .onClick(() => {
            this.textIndent = 40;
            this.textSizeMaxLine2 = measure.measureTextSize({
              textContent: this.message,
              constraintWidth: '220vp',
              wordBreak: this.textWordBreak,
              maxLines: 2,
              textIndent: this.textIndent,
              fontSize: '15vp',
            })

            this.textSizeMaxLine3 = measure.measureTextSize({
              textContent: this.message,
              constraintWidth: '220vp',
              wordBreak: this.textWordBreak,
              maxLines: 3,
              textIndent: this.textIndent,
              fontSize: '15vp',
            })
          })

        Button('reset')
          .height(20)
          .id('reset')
          .onClick(() => {
            this.textIndent = 10;
            this.textWordBreak = WordBreak.BREAK_ALL;
            this.message = 'this message is test for measure measureTextSize in english';

            this.textSizeMaxLine2 = measure.measureTextSize({
              textContent: this.message,
              fontSize: '15vp',
              constraintWidth: '220vp',
              wordBreak: this.textWordBreak,
              maxLines: 2,
              textIndent: this.textIndent
            })

            this.textSizeMaxLine3 = measure.measureTextSize({
              textContent: this.message,
              fontSize: '15vp',
              constraintWidth: '220vp',
              wordBreak: this.textWordBreak,
              maxLines: 3,
              textIndent: this.textIndent
            })
          })

        Button('testForWordBreak')
          .height(20)
          .id('testForWordBreak')
          .onClick(() => {
            this.textIndent = 10;
            this.textWordBreak = WordBreak.BREAK_WORD;
            this.textSizeMaxLine2 = measure.measureTextSize({
              textContent: this.message,
              fontSize: '15vp',
              constraintWidth: '220vp',
              wordBreak: this.textWordBreak,
              maxLines: 2,
              textIndent: this.textIndent
            })

            this.textSizeMaxLine3 = measure.measureTextSize({
              textContent: this.message,
              fontSize: '15vp',
              constraintWidth: '220vp',
              wordBreak: this.textWordBreak,
              maxLines: 3,
              textIndent: this.textIndent
            })
          })

        Button('resetInChinese')
          .height(20)
          .id('resetInChinese')
          .onClick(() => {
            this.textIndent = 10;
            this.textWordBreak = WordBreak.BREAK_ALL;
            this.message = '这个是用于测试文本计算接口的首行缩进变化下文本计算能力';

            this.textSizeMaxLine2 = measure.measureTextSize({
              textContent: this.message,
              fontSize: '15vp',
              constraintWidth: '220vp',
              wordBreak: this.textWordBreak,
              maxLines: 2,
              textIndent: this.textIndent
            })

            this.textSizeMaxLine3 = measure.measureTextSize({
              textContent: this.message,
              fontSize: '15vp',
              constraintWidth: '220vp',
              wordBreak: this.textWordBreak,
              maxLines: 3,
              textIndent: this.textIndent
            })
          })

        Button('testForTextIndentInChinese')
          .height(20)
          .id('testForTextIndentInChinese')
          .onClick(() => {
            this.textIndent = 40;

            this.textSizeMaxLine2 = measure.measureTextSize({
              textContent: this.message,
              fontSize: '15vp',
              constraintWidth: '220vp',
              wordBreak: this.textWordBreak,
              maxLines: 2,
              textIndent: this.textIndent
            })

            this.textSizeMaxLine3 = measure.measureTextSize({
              textContent: this.message,
              fontSize: '15vp',
              constraintWidth: '220vp',
              wordBreak: this.textWordBreak,
              maxLines: 3,
              textIndent: this.textIndent
            })
          })
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }
}