/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
struct TextFontVariations {
  build() {
    Scroll() {
      Column() {
        Text('Text fontVariations default')
          .width('100%')
          .height('5%')
          .id('text_fontVariations_default')

        Text('Text fontVariations with array')
          .width('100%')
          .height('5%')
          .id('text_fontVariations_array')
          .fontVariations([{ axis: 'weight', value: 900 }])

        Text('Text fontVariations with multiple axes')
          .width('100%')
          .height('5%')
          .id('text_fontVariations_multi')
          .fontVariations([{ axis: 'weight', value: 700 }, { axis: 'ital', value: 1 }])

        Text('Text fontVariations with null')
          .width('100%')
          .height('5%')
          .id('text_fontVariations_null')
          .fontVariations(null)

        Text('Text fontVariations with undefined')
          .width('100%')
          .height('5%')
          .id('text_fontVariations_undefined')
          .fontVariations(undefined)

        Text('Text fontVariations with empty array')
          .width('100%')
          .height('5%')
          .id('text_fontVariations_empty')
          .fontVariations([])
      }
      .width('100%')
    }
    .height('100%')
  }
}