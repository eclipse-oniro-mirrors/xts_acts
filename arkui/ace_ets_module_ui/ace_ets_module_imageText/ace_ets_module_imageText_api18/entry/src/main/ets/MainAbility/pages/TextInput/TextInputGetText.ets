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
struct TextInputGetText {
  controller: TextInputController = new TextInputController();

  build() {
    Column({ space: 1 }) {
      Text('TextInput:getText、clearPreViewText')
        .width('90%').height('5%')

      TextInput({ text: 'abcdef', controller: this.controller })
        .id('TextInput_getText')
        .width('90%').height('5%')

      Row() {
        Button('clearPreViewText')
          .id('TextInput_clearPreViewText')
          .width('50%')
          .height('5%')
          .onClick(() => {
            this.controller.clearPreviewText()
            AppStorage.setOrCreate('clearPreViewText_TextInput', 'succ')
            console.log('clearPreViewText_TextInput succ')
          })
      }
    }
  }
}