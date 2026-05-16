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
struct TextAreaTypeTest {
  build() {
    Column() {
      // TextAreaType.PHONE_NUMBER test
      TextArea({ placeholder: 'TextAreaType.PHONE_NUMBER test' })
        .width('100%')
        .height('5%')
        .key('key_textArea_type_phoneNumber')
        .type(TextAreaType.PHONE_NUMBER)

      // TextAreaType.EMAIL test
      TextArea({ placeholder: 'TextAreaType.EMAIL test' })
        .width('100%')
        .height('5%')
        .key('key_textArea_type_email')
        .type(TextAreaType.EMAIL)
    }
    .width('100%')
    .height('100%')
  }
}
