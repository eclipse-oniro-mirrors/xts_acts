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

class MyButtonModifier1 implements AttributeModifier<ButtonAttribute> {

  applyNormalAttribute(instance: ButtonAttribute|null|undefined): void {
    AppStorage.setOrCreate('ModifierNormalAttributeNullUndefined', instance);
  }

  applyPressedAttribute(instance: ButtonAttribute|null|undefined): void {
    AppStorage.setOrCreate('ModifierPressedAttributeNullUndefined', instance);
  }

  applyFocusedAttribute(instance: ButtonAttribute|null|undefined): void {
    AppStorage.setOrCreate('ModifierFocusedAttributeNullUndefined', instance);
  }

  applyDisabledAttribute(instance: ButtonAttribute|null|undefined): void {
    AppStorage.setOrCreate('ModifierDisabledAttributeNullUndefined', instance);
  }

  applySelectedAttribute(instance: ButtonAttribute|null|undefined): void {
    AppStorage.setOrCreate('ModifierSelectedAttributeNullUndefined', instance);
  }
}

@Entry
@Component
struct AttributeModifierNullIndex {
  @State modifier: MyButtonModifier1 = new MyButtonModifier1()

  build() {
    Row() {
      Column() {
        // ========== attributeModifier tests ==========
        Button('Button attributeModifier default')
          .id('attributeModifier_default')
          .width('100%')
          .height('5%')
          .attributeModifier(this.modifier)

        // Test attributeModifier with null parameter
        Button('Button attributeModifier null')
          .id('attributeModifier_null')
          .width('100%')
          .height('5%')
          .onClick(() => {
            this.modifier.applyNormalAttribute(null);
            this.modifier.applyPressedAttribute(null);
            this.modifier.applyFocusedAttribute(null);
            this.modifier.applyDisabledAttribute(null);
            this.modifier.applySelectedAttribute(null);
          })

        // Test attributeModifier with undefined parameter
        Button('Button attributeModifier undefined')
          .id('attributeModifier_undefined')
          .width('100%')
          .height('5%')
          .onClick(() => {
            this.modifier.applyNormalAttribute(undefined);
            this.modifier.applyPressedAttribute(undefined);
            this.modifier.applyFocusedAttribute(undefined);
            this.modifier.applyDisabledAttribute(undefined);
            this.modifier.applySelectedAttribute(undefined);
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
