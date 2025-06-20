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
struct TextInputFontFeature {

  build() {
    Column({ space: 5 }) {
      TextInput({ text: 'fontFeature: on' })
        .id('TextInput_fontFeature_on')
        .fontFeature("\"ss01\" on")
        .height('5%')
        .fontSize(15)

      TextInput({ text: 'fontFeature: off' })
        .id('TextInput_fontFeature_off')
        .fontFeature("\"ss01\" off")
        .height('5%')
        .fontSize(15)

      TextInput({ text: 'fontFeature: default' })
        .id('TextInput_fontFeature_default')
        .height('5%')
        .fontSize(15)

      TextInput({ text: 'fontFeature: undefined' })
        .id('TextInput_fontFeature_undefined')
        .fontFeature(undefined)
        .height('5%')
        .fontSize(15)
    }
    .width("90%")
    .margin("5%")
  }
}