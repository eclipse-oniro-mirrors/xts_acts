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
struct TextInputType {

  build() {
    Column({ space: 1 }) {
      Text('TextInput: InputType新增枚举类型').height('5%')
      TextInput({ placeholder: 'InputType.URL' })
        .id("TextInputType_URL")
        .type(InputType.URL)
        .height('10%')

      TextInput({ placeholder: 'TextInputType: default' })
        .id('TextInputType_default')
        .height('10%')

      TextInput({ placeholder: 'TextInputType: undefined' })
        .id('TextInputType_undefined')
        .type(undefined)
        .height('10%')
    }.width('100%')
  }
}