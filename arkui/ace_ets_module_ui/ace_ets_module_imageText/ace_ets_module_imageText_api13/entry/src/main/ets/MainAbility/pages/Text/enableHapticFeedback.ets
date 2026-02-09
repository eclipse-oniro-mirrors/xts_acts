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
struct EnableHapticFeedback1 {
  @State value: boolean | undefined = true
  controller1: RichEditorController = new RichEditorController();
  controller2: RichEditorController = new RichEditorController();
  options1: RichEditorOptions = { controller: this.controller1 };
  options2: RichEditorOptions = { controller: this.controller2 };

  build() {
    Column() {
      Row(){
        Text('enableHapticFeedback: ')
          .enableHapticFeedback(this.value)
          .id('Text_enableHapticFeedback')
          .width('50%').height('5%')

        Text('' + this.value)
          .id('Text_enableHapticFeedback_default')
          .width('50%').height('5%')
      }

      Row(){
        TextInput({ text: 'TextInput' })
          .enableHapticFeedback(this.value)
          .id('TextInput_enableHapticFeedback')
          .width('50%').height('5%')

        TextInput({ text: 'default' })
          .id('TextInput_enableHapticFeedback_default')
          .width('50%').height('5%')
      }

      Row(){
        TextArea({ text: 'TextArea' })
          .enableHapticFeedback(this.value)
          .id('TextArea_enableHapticFeedback')
          .width('50%').height('5%')

        TextArea({ text: 'default' })
          .id('TextArea_enableHapticFeedback_default')
          .width('50%').height('5%')
      }

      Row(){
        Search({ value: 'Search' })
          .enableHapticFeedback(this.value)
          .id('Search_enableHapticFeedback')
          .width('50%').height('5%')

        Search({ value: 'default' })
          .id('Search_enableHapticFeedback_default')
          .width('50%').height('5%')
      }

      Row(){
        RichEditor(this.options1)
          .enableHapticFeedback(this.value)
          .id('RichEditor_enableHapticFeedback')
          .width('50%').height('5%')
          .onReady(() => {
            this.controller1.addTextSpan('RichEditor')
          })

        RichEditor(this.options2)
          .id('RichEditor_enableHapticFeedback_default')
          .width('50%').height('5%')
          .onReady(() => {
            this.controller2.addTextSpan('default')
          })
      }

      Button('True').id('enableHapticFeedback_true')
        .height('5%')
        .onClick(() => {
          this.value = true
        })
      Button('false').id('enableHapticFeedback_false')
        .height('5%')
        .onClick(() => {
          this.value = false
        })
      Button('undefined').id('enableHapticFeedback_undefined')
        .height('5%')
        .onClick(() => {
          this.value = undefined
        })
    }
  }
}