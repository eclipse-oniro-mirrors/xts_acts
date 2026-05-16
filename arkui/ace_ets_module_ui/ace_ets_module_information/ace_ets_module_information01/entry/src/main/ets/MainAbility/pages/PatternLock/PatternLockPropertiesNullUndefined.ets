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
struct PatternLockPropertiesNullUndefinedTest {
  build() {

    Column() {
      Scroll(){
        Column(){
          // ========== sideLength tests ==========
          Text('sideLength Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_sideLength_default')

            // Null
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_sideLength_null')
              .sideLength(null)

            // Undefined
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_sideLength_undefined')
              .sideLength(undefined)

            // Empty String
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_sideLength_empty')
              .sideLength('')
          }
          .width('100%')

          // ========== circleRadius tests ==========
          Text('circleRadius Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_circleRadius_default')

            // Null
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_circleRadius_null')
              .circleRadius(null)

            // Undefined
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_circleRadius_undefined')
              .circleRadius(undefined)

            // Empty String
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_circleRadius_empty')
              .circleRadius('')
          }
          .width('100%')

          // ========== backgroundColor tests ==========
          Text('backgroundColor Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_backgroundColor_default')

            // Null
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_backgroundColor_null')
              .backgroundColor(null)

            // Undefined
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_backgroundColor_undefined')
              .backgroundColor(undefined)

            // Empty String
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_backgroundColor_empty')
              .backgroundColor('')
          }
          .width('100%')

          // ========== regularColor tests ==========
          Text('regularColor Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_regularColor_default')

            // Null
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_regularColor_null')
              .regularColor(null)

            // Undefined
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_regularColor_undefined')
              .regularColor(undefined)

            // Empty String
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_regularColor_empty')
              .regularColor('')
          }
          .width('100%')

          // ========== selectedColor tests ==========
          Text('selectedColor Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_selectedColor_default')

            // Null
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_selectedColor_null')
              .selectedColor(null)

            // Undefined
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_selectedColor_undefined')
              .selectedColor(undefined)

            // Empty String
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_selectedColor_empty')
              .selectedColor('')
          }
          .width('100%')

          // ========== activeColor tests ==========
          Text('activeColor Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_activeColor_default')

            // Null
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_activeColor_null')
              .activeColor(null)

            // Undefined
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_activeColor_undefined')
              .activeColor(undefined)

            // Empty String
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_activeColor_empty')
              .activeColor('')
          }
          .width('100%')

          // ========== pathColor tests ==========
          Text('pathColor Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_pathColor_default')

            // Null
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_pathColor_null')
              .pathColor(null)

            // Undefined
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_pathColor_undefined')
              .pathColor(undefined)

            // Empty String
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_pathColor_empty')
              .pathColor('')
          }
          .width('100%')

          // ========== pathStrokeWidth tests ==========
          Text('pathStrokeWidth Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_pathStrokeWidth_default')

            // Null
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_pathStrokeWidth_null')
              .pathStrokeWidth(null)

            // Undefined
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_pathStrokeWidth_undefined')
              .pathStrokeWidth(undefined)

            // Empty String
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_pathStrokeWidth_empty')
              .pathStrokeWidth('')
          }
          .width('100%')

          // ========== activateCircleStyle tests ==========
          Text('activateCircleStyle Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_activateCircleStyle_default')

            // Null
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_activateCircleStyle_null')
              .activateCircleStyle(null)

            // Undefined
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_activateCircleStyle_undefined')
              .activateCircleStyle(undefined)
          }
          .width('100%')

          // ========== autoReset tests ==========
          Text('autoReset Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_autoReset_default')

            // Null
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_autoReset_null')
              .autoReset(null)

            // Undefined
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_autoReset_undefined')
              .autoReset(undefined)

            // True
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_autoReset_true')
              .autoReset(true)

            // False
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_autoReset_false')
              .autoReset(false)
          }
          .width('100%')

          // ========== skipUnselectedPoint tests ==========
          Text('skipUnselectedPoint Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_skipUnselectedPoint_default')

            // Null
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_skipUnselectedPoint_null')
              .skipUnselectedPoint(null)

            // Undefined
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_skipUnselectedPoint_undefined')
              .skipUnselectedPoint(undefined)

            // True
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_skipUnselectedPoint_true')
              .skipUnselectedPoint(true)

            // False
            PatternLock()
              .width('30%')
              .height('5%')
              .id('PatternLock_skipUnselectedPoint_false')
              .skipUnselectedPoint(false)
          }
          .width('100%')
        }
      }

    }
    .width('100%')
    .height('100%')
  }
}
