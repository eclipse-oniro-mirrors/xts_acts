/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
@Entry
@Component
struct TextInputCaret {
  @State changeValue: string = '123456789'
  @State submitValue: string = ''
  @State text: string = ''
  @State text1: string = ''
  @State positionInfo: CaretOffset = { index: 0, x: 0, y: 0 }
  controller: TextInputController = new TextInputController()

  build() {
    Column() {
      TextInput({ text:"12345", placeholder: 'input your word...', controller: this.controller })
        .height(200)
      Text(this.text).fontSize(18).margin(15).key('inputCaretText')

      Button('getCaret').onClick((event: ClickEvent) => {
        this.positionInfo = this.controller.getCaretOffset()
        this.text = this.positionInfo.index + ''
      }).key('inputGetCaret')

    }.width('100%')
  }
}