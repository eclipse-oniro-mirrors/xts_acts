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
struct NavigatorAttributeNullUndefinedTest {
  build() {

    Column() {
      Scroll(){
        Column(){
          // ========== params tests ==========
          Text('params Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Navigator({ target: 'MainAbility/pages/navigator/NavigatorAttributeNullUndefined' }) {
              Text('params default')
                .fontSize(14)
            }
            .width('30%')
            .height('10%')
            .id('Navigator_params_default')

            // Null
            Navigator({ target: 'MainAbility/pages/navigator/NavigatorAttributeNullUndefined' }) {
              Text('params null')
                .fontSize(14)
            }
            .width('30%')
            .height('10%')
            .id('Navigator_params_null')
            .params(null)

            // Undefined
            Navigator({ target: 'MainAbility/pages/navigator/NavigatorAttributeNullUndefined' }) {
              Text('params undefined')
                .fontSize(14)
            }
            .width('30%')
            .height('10%')
            .id('Navigator_params_undefined')
            .params(undefined)
          }
          .width('100%')
        }
      }

    }
    .width('100%')
    .height('100%')
  }
}
