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
import router from '@ohos.router';

@Entry
@Component
struct KeyBoradTest {
  @State text: string = 'text1';
  @State text2: string = 'text2';
  @State positionInfo: CaretOffset = { index: 0, x: 0, y: 0 }
  controller: TextInputController = new TextInputController()
  build() {
    Row() {
      Column() {
        TextInput({ text: this.text, placeholder: 'input your word...', controller: this.controller })
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .width('95%')
          .height(40)
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value
          })
          .id('textInput')
        TextInput({ text: this.text2, placeholder: 'input your word...', controller: this.controller })
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .width('95%')
          .height(40)
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text2 = value
          })
          .id('textInput2')
      }
      .width('100%')
    }
    .height('100%')
  }
}