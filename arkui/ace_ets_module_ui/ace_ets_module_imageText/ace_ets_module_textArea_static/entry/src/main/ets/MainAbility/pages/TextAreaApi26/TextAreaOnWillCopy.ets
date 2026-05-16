'use static';
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
import {
  Scroll,
  TextArea,
  CopyOptions,
  AppStorage,
} from '@kit.ArkUI';
import { Entry, Text, Column, Component, Button, ClickEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextAreaOnWillCopy {
  @State allowCopyResult: string = ''
  @State blockCopyResult: string = ''

  build() {
    Scroll() {
      Column() {
        Text('onWillCopy Test')
          .fontSize(20)
          .margin({ top: 20, bottom: 10 })
        TextArea({ text: 'onWillCopyAllowCopy' })
          .id('textArea_onWillCopy_allow')
          .width('100%')
          .height('5%')
          .copyOption(CopyOptions.LocalDevice)
          .onWillCopy((value: string) => {
            this.allowCopyResult = value
            AppStorage.setOrCreate('TextAreaAllowCopyResult', value)
            return true
          })

        TextArea({ text: 'onWillCopyBlockCopy' })
          .id('textArea_onWillCopy_block')
          .width('100%')
          .height('5%')
          .copyOption(CopyOptions.LocalDevice)
          .onWillCopy((value: string) => {
            this.blockCopyResult = value
            AppStorage.setOrCreate('TextAreaBlockCopyResult', value)
            return false
          })

        TextArea({ text: 'onWillCopyUndefined' })
          .id('textArea_onWillCopy_undefined')
          .width('100%')
          .height('5%')
          .copyOption(CopyOptions.LocalDevice)
          .onWillCopy(undefined)
      }
      .height('100%')
    }
  }
}