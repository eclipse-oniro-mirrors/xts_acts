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
struct TextInputOnWillCut {
  @State allowCutResult: string = ''
  @State blockCutResult: string = ''

  build() {
    Scroll() {
      Column() {
        Text('onWillCut Test')
          .fontSize(20)
          .margin({ top: 20, bottom: 10 })
        TextInput({ text: 'onWillCutAllowCut' })
          .id('textInput_onWillCut_allow')
          .width('100%')
          .height('5%')
          .copyOption(CopyOptions.LocalDevice)
          .onWillCut((value: string) => {
            this.allowCutResult = value
            AppStorage.setOrCreate('TextInputAllowCutResult', value)
            return true
          })

        TextInput({ text: 'onWillCutBlockCut' })
          .id('textInput_onWillCut_block')
          .width('100%')
          .height('5%')
          .copyOption(CopyOptions.LocalDevice)
          .onWillCut((value: string) => {
            this.blockCutResult = value
            AppStorage.setOrCreate('TextInputBlockCutResult', value)
            return false
          })

        TextInput({ text: 'onWillCutNull' })
          .id('textInput_onWillCut_null')
          .width('100%')
          .height('5%')
          .copyOption(CopyOptions.LocalDevice)
          .onWillCut(null)

        TextInput({ text: 'onWillCutUndefined' })
          .id('textInput_onWillCut_undefined')
          .width('100%')
          .height('5%')
          .copyOption(CopyOptions.LocalDevice)
          .onWillCut(undefined)
      }
      .height('100%')
    }
  }
}