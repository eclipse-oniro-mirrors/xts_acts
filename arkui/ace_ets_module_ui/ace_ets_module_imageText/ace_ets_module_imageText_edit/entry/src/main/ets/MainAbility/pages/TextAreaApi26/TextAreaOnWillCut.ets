/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
struct TextAreaOnWillCut {
  @State allowCutResult: string = ''
  @State blockCutResult: string = ''

  build() {
    Scroll() {
      Column() {
        Text('onWillCut Test')
          .fontSize(20)
          .margin({ top: 20, bottom: 10 })
        TextArea({ text: 'onWillCutAllowCut' })
          .id('textArea_onWillCut_allow')
          .width('100%')
          .height('5%')
          .copyOption(CopyOptions.LocalDevice)
          .onWillCut((value: string) => {
            this.allowCutResult = value
            AppStorage.setOrCreate('TextAreaAllowCutResult', value)
            return true
          })

        TextArea({ text: 'onWillCutBlockCut' })
          .id('textArea_onWillCut_block')
          .width('100%')
          .height('5%')
          .copyOption(CopyOptions.LocalDevice)
          .onWillCut((value: string) => {
            this.blockCutResult = value
            AppStorage.setOrCreate('TextAreaBlockCutResult', value)
            return false
          })

        TextArea({ text: 'onWillCutNull' })
          .id('textArea_onWillCut_null')
          .width('100%')
          .height('5%')
          .copyOption(CopyOptions.LocalDevice)
          .onWillCut(null)

        TextArea({ text: 'onWillCutUndefined' })
          .id('textArea_onWillCut_undefined')
          .width('100%')
          .height('5%')
          .copyOption(CopyOptions.LocalDevice)
          .onWillCut(undefined)
      }
      .height('100%')
    }
  }
}