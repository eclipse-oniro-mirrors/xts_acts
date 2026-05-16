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
struct TextAreaGetText {
  controller: TextAreaController = new TextAreaController();

  build() {
    Column({ space: 1 }) {
      Text('TextArea:getText、clearPreViewText')
        .width('90%').height('5%')

      TextArea({ text: 'abcdef', controller: this.controller })
        .id('TextArea_getText')
        .width('90%').height('5%')

      Row() {
        Button('clearPreViewText')
          .id('TextArea_clearPreViewText')
          .width('50%')
          .height('5%')
          .onClick(() => {
            this.controller.clearPreviewText()
            AppStorage.setOrCreate('clearPreViewText_TextArea', 'succ')
            console.log('clearPreViewText_TextArea succ')
          })

        Button('设置start和end')
          .id('TextArea_getText_1')
          .width('50%')
          .height('5%')
          .onClick(() => {
            let message = this.controller.getText({ start: 2, end: 4 })
            AppStorage.setOrCreate('getText_1', message)
            console.log('getText1:' + message)
          })
      }

      Row() {
        Button('只设置start')
          .id('TextArea_getText_2')
          .width('50%')
          .height('5%')
          .onClick(() => {
            let message = this.controller.getText({ start: 1 })
            AppStorage.setOrCreate('getText_2', message)
            console.log('getText2:' + message)
          })

        Button('只设置end')
          .id('TextArea_getText_3')
          .width('50%')
          .height('5%')
          .onClick(() => {
            let message = this.controller.getText({ end: 3 })
            AppStorage.setOrCreate('getText_3', message)
            console.log('getText3:' + message)
          })
      }

      Row() {
        Button('start设置undefined')
          .id('TextArea_getText_4')
          .width('50%')
          .height('5%')
          .onClick(() => {
            let message = this.controller.getText({ start: undefined })
            AppStorage.setOrCreate('getText_4', message)
            console.log('getText4:' + message)
          })

        Button('end设置undefined')
          .id('TextArea_getText_5')
          .width('50%')
          .height('5%')
          .onClick(() => {
            let message = this.controller.getText({ end: undefined })
            AppStorage.setOrCreate('getText_5', message)
            console.log('getText5:' + message)
          })
      }

      Row() {
        Button('start和end设置undefined')
          .id('TextArea_getText_6')
          .width('50%')
          .height('5%')
          .onClick(() => {
            let message = this.controller.getText({ start: undefined, end: undefined })
            AppStorage.setOrCreate('getText_6', message)
            console.log('getText6:' + message)
          })

        Button('不设置TextRange')
          .id('TextArea_getText_7')
          .width('50%')
          .height('5%')
          .onClick(() => {
            let message = this.controller.getText()
            AppStorage.setOrCreate('getText_7', message)
            console.log('getText7:' + message)
          })
      }
    }
  }
}