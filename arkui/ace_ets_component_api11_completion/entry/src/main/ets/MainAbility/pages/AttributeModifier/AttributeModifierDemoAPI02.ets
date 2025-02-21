/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
class MyButtonModifier2 implements AttributeModifier<ButtonAttribute> {
  isDark: boolean = false

  applyFocusedAttribute(instance: ButtonAttribute): void {
    instance.backgroundColor("#FF209B08")
  }
}

@Entry
@Component
struct AttributeModifierDemoAPI02 {
  @State modifier: MyButtonModifier2 = new MyButtonModifier2()
  @State enabledFlag: boolean = true

  build() {
    Row() {
      Column() {
        Button("检测此button")
          .key('AttributeModifierDemoAPI02ButtonFocus')
          .width('90%')
          .height(80)
          .attributeModifier(this.modifier)
          .enabled(this.enabledFlag)
      }
      .width('100%')
    }
    .height('100%')
  }
}