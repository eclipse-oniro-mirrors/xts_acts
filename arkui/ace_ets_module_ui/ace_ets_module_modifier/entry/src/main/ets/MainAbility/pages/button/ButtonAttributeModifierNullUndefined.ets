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
struct ButtonAttributeModifierNullUndefinedTest {

  build() {
    Row() {
      Column() {
        // Test attributeModifier default value (未设置 attributeModifier)
        Button('Button attributeModifier default')
          .width('100%')
          .height('5%')
          .id('button_attributeModifier_default')

        // Test attributeModifier with null parameter
        Button('Button attributeModifier null')
          .width('100%')
          .height('5%')
          .id('button_attributeModifier_null')
          .attributeModifier(null)

        // Test attributeModifier with undefined parameter
        Button('Button attributeModifier undefined')
          .width('100%')
          .height('5%')
          .id('button_attributeModifier_undefined')
          .attributeModifier(undefined)
      }
      .width('100%')
    }
    .height('100%')
  }
}
