/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { MenuModifier } from "@ohos.arkui.modifier";

class CustomModifier extends MenuModifier {
  applyNormalAttribute(instance: MenuAttribute): void {
    super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.radius(20)
  }
}

@Entry
@Component
struct TestMenuPage {
  mRadius: Dimension | BorderRadiuses = '12vp'
  mFontColor: ResourceColor = '#FF123654'
  mFont: Font = { size: 20, weight: FontWeight.Normal, family: 'medium', style: FontStyle.Normal }
  @State customModifier: MenuModifier = new CustomModifier()
    .radius(this.mRadius)
    .fontColor(this.mFontColor)
    .font(this.mFont)

  build() {
    Column() {
      Menu() {
        MenuItem({ content: "复制", labelInfo: "Ctrl+C" })
        MenuItem({ content: "粘贴", labelInfo: "Ctrl+V" })
      }
      .key('MenuKey1')
      .attributeModifier(this.customModifier as CustomModifier)
      Button("change value").onClick(() => {
        (this.customModifier as CustomModifier).onChange1();
      }).key("changeButton")
    }
    .width('100%')
    .height('100%')
  }
}
