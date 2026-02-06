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
  Entry, Component,
  Column, Row, TextInput, TextDecorationOptions, TextDecorationType
} from '@ohos.arkui.component'

@Entry
@Component
struct TextInputDecorationTest {
  build(){
    Row() {
      Column() {
        TextInput({ placeholder: 'placeholder(TextInput)' })
          .width('100%')
          .key('key_textInput_decoration_001')
          .decoration({ type: TextDecorationType.Underline, color: 0xFF0000 } as TextDecorationOptions)
      }
      .width('100%')
    }
    .height('100%')
  }
}