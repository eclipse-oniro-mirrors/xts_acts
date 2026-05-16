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
struct ImageBlurTest {
  build() {
    Row() {
      Column() {
        // Test 1: blur(value: number, options?: BlurOptions): T

        // Test 1.1: blur with value parameter
        Stack() {
          Image($r('app.media.icon'))
            .width('90%')
            .height('5%')
            .id('blur_value_positive')
            .blur(10)
        }
        .width('100%')
        .height('5%')

        // Test 1.2: blur with value parameter (zero)
        Stack() {
          Image($r('app.media.icon'))
            .width('90%')
            .height('5%')
            .id('blur_value_zero')
            .blur(0)
        }
        .width('100%')
        .height('5%')

        // Test 1.3: blur with value parameter (large value)
        Stack() {
          Image($r('app.media.icon'))
            .width('90%')
            .height('5%')
            .id('blur_value_large')
            .blur(100)
        }
        .width('100%')
        .height('5%')

        // Test 1.4: blur with value parameter (null)
        Stack() {
          Image($r('app.media.icon'))
            .width('90%')
            .height('5%')
            .id('blur_value_null')
            .blur(null as number | null | undefined)
        }
        .width('100%')
        .height('5%')

        // Test 1.5: blur with value parameter (undefined)
        Stack() {
          Image($r('app.media.icon'))
            .width('90%')
            .height('5%')
            .id('blur_value_undefined')
            .blur(undefined as number | null | undefined)
        }
        .width('100%')
        .height('5%')

        // Test 1.6: blur with value and options parameters
        Stack() {
          Image($r('app.media.icon'))
            .width('90%')
            .height('5%')
            .id('blur_value_options')
            .blur(5)
        }
        .width('100%')
        .height('5%')

        // Test 1.7: blur with value and options parameters (null)
        Stack() {
          Image($r('app.media.icon'))
            .width('90%')
            .height('5%')
            .id('blur_value_options_null')
            .blur(5, null)
        }
        .width('100%')
        .height('5%')

        // Test 1.8: blur with value and options parameters (undefined)
        Stack() {
          Image($r('app.media.icon'))
            .width('90%')
            .height('5%')
            .id('blur_value_options_undefined')
            .blur(5, undefined as null | undefined)
        }
        .width('100%')
        .height('5%')

        // ========== blur(blurRadius: Optional<number>, options?: BlurOptions): T tests ==========

        // Test 2.1: blur with blurRadius parameter (positive)
        Stack() {
          Image($r('app.media.icon'))
            .width('90%')
            .height('5%')
            .id('blur_blurRadius_positive')
            .blur(10 as number | null | undefined)
        }
        .width('100%')
        .height('5%')

        // Test 2.2: blur with blurRadius parameter (zero)
        Stack() {
          Image($r('app.media.icon'))
            .width('90%')
            .height('5%')
            .id('blur_blurRadius_zero')
            .blur(0 as number | null | undefined)
        }
        .width('100%')
        .height('5%')

        // Test 2.3: blur with blurRadius parameter (null)
        Stack() {
          Image($r('app.media.icon'))
            .width('90%')
            .height('5%')
            .id('blur_blurRadius_null')
            .blur(null as number | null | undefined)
        }
        .width('100%')
        .height('5%')

        // Test 2.4: blur with blurRadius parameter (undefined)
        Stack() {
          Image($r('app.media.icon'))
            .width('90%')
            .height('5%')
            .id('blur_blurRadius_undefined')
            .blur(undefined as number | null | undefined)
        }
        .width('100%')
        .height('5%')

        // Test 2.5: blur with blurRadius and options parameters (positive)
        Stack() {
          Image($r('app.media.icon'))
            .width('90%')
            .height('5%')
            .id('blur_blurRadius_options_positive')
            .blur(5 as number | null | undefined)
        }
        .width('100%')
        .height('5%')

        // Test 2.6: blur with blurRadius and options parameters (null)
        Stack() {
          Image($r('app.media.icon'))
            .width('90%')
            .height('5%')
            .id('blur_blurRadius_options_null')
            .blur(null as number | null | undefined)
        }
        .width('100%')
        .height('5%')

        // Test 2.7: blur with blurRadius and options parameters (undefined)
        Stack() {
          Image($r('app.media.icon'))
            .width('90%')
            .height('5%')
            .id('blur_blurRadius_options_undefined')
            .blur(undefined as number | null | undefined)
        }
        .width('100%')
        .height('5%')

        // Test 2.8: blur with blurRadius and options parameters (both null)
        Stack() {
          Image($r('app.media.icon'))
            .width('90%')
            .height('5%')
            .id('blur_blurRadius_options_both_null')
            .blur(null as number | null | undefined)
        }
        .width('100%')
        .height('5%')

        // Test 2.9: blur with blurRadius and options parameters (both undefined)
        Stack() {
          Image($r('app.media.icon'))
            .width('90%')
            .height('5%')
            .id('blur_blurRadius_options_both_undefined')
            .blur(undefined as number | null | undefined)
        }
        .width('100%')
        .height('5%')

        // ========== blur(blurRadius: Optional<number>, options?: BlurOptions, sysOptions?: SystemAdaptiveOptions): T tests ==========

        // Test 3.1: blur with blurRadius parameter (positive)
        Stack() {
          Image($r('app.media.icon'))
            .width('90%')
            .height('5%')
            .id('blur_three_positive')
            .blur(10 as number | null | undefined)
        }
        .width('100%')
        .height('5%')

        // Test 3.2: blur with blurRadius parameter (zero)
        Stack() {
          Image($r('app.media.icon'))
            .width('90%')
            .height('5%')
            .id('blur_three_zero')
            .blur(0 as number | null | undefined)
        }
        .width('100%')
        .height('5%')

        // Test 3.3: blur with blurRadius parameter (null)
        Stack() {
          Image($r('app.media.icon'))
            .width('90%')
            .height('5%')
            .id('blur_three_null')
            .blur(null as number | null | undefined)
        }
        .width('100%')
        .height('5%')

        // Test 3.4: blur with blurRadius parameter (undefined)
        Stack() {
          Image($r('app.media.icon'))
            .width('90%')
            .height('5%')
            .id('blur_three_undefined')
            .blur(undefined as number | null | undefined)
        }
        .width('100%')
        .height('5%')

        // Test 3.5: blur with blurRadius and options parameters (positive)
        Stack() {
          Image($r('app.media.icon'))
            .width('90%')
            .height('5%')
            .id('blur_three_options_positive')
            .blur(5 as number | null | undefined)
        }
        .width('100%')
        .height('5%')

        // Test 3.6: blur with blurRadius and options parameters (null)
        Stack() {
          Image($r('app.media.icon'))
            .width('90%')
            .height('5%')
            .id('blur_three_options_null')
            .blur(null as number | null | undefined)
        }
        .width('100%')
        .height('5%')

        // Test 3.7: blur with blurRadius and options parameters (undefined)
        Stack() {
          Image($r('app.media.icon'))
            .width('90%')
            .height('5%')
            .id('blur_three_options_undefined')
            .blur(undefined as number | null | undefined)
        }
        .width('100%')
        .height('5%')

        // Test 3.8: blur with blurRadius, options and sysOptions parameters (positive)
        Stack() {
          Image($r('app.media.icon'))
            .width('90%')
            .height('5%')
            .id('blur_three_all_positive')
            .blur(5 as number | null | undefined, undefined as null | undefined, { disableSystemAdaptation: true })
        }
        .width('100%')
        .height('5%')

        // Test 3.9: blur with blurRadius, options and sysOptions parameters (disableSystemAdaptation: false)
        Stack() {
          Image($r('app.media.icon'))
            .width('90%')
            .height('5%')
            .id('blur_three_disable_false')
            .blur(5 as number | null | undefined, undefined as null | undefined, { disableSystemAdaptation: false })
        }
        .width('100%')
        .height('5%')

        // Test 3.10: blur with blurRadius, options and sysOptions parameters (all null)
        Stack() {
          Image($r('app.media.icon'))
            .width('90%')
            .height('5%')
            .id('blur_three_all_null')
            .blur(null as number | null | undefined, null as null | undefined, null as null | undefined)
        }
        .width('100%')
        .height('5%')

        // Test 3.11: blur with blurRadius, options and sysOptions parameters (all undefined)
        Stack() {
          Image($r('app.media.icon'))
            .width('90%')
            .height('5%')
            .id('blur_three_all_undefined')
            .blur(undefined as number | null | undefined, undefined as  null | undefined, undefined as null | undefined)
        }
        .width('100%')
        .height('5%')

        // Test 3.12: blur with blurRadius and sysOptions parameters (disableSystemAdaptation: true)
        Stack() {
          Image($r('app.media.icon'))
            .width('90%')
            .height('5%')
            .id('blur_three_sysOptions_true')
            .blur(5 as number | null | undefined, undefined as  null | undefined, { disableSystemAdaptation: true })
        }
        .width('100%')
        .height('5%')

        // Test 3.13: blur with blurRadius and sysOptions parameters (disableSystemAdaptation: false)
        Stack() {
          Image($r('app.media.icon'))
            .width('90%')
            .height('5%')
            .id('blur_three_sysOptions_false')
            .blur(5 as number | null | undefined, undefined as  null | undefined, { disableSystemAdaptation: false })
        }
        .width('100%')
        .height('5%')

      }
    }
    .width('100%')
    .height('100%')
  }
}
