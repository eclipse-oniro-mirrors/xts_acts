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
struct SearchControllerMethodsTest {
  controller2: SearchController = new SearchController();
  controller3: SearchController = new SearchController();
  controller5: SearchController = new SearchController();
  controller6: SearchController = new SearchController();

  build() {
    Column() {
      Scroll() {
        Column() {
          // ========== caretPosition tests ==========
          Text('caretPosition Method Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Column() {
            Search({ placeholder: 'Test caretPosition value null', controller: this.controller2 })
              .width('100%')
              .height(50)
              .id('Search_caretPosition_value_null')
            Search({ placeholder: 'Test caretPosition value undefined', controller: this.controller3 })
              .width('100%')
              .height(50)
              .id('Search_caretPosition_value_undefined')

            Button('Test caretPosition')
              .onClick(() => {
                this.controller2.caretPosition(null);
                this.controller3.caretPosition(undefined);
              })
              .id('Search_caretPosition_button')
          }
          .width('100%')
          .margin({ bottom: 20 })

          // ========== setTextSelection tests ==========
          Text('setTextSelection Method Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Column() {
            Search({ placeholder: 'Test setTextSelection  null', controller: this.controller5 })
              .width('100%')
              .height(50)
              .id('Search_setTextSelection_null')

            Search({ placeholder: 'Test setTextSelection undefined', controller: this.controller6 })
              .width('100%')
              .height(50)
              .id('Search_setTextSelection_undefined')

            Button('Test setTextSelection')
              .onClick(() => {
                this.controller5.setTextSelection(null, null,null);
                this.controller6.setTextSelection(undefined,undefined,undefined);
              })
              .id('Search_setTextSelection_button')
          }
          .width('100%')
        }
      }
    }
    .width('100%')
    .height('100%')
  }
}
