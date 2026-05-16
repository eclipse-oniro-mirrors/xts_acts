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
struct SearchPropertiesNullUndefined03Test {


  build() {
    Column() {
      Scroll() {
        Column() {
          // ========== searchButton tests ==========
          Text('searchButton Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Column() {
            Search({ placeholder: 'Test searchButton value null' })
              .width('100%')
              .height(50)
              .searchButton(null,null)
              .id('Search_searchButton_null')
            Search({ placeholder: 'Test searchButton value undefined' })
              .width('100%')
              .height(50)
              .searchButton(undefined,undefined)
              .id('Search_searchButton_undefined')
          }
          .width('100%')
          .margin({ bottom: 20 })

          // ========== customKeyboard tests ==========
          Text('customKeyboard Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Column() {

            Search({ placeholder: 'Test customKeyboard value null' })
              .width('100%')
              .height(50)
              .customKeyboard(null,null)
              .id('Search_customKeyboard_null')

            Search({ placeholder: 'Test customKeyboard value undefined' })
              .width('100%')
              .height(50)
              .customKeyboard(undefined,undefined)
              .id('Search_customKeyboard_undefined')
          }
          .width('100%')
          .margin({ bottom: 20 })

          // ========== fontFeature tests ==========
          Text('fontFeatureFeature Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Column() {
            Search({ placeholder: 'Test fontFeature default' })
              .width('100%')
              .height(50)
              .id('Search_fontFeature_default')

            Search({ placeholder: 'Test fontFeature null' })
              .width('100%')
              .height(50)
              .fontFeature(null)
              .id('Search_fontFeature_null')

            Search({ placeholder: 'Test fontFeature undefined' })
              .width('100%')
              .height(50)
              .fontFeature(undefined)
              .id('Search_fontFeature_undefined')

            Search({ placeholder: 'Test fontFeature empty' })
              .width('100%')
              .height(50)
              .fontFeature('')
              .id('Search_fontFeature_emptyString')
          }
          .width('100%')
          .margin({ bottom: 20 })

          // ========== enablePreviewText tests ==========
          Text('enablePreviewText Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Column() {
            Search({ placeholder: 'Test enablePreviewText default' })
              .width('100%')
              .height(50)
              .id('Search_enablePreviewText_default')

            Search({ placeholder: 'Test enablePreviewText null' })
              .width('100%')
              .height(50)
              .enablePreviewText(null)
              .id('Search_enablePreviewText_null')

            Search({ placeholder: 'Test enablePreviewText undefined' })
              .width('100%')
              .height(50)
              .enablePreviewText(undefined)
              .id('Search_enablePreviewText_undefined')

            Search({ placeholder: 'Test enablePreviewText true' })
              .width('100%')
              .height(50)
              .enablePreviewText(true)
              .id('Search_enablePreviewText_true')
          }
          .width('100%')
        }
      }
    }
    .width('100%')
    .height('100%')
  }
}
