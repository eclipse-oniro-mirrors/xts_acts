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

/**
 * Image PrivacySensitive Test Page
 * 测试Image组件的privacySensitive属性
 */
@Entry
@Component
struct ImagePrivacySensitiveUndefinedAndNull {
  build() {
    Row() {
      Column() {
        Text('Image PrivacySensitive Test')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20, bottom: 20 })

        // Test : privacySensitive(false)
        Text('Test : privacySensitive(false)')
          .fontSize(16)
          .margin({ top: 10 })
        Image($r('app.media.icon'))
          .id('image_privacySensitive_false')
          .privacySensitive(false)
          .width('60%')
          .height('5%')
          .margin({ top: 5, bottom: 5 })

        // Test 1: null parameter
        Text('Test 3: null parameter (should restore to default)')
          .fontSize(16)
          .margin({ top: 10 })
        Image($r('app.media.icon'))
          .id('image_privacySensitive_null')
          .privacySensitive(null)
          .width('60%')
          .height('5%')
          .margin({ top: 5, bottom: 5 })

        // Test 2: undefined parameter
        Text('Test 4: undefined parameter (should restore to default)')
          .fontSize(16)
          .margin({ top: 10 })
        Image($r('app.media.icon'))
          .id('image_privacySensitive_undefined')
          .privacySensitive(undefined)
          .width('60%')
          .height('5%')
          .margin({ top: 5, bottom: 5 })
      }
      .width('100%')
    }
    .height('100%')
  }
}
