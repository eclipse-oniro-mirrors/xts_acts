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

@Entry
@Component
struct TextInputShowCounter {

  build() {
    Column() {
      TextInput({ text: 'showCounter: true' })
        .id("showCounter_true")
        .placeholderFont({ size: 16 })
        .width('90%')
        .height('5%')
        .showCounter(true, { thresholdPercentage: 40, highlightBorder: true })

      TextInput({ text: 'showCounter: false' })
        .id("showCounter_false")
        .placeholderFont({ size: 16 })
        .width('90%')
        .height('5%')
        .showCounter(false, { thresholdPercentage: 200, highlightBorder: true })

      TextInput({ text: 'showCounter: undefined' })
        .id("showCounter_undefined")
        .placeholderFont({ size: 16 })
        .width('90%')
        .height('5%')
        .showCounter(undefined)

      TextInput({ text: 'showCounter: default' })
        .id("showCounter_default")
        .placeholderFont({ size: 16 })
        .width('90%')
        .height('5%')

      TextInput({ text: 'highlightBorder: false' })
        .id("highlightBorder_false")
        .placeholderFont({ size: 16 })
        .width('90%')
        .height('5%')
        .showCounter(false, { thresholdPercentage: -10, highlightBorder: false })

      TextInput({ text: 'highlightBorder: undefined' })
        .id("highlightBorder_undefined")
        .placeholderFont({ size: 16 })
        .width('90%')
        .height('5%')
        .showCounter(true, { thresholdPercentage: undefined, highlightBorder: undefined })
    }
  }
}