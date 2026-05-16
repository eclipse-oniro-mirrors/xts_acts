/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {$r, HorizontalAlign, ColumnOptions, Entry, Component, TextClock, Column, Row} from '@ohos.arkui.component'

@Entry
@Component
struct TextClockDateTimeOptions {
  build() {
    Column({ space: 8 } as ColumnOptions) {
        TextClock()
          .format($r('app.string.textClock1'))
          .id('TextClockFormat')
          TextClock().format(undefined).id('TextClockFormat1')
          // TextClock().format(null).id('TextClockFormat2')
          TextClock().format('yyyy年M月d日').id('TextClockFormat3')
    }
    .alignItems(HorizontalAlign.Start)
  }
}