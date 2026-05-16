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
import { CheckboxGroupModifier } from "@ohos.arkui.modifier";

class CustomModifier extends CheckboxGroupModifier {
  applyNormalAttribute(instance: CheckboxGroupAttribute): void {
    super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.unselectedColor("#FF121212")
  }
}

@Entry
@Component
struct TestCheckboxGroupPage {
  private mMark: MarkStyle = { strokeColor: '#FF00FF', size: 10, strokeWidth: 15 }
  private mUnselectedColor: ResourceColor = '#FF123456'
  private mSelectAll: boolean = false
  private mSelectedColor: ResourceColor = '#FF321456'

  @State customModifier: CheckboxGroupModifier = new CustomModifier()
    .mark(this.mMark)
    .unselectedColor(this.mUnselectedColor)
    .selectAll(this.mSelectAll)
    .selectedColor(this.mSelectedColor)

  build() {
    Column() {
      Button("change value").onClick(() => {
        (this.customModifier as CustomModifier).onChange1();
      }).key("changeButton")

      CheckboxGroup({ group: 'checkboxGroup' })
        .key('checkboxNO')
        .attributeModifier(this.customModifier as CustomModifier)
    }
    .width('100%')
      .height('100%')
  }
}
