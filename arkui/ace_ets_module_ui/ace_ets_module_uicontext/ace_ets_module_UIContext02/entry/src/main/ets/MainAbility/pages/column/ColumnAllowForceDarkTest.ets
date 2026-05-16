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
struct ColumnAllowForceDarkTest {
  build() {
    Row() {
      Column() {
        // ========== allowForceDark tests ==========
        // Test allowForceDark default value (未设置 allowForceDark)
        Column() {
          Text('Column allowForceDark default')
            .fontSize(16)
        }
        .id('column_allowForceDark_default')
        .width('100%')
        .height('5%')
        .backgroundColor('#FF0000')

        // Test allowForceDark with null parameter
        Column() {
          Text('Column allowForceDark null')
            .fontSize(16)
        }
        .id('column_allowForceDark_null')
        .width('100%')
        .height('5%')
        .backgroundColor('#FF0000')
        .allowForceDark(null)

        // Test allowForceDark with undefined parameter
        Column() {
          Text('Column allowForceDark undefined')
            .fontSize(16)
        }
        .id('column_allowForceDark_undefined')
        .width('100%')
        .height('5%')
        .backgroundColor('#FF0000')
        .allowForceDark(undefined)

        // Test allowForceDark with true value
        Column() {
          Text('Column allowForceDark true')
            .fontSize(16)
        }
        .id('column_allowForceDark_true')
        .width('100%')
        .height('5%')
        .backgroundColor('#FF0000')
        .allowForceDark(true)

        // Test allowForceDark with false value
        Column() {
          Text('Column allowForceDark false')
            .fontSize(16)
        }
        .id('column_allowForceDark_false')
        .width('100%')
        .height('5%')
        .backgroundColor('#FF0000')
        .allowForceDark(false)
      }
      .width('100%')
    }
    .height('100%')
  }
}
