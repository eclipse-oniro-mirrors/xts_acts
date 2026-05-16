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
struct AccessibilityGroupNullUndefinedTest {
  build() {
    Row() {
      Column() {
        // ========== accessibilityGroup single parameter tests ==========
        // Test accessibilityGroup with false parameter
        Text('Text accessibilityGroup false')
          .width('100%')
          .height('5%')
          .id('text_accessibilityGroup_false')
          .maxLines(1)
          .accessibilityGroup(false)

        // Test accessibilityGroup with null parameter (single param)
        Text('Text accessibilityGroup null')
          .width('100%')
          .height('5%')
          .id('text_accessibilityGroup_null')
          .maxLines(1)
          .accessibilityGroup(null)

        // Test accessibilityGroup with undefined parameter (single param)
        Text('Text accessibilityGroup undefined')
          .width('100%')
          .height('5%')
          .id('text_accessibilityGroup_undefined')
          .maxLines(1)
          .accessibilityGroup(undefined)

        // ========== accessibilityGroup two parameters tests ==========
        // Test accessibilityGroup with true + valid accessibilityOptions
        Text('Text accessibilityGroup true with options')
          .width('100%')
          .height('5%')
          .id('text_accessibilityGroup_true_options')
          .maxLines(1)
          .accessibilityGroup(true, { accessibilityPreferred: true })

        // Test accessibilityGroup with false + valid accessibilityOptions
        Text('Text accessibilityGroup false with options')
          .width('100%')
          .height('5%')
          .id('text_accessibilityGroup_false_options')
          .maxLines(1)
          .accessibilityGroup(false, { accessibilityPreferred: false })

        // Test accessibilityGroup with true + null accessibilityOptions
        Text('Text accessibilityGroup true null options')
          .width('100%')
          .height('5%')
          .id('text_accessibilityGroup_true_nullOptions')
          .maxLines(1)
          .accessibilityGroup(true, null)

        // Test accessibilityGroup with true + undefined accessibilityOptions
        Text('Text accessibilityGroup true undefined options')
          .width('100%')
          .height('5%')
          .id('text_accessibilityGroup_true_undefinedOptions')
          .maxLines(1)
          .accessibilityGroup(true, undefined)

        // Test accessibilityGroup with false + null accessibilityOptions
        Text('Text accessibilityGroup false null options')
          .width('100%')
          .height('5%')
          .id('text_accessibilityGroup_false_nullOptions')
          .maxLines(1)
          .accessibilityGroup(false, null)

        // Test accessibilityGroup with false + undefined accessibilityOptions
        Text('Text accessibilityGroup false undefined options')
          .width('100%')
          .height('5%')
          .id('text_accessibilityGroup_false_undefinedOptions')
          .maxLines(1)
          .accessibilityGroup(false, undefined)

        // Test accessibilityGroup with null + null accessibilityOptions
        Text('Text accessibilityGroup null null options')
          .width('100%')
          .height('5%')
          .id('text_accessibilityGroup_null_nullOptions')
          .maxLines(1)
          .accessibilityGroup(null, null)

        // Test accessibilityGroup with undefined + undefined accessibilityOptions
        Text('Text accessibilityGroup undefined undefined options')
          .width('100%')
          .height('5%')
          .id('text_accessibilityGroup_undefined_undefinedOptions')
          .maxLines(1)
          .accessibilityGroup(undefined, undefined)

        // Test accessibilityGroup with stateControllerRoleType (AccessibilityRoleType enum - number type)
        Text('Text accessibilityGroup stateControllerRoleType')
          .width('100%')
          .height('5%')
          .id('text_accessibilityGroup_stateControllerRoleType')
          .maxLines(1)
          .accessibilityGroup(true, { stateControllerRoleType: 5 }) // 5 = BUTTON

        // Test accessibilityGroup with actionControllerRoleType (AccessibilityRoleType enum - number type)
        Text('Text accessibilityGroup actionControllerRoleType')
          .width('100%')
          .height('5%')
          .id('text_accessibilityGroup_actionControllerRoleType')
          .maxLines(1)
          .accessibilityGroup(true, { actionControllerRoleType: 13 }) // 13 = CHECKBOX

        // Test accessibilityGroup with stateControllerId (string type)
        Text('Text accessibilityGroup stateControllerId')
          .width('100%')
          .height('5%')
          .id('text_accessibilityGroup_stateControllerId')
          .maxLines(1)
          .accessibilityGroup(true, { stateControllerId: 'testControllerId' })

        // Test accessibilityGroup with actionControllerId (string type)
        Text('Text accessibilityGroup actionControllerId')
          .width('100%')
          .height('5%')
          .id('text_accessibilityGroup_actionControllerId')
          .maxLines(1)
          .accessibilityGroup(true, { actionControllerId: 'testActionId' })

        // Test accessibilityGroup with stateControllerId empty string
        Text('Text accessibilityGroup stateControllerId empty')
          .width('100%')
          .height('5%')
          .id('text_accessibilityGroup_stateControllerId_empty')
          .maxLines(1)
          .accessibilityGroup(true, { stateControllerId: '' })

        // Test accessibilityGroup with actionControllerId empty string
        Text('Text accessibilityGroup actionControllerId empty')
          .width('100%')
          .height('5%')
          .id('text_accessibilityGroup_actionControllerId_empty')
          .maxLines(1)
          .accessibilityGroup(true, { actionControllerId: '' })

        // Test accessibilityGroup with stateControllerId null
        Text('Text accessibilityGroup stateControllerId null')
          .width('100%')
          .height('5%')
          .id('text_accessibilityGroup_stateControllerId_null')
          .maxLines(1)
          .accessibilityGroup(true, { stateControllerId: null })

        // Test accessibilityGroup with actionControllerId null
        Text('Text accessibilityGroup actionControllerId null')
          .width('100%')
          .height('5%')
          .id('text_accessibilityGroup_actionControllerId_null')
          .maxLines(1)
          .accessibilityGroup(true, { actionControllerId: null })

        // Test accessibilityGroup with stateControllerId undefined
        Text('Text accessibilityGroup stateControllerId undefined')
          .width('100%')
          .height('5%')
          .id('text_accessibilityGroup_stateControllerId_undefined')
          .maxLines(1)
          .accessibilityGroup(true, { stateControllerId: undefined })

        // Test accessibilityGroup with actionControllerId undefined
        Text('Text accessibilityGroup actionControllerId undefined')
          .width('100%')
          .height('5%')
          .id('text_accessibilityGroup_actionControllerId_undefined')
          .maxLines(1)
          .accessibilityGroup(true, { actionControllerId: undefined })
      }
      .width('100%')
    }
    .height('100%')
  }
}
