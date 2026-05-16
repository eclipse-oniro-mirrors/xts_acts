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
struct GaugePropertiesNullUndefinedTest {
  build() {
    Column() {
      Scroll() {
        Column() {
          // ========== value tests ==========
          Text('value Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Gauge({ value: 0, min: 0, max: 100 })
              .width('30%')
              .height('5%')
              .id('Gauge_value_default')

            // Null
            Gauge({ value: 0, min: 0, max: 100 })
              .width('30%')
              .height('5%')
              .id('Gauge_value_null')
              .value(null)

            // Undefined
            Gauge({ value: 0, min: 0, max: 100 })
              .width('30%')
              .height('5%')
              .id('Gauge_value_undefined')
              .value(undefined)
          }
          .width('100%')

          // ========== startAngle tests ==========
          Text('startAngle Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Gauge({ value: 50, min: 0, max: 100 })
              .width('30%')
              .height('5%')
              .id('Gauge_startAngle_default')

            // Null
            Gauge({ value: 50, min: 0, max: 100 })
              .width('30%')
              .height('5%')
              .id('Gauge_startAngle_null')
              .startAngle(null)

            // Undefined
            Gauge({ value: 50, min: 0, max: 100 })
              .width('30%')
              .height('5%')
              .id('Gauge_startAngle_undefined')
              .startAngle(undefined)
          }
          .width('100%')

          // ========== endAngle tests ==========
          Text('endAngle Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Gauge({ value: 50, min: 0, max: 100 })
              .width('30%')
              .height('5%')
              .id('Gauge_endAngle_default')

            // Null
            Gauge({ value: 50, min: 0, max: 100 })
              .width('30%')
              .height('5%')
              .id('Gauge_endAngle_null')
              .endAngle(null)

            // Undefined
            Gauge({ value: 50, min: 0, max: 100 })
              .width('30%')
              .height('5%')
              .id('Gauge_endAngle_undefined')
              .endAngle(undefined)
          }
          .width('100%')

          // ========== strokeWidth tests ==========
          Text('strokeWidth Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Gauge({ value: 50, min: 0, max: 100 })
              .width('30%')
              .height('5%')
              .id('Gauge_strokeWidth_default')

            // Null
            Gauge({ value: 50, min: 0, max: 100 })
              .width('30%')
              .height('5%')
              .id('Gauge_strokeWidth_null')
              .strokeWidth(null)

            // Undefined
            Gauge({ value: 50, min: 0, max: 100 })
              .width('30%')
              .height('5%')
              .id('Gauge_strokeWidth_undefined')
              .strokeWidth(undefined)

          }
          .width('100%')

          // ========== description tests ==========
          Text('description Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Gauge({ value: 50, min: 0, max: 100 })
              .width('30%')
              .height('5%')
              .id('Gauge_description_default')

            // Null
            Gauge({ value: 50, min: 0, max: 100 })
              .width('30%')
              .height('5%')
              .id('Gauge_description_null')
              .description(null)

            // Undefined
            Gauge({ value: 50, min: 0, max: 100 })
              .width('30%')
              .height('5%')
              .id('Gauge_description_undefined')
              .description(undefined)
          }
          .width('100%')

          // ========== privacySensitive tests ==========
          Text('privacySensitive Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Gauge({ value: 50, min: 0, max: 100 })
              .width('30%')
              .height('5%')
              .id('Gauge_privacySensitive_default')

            // Null
            Gauge({ value: 50, min: 0, max: 100 })
              .width('30%')
              .height('5%')
              .id('Gauge_privacySensitive_null')
              .privacySensitive(null)

            // Undefined
            Gauge({ value: 50, min: 0, max: 100 })
              .width('30%')
              .height('5%')
              .id('Gauge_privacySensitive_undefined')
              .privacySensitive(undefined)
          }
          .width('100%')

          // ========== contentModifier tests ==========
          Text('contentModifier Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Gauge({ value: 50, min: 0, max: 100 })
              .width('30%')
              .height('5%')
              .id('Gauge_contentModifier_default')

            // Null
            Gauge({ value: 50, min: 0, max: 100 })
              .width('30%')
              .height('5%')
              .id('Gauge_contentModifier_null')
              .contentModifier(null)

            // Undefined
            Gauge({ value: 50, min: 0, max: 100 })
              .width('30%')
              .height('5%')
              .id('Gauge_contentModifier_undefined')
              .contentModifier(undefined)
          }
          .width('100%')
        }
      }
    }
    .width('100%')
    .height('100%')
  }
}
