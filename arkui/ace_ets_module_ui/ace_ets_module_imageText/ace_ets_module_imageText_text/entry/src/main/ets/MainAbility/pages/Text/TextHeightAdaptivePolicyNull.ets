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
struct TextHeightAdaptivePolicyNull {
  build() {
    Column({ space: 2 }) {
      Row() {
        Text('Text heightAdaptivePolicy Test')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20, bottom: 20 })
      }

      // Test 1: heightAdaptivePolicy with null parameter
      Text('heightAdaptivePolicy with null')
        .id('text_heightAdaptivePolicy_null')
        .heightAdaptivePolicy(null)
        .height('5%')

      // Test 2: heightAdaptivePolicy with undefined parameter
      Text('heightAdaptivePolicy with undefined')
        .id('text_heightAdaptivePolicy_undefined')
        .heightAdaptivePolicy(undefined)
        .height('5%')

      // Test 3: Default heightAdaptivePolicy for comparison
      Text('Default heightAdaptivePolicy (for comparison)')
        .id('text_heightAdaptivePolicy_default')
        .height('5%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
