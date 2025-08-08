/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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
@Entry
@Component
struct TextPickerDialogSelectedTextStyle {
  showDialog(minFontSize: number | string | Resource | undefined | null, maxFontSize: number | string | Resource | undefined | null) {
    this.getUIContext().showTextPickerDialog({
      // 建议使用 this.getUIContext().showTextPickerDialog()接口
      range: ['AAAAA', 'BBBBBBBBBBBBB', 'CCCC', 'DDDDDDDD', 'EEE'],
      selectedTextStyle: {
        color: '#ff9eea48',
        minFontSize: minFontSize,
        maxFontSize: maxFontSize,
        overflow: TextOverflow.Clip
      }
    })
  }

  build() {
    Flex({ wrap: FlexWrap.Wrap }) {
      Button('minFontSize:18 maxFontSize:28')
        .onClick(() => {
          this.showDialog(18, 28)
        })
        .id('btn1')

      Button('minFontSize:28 maxFontSize:18')
        .onClick(() => {
          this.showDialog(28, 18)
        })
        .id('btn2')

      Button('minFontSize:28 maxFontSize:28')
        .onClick(() => {
          this.showDialog(28, 28)
        })
        .id('btn3')

      Button('minFontSize:undefined maxFontSize:undefined')
        .onClick(() => {
          this.showDialog(undefined, undefined)
        })
        .id('btn4')

      Button('minFontSize:null maxFontSize:null')
        .onClick(() => {
          this.showDialog(null, null)
        })
        .id('btn5')
    }.width('100%')
  }
}