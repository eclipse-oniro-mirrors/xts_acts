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
struct ImageSpanPropertiesNullUndefinedTest {
  build() {
    Column() {
      Scroll() {
        Column() {
          // ========== colorFilter tests ==========
          Text('colorFilter Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Text() {
              ImageSpan($r('sys.symbol.ohos_trash'))
                .id('ImageSpan_colorFilter_default')
            }
              .width('30%')
              .height('5%')


            // Null
            Text() {
              ImageSpan($r('sys.symbol.ohos_trash'))
                .colorFilter(null)
                .id('ImageSpan_colorFilter_null')
            }
              .width('30%')
              .height('5%')


            // Undefined
            Text() {
              ImageSpan($r('sys.symbol.ohos_trash'))
                .colorFilter(undefined)
                .id('ImageSpan_colorFilter_undefined')
            }
              .width('30%')
              .height('5%')

          }
          .width('100%')

          // ========== alt tests ==========
          Text('alt Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Text() {
              ImageSpan($r('sys.symbol.ohos_trash'))
                .id('ImageSpan_alt_default')
            }
              .width('30%')
              .height('5%')


            // Null
            Text() {
              ImageSpan($r('sys.symbol.ohos_trash'))
                .alt(null)
                .id('ImageSpan_alt_null')
            }
              .width('30%')
              .height('5%')


            // Undefined
            Text() {
              ImageSpan($r('sys.symbol.ohos_trash'))
                .alt(undefined)
                .id('ImageSpan_alt_undefined')
            }
              .width('30%')
              .height('5%')

          }
          .width('100%')
        }
      }
    }
    .width('100%')
    .height('100%')
  }
}
