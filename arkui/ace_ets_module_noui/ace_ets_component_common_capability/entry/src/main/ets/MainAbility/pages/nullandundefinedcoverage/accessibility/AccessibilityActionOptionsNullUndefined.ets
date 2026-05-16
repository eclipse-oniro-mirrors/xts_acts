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
struct AccessibilityActionOptionsNullUndefinedTest {
  // Builder for accessibilityVirtualNode test
  @Builder
  customBuilder() {
    Text('Custom Builder Content')
  }

  build() {
    Row() {
      Column() {
        // ========== accessibilityActionOptions tests ==========
        // Test accessibilityActionOptions default value
        Text('Text accessibilityActionOptions default')
          .width('100%')
          .height('5%')
          .id('text_accessibilityActionOptions_default')
          .maxLines(1)

        // Test accessibilityActionOptions with null parameter
        Text('Text accessibilityActionOptions null')
          .width('100%')
          .height('5%')
          .id('text_accessibilityActionOptions_null')
          .maxLines(1)
          .accessibilityActionOptions(null)

        // Test accessibilityActionOptions with undefined parameter
        Text('Text accessibilityActionOptions undefined')
          .width('100%')
          .height('5%')
          .id('text_accessibilityActionOptions_undefined')
          .maxLines(1)
          .accessibilityActionOptions(undefined)

        // ========== accessibilityVirtualNode tests ==========
        // Test accessibilityVirtualNode default value
        Text('Text accessibilityVirtualNode default')
          .width('100%')
          .height('5%')
          .id('text_accessibilityVirtualNode_default')
          .maxLines(1)

        // Test accessibilityVirtualNode with null parameter
        Text('Text accessibilityVirtualNode null')
          .width('100%')
          .height('5%')
          .id('text_accessibilityVirtualNode_null')
          .maxLines(1)
          .accessibilityVirtualNode(null)

        // Test accessibilityVirtualNode with undefined parameter
        Text('Text accessibilityVirtualNode undefined')
          .width('100%')
          .height('5%')
          .id('text_accessibilityVirtualNode_undefined')
          .maxLines(1)
          .accessibilityVirtualNode(undefined)

        // Test accessibilityVirtualNode with valid CustomBuilder
        Text('Text accessibilityVirtualNode valid')
          .width('100%')
          .height('5%')
          .id('text_accessibilityVirtualNode_valid')
          .maxLines(1)
          .accessibilityVirtualNode(this.customBuilder)
      }
      .width('100%')
    }
    .height('100%')
  }
}
