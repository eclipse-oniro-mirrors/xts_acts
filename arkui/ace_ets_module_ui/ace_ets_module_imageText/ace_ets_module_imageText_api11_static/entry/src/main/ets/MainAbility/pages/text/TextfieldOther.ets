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
  Entry,
  Component,
  Column,
  TextAreaController,
  InputCounterOptions,
  TextArea
} from '@ohos.arkui.component'
import {
  State,
} from '@ohos.arkui.stateManagement'
@Entry
@Component
struct TextfieldOther {

  @State text: string = ''
  @State input: number = 40
  controller: TextAreaController = new TextAreaController()
  inputCounterOptions: InputCounterOptions = {
    thresholdPercentage: 50
  } as InputCounterOptions

  build() {
    Column() {
      TextArea({
        text: this.text,
        controller: this.controller
      })
        .key("ArkUX_Text_Visual_static_0070")
        .placeholderFont({ size: 16, weight: 400 })
        .width(336)
        .height(56)
        .showCounter(true, { thresholdPercentage: this.input, highlightBorder: true })
        .maxLength(5)

      TextArea({
        text: this.text,
        controller: this.controller
      })
        .key("ArkUX_Text_Visual_static_0080")
        .placeholderFont({ size: 16, weight: 400 })
        .width(336)
        .height(56)
        .showCounter(false, { thresholdPercentage: this.input, highlightBorder: false })
        .maxLength(5)

      TextArea({
        text: this.text,
        controller: this.controller
      })
        .key("ArkUX_Text_Visual_static_0090")
        .placeholderFont({ size: 16, weight: 400 })
        .width(336)
        .height(56)
        .showCounter(true, { thresholdPercentage: this.input, highlightBorder: false })
        .maxLength(5)

      TextArea({
        text: this.text,
        controller: this.controller
      })
        .key("ArkUX_Text_Visual_static_0010")
        .placeholderFont({ size: 16, weight: 400 })
        .width(336)
        .height(56)
        .showCounter(undefined)
        .maxLength(5)
    }.width('100%').height('100%').backgroundColor('#F1F3F5')
  }
}