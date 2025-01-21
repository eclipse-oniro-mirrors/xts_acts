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
class MyButtonModifier1 implements AttributeModifier<ButtonAttribute> {
  isDark: boolean = false

  // 禁用
  applyDisabledAttribute(instance: ButtonAttribute): void {
    if (this.isDark) {
      instance.backgroundColor("#FF209B08")
      instance.width('300px')
    } else {
      instance.backgroundColor("#ffa42d09")
      instance.width('800px')
    }

  }
}

@Entry
@Component
struct AttributeModifierDemoAPI01 {
  @State modifier: MyButtonModifier1 = new MyButtonModifier1()
  @State enabledFlag: boolean = true

  build() {
    Row() {
      Column() {
        Button("检测此button")
          .key('AttributeModifierDemoAPI01Button')
          .width('90%')
          .height(80)
          .focusable(true)
          .attributeModifier(this.modifier)
          .enabled(this.enabledFlag)

        Button('enabled：false')
          .margin(20)
          .key('AttributeModifierDemoAPI01EnabledButton')
          .onClick(() => {
            this.enabledFlag = false
          })

        Button('isDark true')
          .margin(20)
          .key('AttributeModifierDemoAPI01isDark')
          .onClick(() => {
            this.modifier.isDark = true
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}