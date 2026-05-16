'use static'
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

import {
  Entry,
  Component,
  Scroll,
  Column,
  Text,
  Span,
} from '@kit.ArkUI';

@Entry
@Component
struct SpanFontVariations {
  build() {
    Scroll() {
      Column() {
        Text('Span fontVariations default') {
          Span('Span default')
            .id('span_fontVariations_default')
        }
        .width('100%')
        .height('5%')


        Text('Span fontVariations with array') {
          Span('Span with array')
            .fontVariations([{ axis: 'weight', value: 900 }])
            .id('span_fontVariations_array')
        }
        .width('100%')
        .height('5%')


        Text('Span fontVariations with multiple axes') {
          Span('Span with multi axes')
            .fontVariations([{ axis: 'weight', value: 700 }, { axis: 'ital', value: 1 }])
            .id('span_fontVariations_multi')
        }
        .width('100%')
        .height('5%')

        Text('Span fontVariations with undefined') {
          Span('Span with undefined')
            .fontVariations(undefined)
            .id('span_fontVariations_undefined')
        }
        .width('100%')
        .height('5%')


        Text('Span fontVariations with empty array') {
          Span('Span with empty array')
            .fontVariations([])
            .id('span_fontVariations_empty')
        }
        .width('100%')
        .height('5%')

      }
      .width('100%')
    }
    .height('100%')
  }
}