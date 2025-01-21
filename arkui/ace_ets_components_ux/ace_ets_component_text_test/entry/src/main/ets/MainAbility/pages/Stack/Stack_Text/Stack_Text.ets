/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
struct Stack_Text {
  @State types: TextDataDetectorType[] = [];
  @State text: string = ''
  @State text1: string = ''
  private selectedTime: Date = new Date('2022-07-22T08:00:00')

  build() {
    Column() {
      Text('15544889999').width('90%')
        .enableDataDetector(true).key('Stack_Text')
        .dataDetectorConfig({ types: this.types, onDetectResultUpdate: (result: string) => {
        } })

      TextInput({ text: this.text1 })
        .enableAutoFill(true)
        .passwordRules('1111')
        .key('Stack_TextInput')
        .type(InputType.NEW_PASSWORD)
        .type(InputType.NUMBER_PASSWORD)
        .type(InputType.SCREEN_LOCK_PASSWORD)
        .type(InputType.NUMBER_DECIMAL)
        .type(InputType.USER_NAME)
        .onSubmit((enterKey: EnterKeyType, event: SubmitEvent) => { // 用户名不正确会清空输入框和用户名并提示错误文本
          event.keepEditableState();
        })

      Row() {
        Button('Emphasized', { controlSize: ControlSize.SMALL, buttonStyle: ButtonStyleMode.EMPHASIZED })
          .id('Stack_Text_Button1')
        Button('Normal', { controlSize: ControlSize.NORMAL, buttonStyle: ButtonStyleMode.NORMAL })
          .id('Stack_Text_Button2')
        Button('Textual', { controlSize: ControlSize.SMALL, buttonStyle: ButtonStyleMode.TEXTUAL })
          .id('Stack_Text_Button3')
      }
    }
  }
}