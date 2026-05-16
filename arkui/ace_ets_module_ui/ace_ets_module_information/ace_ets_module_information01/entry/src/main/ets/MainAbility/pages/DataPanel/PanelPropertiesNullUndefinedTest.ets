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
struct PanelPropertiesNullUndefinedTest {
  @State show: boolean = true

  build() {
    Column() {
      Scroll() {
        Column() {
          // ========== mode tests ==========
          Text('mode Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Panel(this.show) {
              Text('Panel content')
            }
            .width('30%')
            .height('30%')
            .id('Panel_mode_default')

            // Null
            Panel(this.show) {
              Text('Panel content')
            }
            .width('30%')
            .height('30%')
            .id('Panel_mode_null')
            .mode(null)

            // Undefined
            Panel(this.show) {
              Text('Panel content')
            }
            .width('30%')
            .height('30%')
            .id('Panel_mode_undefined')
            .mode(undefined)
          }
          .width('100%')

          // ========== type tests ==========
          Text('type Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Panel(this.show) {
              Text('Panel content')
            }
            .width('30%')
            .height('30%')
            .id('Panel_type_default')

            // Null
            Panel(this.show) {
              Text('Panel content')
            }
            .width('30%')
            .height('30%')
            .id('Panel_type_null')
            .type(null)

            // Undefined
            Panel(this.show) {
              Text('Panel content')
            }
            .width('30%')
            .height('30%')
            .id('Panel_type_undefined')
            .type(undefined)
          }
          .width('100%')

          // ========== dragBar tests ==========
          Text('dragBar Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Panel(this.show) {
              Text('Panel content')
            }
            .width('30%')
            .height('30%')
            .id('Panel_dragBar_default')

            // Null
            Panel(this.show) {
              Text('Panel content')
            }
            .width('30%')
            .height('30%')
            .id('Panel_dragBar_null')
            .dragBar(null)

            // Undefined
            Panel(this.show) {
              Text('Panel content')
            }
            .width('30%')
            .height('30%')
            .id('Panel_dragBar_undefined')
            .dragBar(undefined)
          }
          .width('100%')

          // ========== customHeight tests ==========
          Text('customHeight Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Panel(this.show) {
              Text('Panel content')
            }
            .width('30%')
            .height('30%')
            .id('Panel_customHeight_default')

            // Null
            Panel(this.show) {
              Text('Panel content')
            }
            .width('30%')
            .height('30%')
            .id('Panel_customHeight_null')
            .customHeight(null)

            // Undefined
            Panel(this.show) {
              Text('Panel content')
            }
            .width('30%')
            .height('30%')
            .id('Panel_customHeight_undefined')
            .customHeight(undefined)
          }
          .width('100%')

          // ========== fullHeight tests ==========
          Text('fullHeight Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Panel(this.show) {
              Text('Panel content')
            }
            .width('20%')
            .height('20%')
            .id('Panel_fullHeight_default')

            // Null
            Panel(this.show) {
              Text('Panel content')
            }
            .width('20%')
            .height('20%')
            .id('Panel_fullHeight_null')
            .fullHeight(null)

            // Undefined
            Panel(this.show) {
              Text('Panel content')
            }
            .width('20%')
            .height('20%')
            .id('Panel_fullHeight_undefined')
            .fullHeight(undefined)

            // Empty String
            Panel(this.show) {
              Text('Panel content')
            }
            .width('20%')
            .height('20%')
            .id('Panel_fullHeight_emptyString')
            .fullHeight('')
          }
          .width('100%')

          // ========== halfHeight tests ==========
          Text('halfHeight Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Panel(this.show) {
              Text('Panel content')
            }
            .width('20%')
            .height('20%')
            .id('Panel_halfHeight_default')

            // Null
            Panel(this.show) {
              Text('Panel content')
            }
            .width('20%')
            .height('20%')
            .id('Panel_halfHeight_null')
            .halfHeight(null)

            // Undefined
            Panel(this.show) {
              Text('Panel content')
            }
            .width('20%')
            .height('20%')
            .id('Panel_halfHeight_undefined')
            .halfHeight(undefined)

            // Empty String
            Panel(this.show) {
              Text('Panel content')
            }
            .width('20%')
            .height('20%')
            .id('Panel_halfHeight_emptyString')
            .halfHeight('')
          }
          .width('100%')

          // ========== miniHeight tests ==========
          Text('miniHeight Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Panel(this.show) {
              Text('Panel content')
            }
            .width('20%')
            .height('20%')
            .id('Panel_miniHeight_default')

            // Null
            Panel(this.show) {
              Text('Panel content')
            }
            .width('20%')
            .height('20%')
            .id('Panel_miniHeight_null')
            .miniHeight(null)

            // Undefined
            Panel(this.show) {
              Text('Panel content')
            }
            .width('20%')
            .height('20%')
            .id('Panel_miniHeight_undefined')
            .miniHeight(undefined)

            // Empty String
            Panel(this.show) {
              Text('Panel content')
            }
            .width('20%')
            .height('20%')
            .id('Panel_miniHeight_emptyString')
            .miniHeight('')
          }
          .width('100%')

          // ========== show tests ==========
          Text('show Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Panel(this.show) {
              Text('Panel content')
            }
            .width('20%')
            .height('20%')
            .id('Panel_show_default')

            // Null
            Panel(this.show) {
              Text('Panel content')
            }
            .width('20%')
            .height('20%')
            .id('Panel_show_null')
            .show(null)

            // Undefined
            Panel(this.show) {
              Text('Panel content')
            }
            .width('20%')
            .height('20%')
            .id('Panel_show_undefined')
            .show(undefined)

            // False
            Panel(this.show) {
              Text('Panel content')
            }
            .width('20%')
            .height('20%')
            .id('Panel_show_false')
            .show(false)
          }
          .width('100%')

          // ========== backgroundMask tests ==========
          Text('backgroundMask Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Panel(this.show) {
              Text('Panel content')
            }
            .width('30%')
            .height('30%')
            .id('Panel_backgroundMask_default')

            // Null
            Panel(this.show) {
              Text('Panel content')
            }
            .width('30%')
            .height('30%')
            .id('Panel_backgroundMask_null')
            .backgroundMask(null)

            // Undefined
            Panel(this.show) {
              Text('Panel content')
            }
            .width('30%')
            .height('30%')
            .id('Panel_backgroundMask_undefined')
            .backgroundMask(undefined)

            // Empty String
            Panel(this.show) {
              Text('Panel content')
            }
            .width('30%')
            .height('30%')
            .id('Panel_backgroundMask_emptyString')
            .backgroundMask('')
          }
          .width('100%')
        }
      }
    }
    .width('100%')
    .height('100%')
  }
}
