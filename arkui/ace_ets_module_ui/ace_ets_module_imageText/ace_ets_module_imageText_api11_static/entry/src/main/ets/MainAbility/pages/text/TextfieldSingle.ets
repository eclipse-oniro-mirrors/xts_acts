'use static';
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
import {
  Entry,
  Component,
  Column,
  TextInputController,
  TextInput,
  Color
} from '@ohos.arkui.component'
import {
  State,
} from '@ohos.arkui.stateManagement'
@Entry
@Component
struct TextfieldSingle {

  @State text: string = ''
  controller: TextInputController = new TextInputController()

  build() {
    Column() {
      TextInput({ text: this.text, placeholder: 'input your word...', controller: this.controller })
        .key("ArkUX_Text_Visual_static_0040")
        .selectAll(true)
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 25, weight: 400 })
        .caretColor(Color.Blue)
        .width(400)
        .height(80)
        .margin(20)
        .fontSize(35)
        .fontColor(Color.Black)
        .onChange((value: string) :void=> {
          this.text = value
        })

      TextInput({ text: this.text, placeholder: 'input your word...', controller: this.controller })
        .key("ArkUX_Text_Visual_static_0050")
        .selectAll(false)
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 25, weight: 400 })
        .caretColor(Color.Blue)
        .width(400)
        .height(80)
        .margin(20)
        .fontSize(35)
        .fontColor(Color.Black)
        .onChange((value: string) : void=> {
          this.text = value
        })

      TextInput({ text: this.text, placeholder: 'input your word...', controller: this.controller })
        .key("ArkUX_Text_Visual_static_0060")
        .selectAll(undefined)
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 25, weight: 400 })
        .caretColor(Color.Blue)
        .width(400)
        .height(80)
        .margin(20)
        .fontSize(35)
        .fontColor(Color.Black)
        .onChange((value: string) :void=> {
          this.text = value
        })
    }.width('100%')
  }
}