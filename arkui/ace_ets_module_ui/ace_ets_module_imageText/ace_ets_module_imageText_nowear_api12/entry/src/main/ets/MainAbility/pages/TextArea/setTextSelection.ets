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

import { LengthMetrics } from '@kit.ArkUI'
import { image } from '@kit.ImageKit'

@Entry
@Component
struct setTextSelectionTest {
  @State text: string = '';
  controller: TextAreaController = new TextAreaController()
  controller2: TextInputController = new TextInputController()


  build() {
    Column() {
      TextArea({text: '123456q1weqewqdsad文本', controller: this.controller})
        .copyOption(CopyOptions.InApp)
        .id('textArea')
        .height('5%')

      TextInput({text: '123456qwdasfasaf文本', controller: this.controller2})
        .copyOption(CopyOptions.InApp)
        .id('textInput')
        .height('5%')
        .margin({top:60})

      Button('setTextSelection -1 -1').height('3%')
        .onClick(() => {
          this.controller.setTextSelection(-1, -1, {menuPolicy: MenuPolicy.HIDE})
          this.controller2.setTextSelection(-1, -1, {menuPolicy: MenuPolicy.HIDE})
          AppStorage.setOrCreate('textAreaStart', this.controller.getSelection().start)
          AppStorage.setOrCreate('textAreaEnd', this.controller.getSelection().end)
          AppStorage.setOrCreate('textInputStart', this.controller2.getSelection().start)
          AppStorage.setOrCreate('textInputEnd', this.controller2.getSelection().end)
        }).id('but1')

      Button('setTextSelection 0 3').height('3%')
        .onClick(() => {
          this.controller.setTextSelection(0, 3, {menuPolicy: MenuPolicy.DEFAULT})
          this.controller2.setTextSelection(0, 3, {menuPolicy: MenuPolicy.DEFAULT})
          AppStorage.setOrCreate('textAreaStart', this.controller.getSelection().start)
          AppStorage.setOrCreate('textAreaEnd', this.controller.getSelection().end)
          AppStorage.setOrCreate('textInputStart', this.controller2.getSelection().start)
          AppStorage.setOrCreate('textInputEnd', this.controller2.getSelection().end)
        }).id('but2')

      Button('setTextSelection null null').height('3%')
        .onClick(() => {
          this.controller.setTextSelection(null, null, {menuPolicy: MenuPolicy.SHOW})
          this.controller2.setTextSelection(null, null, {menuPolicy: MenuPolicy.SHOW})
          AppStorage.setOrCreate('textAreaStart', this.controller.getSelection().start)
          AppStorage.setOrCreate('textAreaEnd', this.controller.getSelection().end)
          AppStorage.setOrCreate('textInputStart', this.controller2.getSelection().start)
          AppStorage.setOrCreate('textInputEnd', this.controller2.getSelection().end)
        }).id('but3')

      Button('setTextSelection undefined undefined').height('3%')
        .onClick(() => {
          this.controller.setTextSelection(undefined, undefined, {menuPolicy: MenuPolicy.HIDE})
          this.controller2.setTextSelection(undefined, undefined, {menuPolicy: MenuPolicy.HIDE})
          AppStorage.setOrCreate('textAreaStart', this.controller.getSelection().start)
          AppStorage.setOrCreate('textAreaEnd', this.controller.getSelection().end)
          AppStorage.setOrCreate('textInputStart', this.controller2.getSelection().start)
          AppStorage.setOrCreate('textInputEnd', this.controller2.getSelection().end)
        }).id('but4')

      Button('setTextSelection 0.5 4.3').height('3%')
        .onClick(() => {
          this.controller.setTextSelection(0.5, 4.3, {menuPolicy: MenuPolicy.HIDE})
          this.controller2.setTextSelection(0.5, 4.3, {menuPolicy: MenuPolicy.HIDE})
          AppStorage.setOrCreate('textAreaStart', this.controller.getSelection().start)
          AppStorage.setOrCreate('textAreaEnd', this.controller.getSelection().end)
          AppStorage.setOrCreate('textInputStart', this.controller2.getSelection().start)
          AppStorage.setOrCreate('textInputEnd', this.controller2.getSelection().end)
        }).id('but5')

    }
  }
}