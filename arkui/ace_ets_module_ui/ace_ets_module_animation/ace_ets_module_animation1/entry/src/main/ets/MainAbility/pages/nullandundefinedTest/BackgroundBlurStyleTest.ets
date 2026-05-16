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
struct BackgroundBlurStyleTest {
  build() {
    Row() {
      Column() {
        // backgroundBlurStyle(value: BlurStyle, options?: BackgroundBlurStyleOptions): T;

        // Test 1: Default value (not set)
        Stack() {
          Text('backgroundBlurStyle default')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backgroundBlurStyle_default')

        // Test 2: Regular enum
        Stack() {
          Text('backgroundBlurStyle Regular')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backgroundBlurStyle_Regular')
        .backgroundBlurStyle(BlurStyle.Regular)

        // Test 3: NONE enum
        Stack() {
          Text('backgroundBlurStyle NONE')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backgroundBlurStyle_NONE')
        .backgroundBlurStyle(BlurStyle.NONE)

        // Test 4: COMPONENT_ULTRA_THIN enum
        Stack() {
          Text('backgroundBlurStyle COMPONENT_ULTRA_THIN')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backgroundBlurStyle_COMPONENT_ULTRA_THIN')
        .backgroundBlurStyle(BlurStyle.COMPONENT_ULTRA_THIN)

        // Test 5: COMPONENT_THIN enum
        Stack() {
          Text('backgroundBlurStyle COMPONENT_THIN')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backgroundBlurStyle_COMPONENT_THIN')
        .backgroundBlurStyle(BlurStyle.COMPONENT_THIN)

        // Test 6: COMPONENT_REGULAR enum
        Stack() {
          Text('backgroundBlurStyle COMPONENT_REGULAR')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backgroundBlurStyle_COMPONENT_REGULAR')
        .backgroundBlurStyle(BlurStyle.COMPONENT_REGULAR)

        // Test 7: COMPONENT_THICK enum
        Stack() {
          Text('backgroundBlurStyle COMPONENT_THICK')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backgroundBlurStyle_COMPONENT_THICK')
        .backgroundBlurStyle(BlurStyle.COMPONENT_THICK)

        // Test 8: COMPONENT_ULTRA_THICK enum
        Stack() {
          Text('backgroundBlurStyle COMPONENT_ULTRA_THICK')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backgroundBlurStyle_COMPONENT_ULTRA_THICK')
        .backgroundBlurStyle(BlurStyle.COMPONENT_ULTRA_THICK)

        // Test 9: null parameter
        Stack() {
          Text('backgroundBlurStyle null')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backgroundBlurStyle_null')
        .backgroundBlurStyle(null)

        // Test 10: undefined parameter
        Stack() {
          Text('backgroundBlurStyle undefined')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backgroundBlurStyle_undefined')
        .backgroundBlurStyle(undefined)

        // Test 11: with options - ALWAYS_INACTIVE policy
        Stack() {
          Text('backgroundBlurStyle ALWAYS_INACTIVE')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backgroundBlurStyle_ALWAYS_INACTIVE')
        .backgroundBlurStyle(BlurStyle.Regular, {
          policy: BlurStyleActivePolicy.ALWAYS_INACTIVE,
        })

        // backgroundBlurStyle(style: Optional<BlurStyle>, options?: BackgroundBlurStyleOptions): T;

        // Test 12: Optional style with default
        Stack() {
          Text('backgroundBlurStyle Optional default')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backgroundBlurStyle_Optional_default')

        // Test 13: Optional style with Regular
        Stack() {
          Text('backgroundBlurStyle Optional Regular')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backgroundBlurStyle_Optional_Regular')
        .backgroundBlurStyle(BlurStyle.Regular)

        // Test 14: Optional style with null
        Stack() {
          Text('backgroundBlurStyle Optional null')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backgroundBlurStyle_Optional_null')
        .backgroundBlurStyle(null)

        // Test 15: Optional style with undefined
        Stack() {
          Text('backgroundBlurStyle Optional undefined')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backgroundBlurStyle_Optional_undefined')
        .backgroundBlurStyle(undefined)

        // Test 16: Optional style with options ALWAYS_INACTIVE
        Stack() {
          Text('backgroundBlurStyle Optional ALWAYS_INACTIVE')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backgroundBlurStyle_Optional_ALWAYS_INACTIVE')
        .backgroundBlurStyle(BlurStyle.Regular, {
          policy: BlurStyleActivePolicy.ALWAYS_INACTIVE,
        })

        // backgroundBlurStyle(style: Optional<BlurStyle>, options?: BackgroundBlurStyleOptions, sysOptions?: SystemAdaptiveOptions): T;

        // Test 17: Three parameters default
        Stack() {
          Text('backgroundBlurStyle Three default')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backgroundBlurStyle_Three_default')

        // Test 18: Three parameters with Regular
        Stack() {
          Text('backgroundBlurStyle Three Regular')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backgroundBlurStyle_Three_Regular')
        .backgroundBlurStyle(BlurStyle.Regular)

        // Test 19: Three parameters with null
        Stack() {
          Text('backgroundBlurStyle Three null')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backgroundBlurStyle_Three_null')
        .backgroundBlurStyle(null)

        // Test 20: Three parameters with undefined
        Stack() {
          Text('backgroundBlurStyle Three undefined')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backgroundBlurStyle_Three_undefined')
        .backgroundBlurStyle(undefined)

        // Test 21: Three parameters with options null
        Stack() {
          Text('backgroundBlurStyle Three options null')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backgroundBlurStyle_Three_options_null')
        .backgroundBlurStyle(BlurStyle.Regular, null)

        // Test 22: Three parameters with options undefined
        Stack() {
          Text('backgroundBlurStyle Three options undefined')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backgroundBlurStyle_Three_options_undefined')
        .backgroundBlurStyle(BlurStyle.Regular, undefined)

        // Test 23: Three parameters with options ALWAYS_INACTIVE
        Stack() {
          Text('backgroundBlurStyle Three ALWAYS_INACTIVE')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backgroundBlurStyle_Three_ALWAYS_INACTIVE')
        .backgroundBlurStyle(BlurStyle.Regular, {
          policy: BlurStyleActivePolicy.ALWAYS_INACTIVE,

        })

        // Test 24: Three parameters with sysOptions null
        Stack() {
          Text('backgroundBlurStyle Three sysOptions null')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backgroundBlurStyle_Three_sysOptions_null')
        .backgroundBlurStyle(BlurStyle.Regular, undefined, null)

        // Test 25: Three parameters with sysOptions undefined
        Stack() {
          Text('backgroundBlurStyle Three sysOptions undefined')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backgroundBlurStyle_Three_sysOptions_undefined')
        .backgroundBlurStyle(BlurStyle.Regular, undefined, undefined)

        // Test 26: Three parameters with sysOptions true
        Stack() {
          Text('backgroundBlurStyle Three sysOptions true')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backgroundBlurStyle_Three_sysOptions_true')
        .backgroundBlurStyle(BlurStyle.Regular, undefined, {
          disableSystemAdaptation: true
        })

        // Test 27: Three parameters with sysOptions false
        Stack() {
          Text('backgroundBlurStyle Three sysOptions false')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('backgroundBlurStyle_Three_sysOptions_false')
        .backgroundBlurStyle(BlurStyle.Regular, undefined, {
          disableSystemAdaptation: false
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}