/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { LengthUnit, LengthMetrics } from '@ohos.arkui.node';

// xxx.ets
@Entry
@Component
struct SpanBaselineOffsetTest {
  build() {
    Column({ space: 10 }) {
      Text('type: Switch ').fontSize(12).fontColor(0xcccccc).width('90%')
      Column({ space: 5 }) {
        Text() {
          Span('基准1')
          Span('Span baselineOffset')
            .baselineOffset(new LengthMetrics(10, LengthUnit.VP))
            .fontColor(0x2577e3)
            .key('SpanBaselineOffsetKey001')
        }.fontSize(20).fontColor(0x106836)

        Text() {
          Span('基准2')
          ImageSpan($r('app.media.icon')).width('30vp')
            .height('30vp')
            .baselineOffset(new LengthMetrics(5, LengthUnit.VP))
            .key('SpanBaselineOffsetKey002')
        }
        .fontSize(20)
        .fontColor(0x106836)
      }
    }
    .width('100%')
    .padding(24)
  }
}