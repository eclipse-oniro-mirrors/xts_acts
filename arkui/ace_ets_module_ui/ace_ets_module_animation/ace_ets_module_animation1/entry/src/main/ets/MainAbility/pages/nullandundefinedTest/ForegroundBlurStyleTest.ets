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
struct ForegroundBlurStyleTest {
  @State mInactiveColor: ResourceColor = '#FFFF0000'
  build() {
    Row() {
      Column() {
        // foregroundBlurStyle(value: BlurStyle, options?: ForegroundBlurStyleOptions): T;

        // Test 1: Default value (not set)
        Stack() {
          Text('foregroundBlurStyle default')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('foregroundBlurStyle_default')

        // Test 2: Regular enum
        Stack() {
          Text('foregroundBlurStyle Regular')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('foregroundBlurStyle_Regular')
        .foregroundBlurStyle(BlurStyle.Regular)

        // Test 3: Thick enum
        Stack() {
          Text('foregroundBlurStyle Thick')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('foregroundBlurStyle_Thick')
        .foregroundBlurStyle(BlurStyle.Thick)

        // Test 4: BACKGROUND_THIN enum
        Stack() {
          Text('foregroundBlurStyle BACKGROUND_THIN')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('foregroundBlurStyle_BACKGROUND_THIN')
        .foregroundBlurStyle(BlurStyle.BACKGROUND_THIN)

        // Test 5: BACKGROUND_REGULAR enum
        Stack() {
          Text('foregroundBlurStyle BACKGROUND_REGULAR')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('foregroundBlurStyle_BACKGROUND_REGULAR')
        .foregroundBlurStyle(BlurStyle.BACKGROUND_REGULAR)

        // Test 6: BACKGROUND_THICK enum
        Stack() {
          Text('foregroundBlurStyle BACKGROUND_THICK')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('foregroundBlurStyle_BACKGROUND_THICK')
        .foregroundBlurStyle(BlurStyle.BACKGROUND_THICK)

        // Test 7: BACKGROUND_ULTRA_THICK enum
        Stack() {
          Text('foregroundBlurStyle BACKGROUND_ULTRA_THICK')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('foregroundBlurStyle_BACKGROUND_ULTRA_THICK')
        .foregroundBlurStyle(BlurStyle.BACKGROUND_ULTRA_THICK)

        // Test 8: NONE enum
        Stack() {
          Text('foregroundBlurStyle NONE')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('foregroundBlurStyle_NONE')
        .foregroundBlurStyle(BlurStyle.NONE)

        // Test 9: COMPONENT_ULTRA_THIN enum
        Stack() {
          Text('foregroundBlurStyle COMPONENT_ULTRA_THIN')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('foregroundBlurStyle_COMPONENT_ULTRA_THIN')
        .foregroundBlurStyle(BlurStyle.COMPONENT_ULTRA_THIN)

        // Test 10: COMPONENT_THIN enum
        Stack() {
          Text('foregroundBlurStyle COMPONENT_THIN')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('foregroundBlurStyle_COMPONENT_THIN')
        .foregroundBlurStyle(BlurStyle.COMPONENT_THIN)

        // Test 11: COMPONENT_REGULAR enum
        Stack() {
          Text('foregroundBlurStyle COMPONENT_REGULAR')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('foregroundBlurStyle_COMPONENT_REGULAR')
        .foregroundBlurStyle(BlurStyle.COMPONENT_REGULAR)

        // Test 12: COMPONENT_THICK enum
        Stack() {
          Text('foregroundBlurStyle COMPONENT_THICK')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('foregroundBlurStyle_COMPONENT_THICK')
        .foregroundBlurStyle(BlurStyle.COMPONENT_THICK)

        // Test 13: COMPONENT_ULTRA_THICK enum
        Stack() {
          Text('foregroundBlurStyle COMPONENT_ULTRA_THICK')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('foregroundBlurStyle_COMPONENT_ULTRA_THICK')
        .foregroundBlurStyle(BlurStyle.COMPONENT_ULTRA_THICK)

        // foregroundBlurStyle(style: Optional<BlurStyle>, options?: ForegroundBlurStyleOptions): T;

        // Test 14: Optional style with default
        Stack() {
          Text('foregroundBlurStyle Optional default')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('foregroundBlurStyle_Optional_default')

        // Test 15: Optional style with Regular
        Stack() {
          Text('foregroundBlurStyle Optional Regular')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('foregroundBlurStyle_Optional_Regular')
        .foregroundBlurStyle(BlurStyle.Regular)

        // Test 16: Optional style with null
        Stack() {
          Text('foregroundBlurStyle Optional null')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('foregroundBlurStyle_Optional_null')
        .foregroundBlurStyle(null)

        // Test 17: Optional style with undefined
        Stack() {
          Text('foregroundBlurStyle Optional undefined')
            .width('100%')
            .height('5%')
            .fontSize(16)
            .backgroundColor('#f0f0f0')
            .borderRadius(8)
        }
        .width('100%')
        .height('5%')
        .id('foregroundBlurStyle_Optional_undefined')
        .foregroundBlurStyle(undefined)
      }
      .width('100%')
    }
    .height('100%')
  }
}