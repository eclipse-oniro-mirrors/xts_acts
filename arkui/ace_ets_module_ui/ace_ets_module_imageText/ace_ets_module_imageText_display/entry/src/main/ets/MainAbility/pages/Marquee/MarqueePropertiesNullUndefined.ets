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
struct MarqueePropertiesNullUndefinedTest {
  build() {
    Column() {
      Scroll() {
        Column() {
          // ========== fontColor tests ==========
          Text('fontColor Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Marquee({
              start: true,
              src: 'fontColor default'
            })
              .width('25%')
              .height('5%')
              .id('Marquee_fontColor_default')

            // Null
            Marquee({
              start: true,
              src: 'fontColor null'
            })
              .width('25%')
              .height('5%')
              .id('Marquee_fontColor_null')
              .fontColor(null)

            // Undefined
            Marquee({
              start: true,
              src: 'fontColor undefined'
            })
              .width('25%')
              .height('5%')
              .id('Marquee_fontColor_undefined')
              .fontColor(undefined)

            // Empty string
            Marquee({
              start: true,
              src: 'fontColor '
            })
              .width('25%')
              .height('5%')
              .id('Marquee_fontColor_empty')
              .fontColor('' as ResourceColor)
          }
          .width('100%')

          // ========== fontSize tests ==========
          Text('fontSize Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Marquee({
              start: true,
              src: 'fontSize default'
            })
              .width('25%')
              .height('5%')
              .id('Marquee_fontSize_default')

            // Null
            Marquee({
              start: true,
              src: 'fontSize null'
            })
              .width('25%')
              .height('5%')
              .id('Marquee_fontSize_null')
              .fontSize(null)

            // Undefined
            Marquee({
              start: true,
              src: 'fontSize undefined'
            })
              .width('25%')
              .height('5%')
              .id('Marquee_fontSize_undefined')
              .fontSize(undefined)

            // Empty string
            Marquee({
              start: true,
              src: 'fontSize '
            })
              .width('25%')
              .height('5%')
              .id('Marquee_fontSize_empty')
              .fontSize('' as Length)
          }
          .width('100%')

          // ========== fontWeight tests ==========
          Text('fontWeight Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Marquee({
              start: true,
              src: 'fontWeight default'
            })
              .width('25%')
              .height('5%')
              .id('Marquee_fontWeight_default')

            // Null
            Marquee({
              start: true,
              src: 'fontWeight null'
            })
              .width('25%')
              .height('5%')
              .id('Marquee_fontWeight_null')
              .fontWeight(null)

            // Undefined
            Marquee({
              start: true,
              src: 'fontWeight undefined'
            })
              .width('25%')
              .height('5%')
              .id('Marquee_fontWeight_undefined')
              .fontWeight(undefined)

            // Empty string
            Marquee({
              start: true,
              src: 'fontWeight '
            })
              .width('25%')
              .height('5%')
              .id('Marquee_fontWeight_empty')
              .fontWeight('')
          }
          .width('100%')

          // ========== fontFamily tests ==========
          Text('fontFamily Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Marquee({
              start: true,
              src: 'fontFamily default'
            })
              .width('25%')
              .height('5%')
              .id('Marquee_fontFamily_default')

            // Null
            Marquee({
              start: true,
              src: 'fontFamily null'
            })
              .width('25%')
              .height('5%')
              .id('Marquee_fontFamily_null')
              .fontFamily(null)

            // Undefined
            Marquee({
              start: true,
              src: 'fontFamily undefined'
            })
              .width('25%')
              .height('5%')
              .id('Marquee_fontFamily_undefined')
              .fontFamily(undefined)

            // Empty string
            Marquee({
              start: true,
              src: 'fontFamily '
            })
              .width('25%')
              .height('5%')
              .id('Marquee_fontFamily_empty')
              .fontFamily('')
          }
          .width('100%')

          // ========== marqueeUpdateStrategy tests ==========
          Text('marqueeUpdateStrategy Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Marquee({
              start: true,
              src: 'marqueeUpdateStrategy default'
            })
              .width('30%')
              .height('5%')
              .id('Marquee_marqueeUpdateStrategy_default')

            // Null
            Marquee({
              start: true,
              src: 'marqueeUpdateStrategy null'
            })
              .width('30%')
              .height('5%')
              .id('Marquee_marqueeUpdateStrategy_null')
              .marqueeUpdateStrategy(null)

            // Undefined
            Marquee({
              start: true,
              src: 'marqueeUpdateStrategy undefined'
            })
              .width('30%')
              .height('5%')
              .id('Marquee_marqueeUpdateStrategy_undefined')
              .marqueeUpdateStrategy(undefined)
          }
          .width('100%')
        }
      }
    }
    .width('100%')
    .height('100%')
  }
}
