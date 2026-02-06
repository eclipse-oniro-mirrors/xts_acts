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
@Entry
@Component
struct TextCompressLeadingPunctuation {
  @State text: string = '【HarmonyOS】【\n'
  @State status: boolean | undefined | null = false; //默认false
  private statusList: (boolean)[] = [false, true]; //所有可能的状态
  private statusListIndex: number = 0

  build() {
    Column() {
      Row({ space: 5 }) {
        Text(this.text)
          .id('textCompressLeadingPunctuation')
          .height('25%')
          .fontSize(12)
          .borderWidth(1)
          .compressLeadingPunctuation(this.status) //新接口，控制行首标点符号是否缩进
        Text() {
          Span(this.text).fontSize(12)
        }
          .id('textSpan')
          .height('25%')
          .borderWidth(1)
          .compressLeadingPunctuation(this.status) //新接口，控制行首标点符号是否缩进
      }
      Button('行首符号缩进属性：'+ this.status)
        .id('textButton')
        .onClick(() => {
          this.statusListIndex = (this.statusListIndex + 1) % this.statusList.length
          this.status = this.statusList[this.statusListIndex]
        }).margin(1)
    }.height('100%').width('100%')
  }
}