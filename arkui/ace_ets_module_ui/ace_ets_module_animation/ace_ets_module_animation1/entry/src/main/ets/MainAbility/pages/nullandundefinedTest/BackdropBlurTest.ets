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
struct BackdropBlurTest {
  build() {
    Row() {
      Column() {
        // backdropBlur(value: number, options?: BlurOptions): T;

        // Test 1: Default value (not set)
        Stack() {
          Text('backdropBlur default')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backdropBlur_default')

        // Test 2: With value (normal case)
        Stack() {
          Text('backdropBlur value 10')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backdropBlur_value_10')
        .backdropBlur(10)

        // Test 3: With value 0 (no blur)
        Stack() {
          Text('backdropBlur value 0')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backdropBlur_value_0')
        .backdropBlur(0)

        // Test 4: With value and options
        Stack() {
          Text('backdropBlur with options')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backdropBlur_with_options')
        .backdropBlur(15, { grayscale: [20, 60] })

        // backdropBlur(radius: Optional<number>, options?: BlurOptions): T;

        // Test 5: Optional radius default
        Stack() {
          Text('backdropBlur Optional default')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backdropBlur_Optional_default')

        // Test 6: Optional radius with value
        Stack() {
          Text('backdropBlur Optional value')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backdropBlur_Optional_value')
        .backdropBlur(20)

        // Test 7: Optional radius with null
        Stack() {
          Text('backdropBlur Optional null')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backdropBlur_Optional_null')
        .backdropBlur(null)

        // Test 8: Optional radius with undefined
        Stack() {
          Text('backdropBlur Optional undefined')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backdropBlur_Optional_undefined')
        .backdropBlur(undefined)

        // Test 9: Optional radius with options null
        Stack() {
          Text('backdropBlur Optional options null')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backdropBlur_Optional_options_null')
        .backdropBlur(20, null)

        // Test 10: Optional radius with options undefined
        Stack() {
          Text('backdropBlur Optional options undefined')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backdropBlur_Optional_options_undefined')
        .backdropBlur(20, undefined)

        // backdropBlur(radius: Optional<number>, options?: BlurOptions, sysOptions?: SystemAdaptiveOptions): T;

        // Test 11: Three parameters default
        Stack() {
          Text('backdropBlur Three default')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backdropBlur_Three_default')

        // Test 12: Three parameters with value
        Stack() {
          Text('backdropBlur Three value')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backdropBlur_Three_value')
        .backdropBlur(25)

        // Test 13: Three parameters with null
        Stack() {
          Text('backdropBlur Three null')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backdropBlur_Three_null')
        .backdropBlur(null)

        // Test 14: Three parameters with undefined
        Stack() {
          Text('backdropBlur Three undefined')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backdropBlur_Three_undefined')
        .backdropBlur(undefined)

        // Test 15: Three parameters with options null
        Stack() {
          Text('backdropBlur Three options null')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backdropBlur_Three_options_null')
        .backdropBlur(25, null)

        // Test 16: Three parameters with options undefined
        Stack() {
          Text('backdropBlur Three options undefined')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backdropBlur_Three_options_undefined')
        .backdropBlur(25, undefined)

        // Test 17: Three parameters with sysOptions null
        Stack() {
          Text('backdropBlur Three sysOptions null')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backdropBlur_Three_sysOptions_null')
        .backdropBlur(25, undefined, null)

        // Test 18: Three parameters with sysOptions undefined
        Stack() {
          Text('backdropBlur Three sysOptions undefined')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backdropBlur_Three_sysOptions_undefined')
        .backdropBlur(25, undefined, undefined)

        // Test 19: Three parameters with sysOptions disableSystemAdaptation true
        Stack() {
          Text('backdropBlur Three sysOptions true')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backdropBlur_Three_sysOptions_true')
        .backdropBlur(25, undefined, {
          disableSystemAdaptation: true
        })

        // Test 20: Three parameters with sysOptions disableSystemAdaptation false
        Stack() {
          Text('backdropBlur Three sysOptions false')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backdropBlur_Three_sysOptions_false')
        .backdropBlur(25, undefined, {
          disableSystemAdaptation: false
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}