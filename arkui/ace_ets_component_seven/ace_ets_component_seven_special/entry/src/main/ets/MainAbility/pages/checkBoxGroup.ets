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

class TestCheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
  mMark: MarkStyle = { strokeColor: '#FF00FF', size: 10, strokeWidth: 15 }
  mUnselectedColor: ResourceColor = '#FF123456'
  mSelectAll: boolean = true
  mSelectedColor: ResourceColor = '#FF321456'

  applyNormalAttribute(instance: CheckboxGroupAttribute): void {
    instance
      .mark(this.mMark)
      .unselectedColor(this.mUnselectedColor)
      .selectAll(this.mSelectAll)
      .selectedColor(this.mSelectedColor)
  }
}

@Entry
@Component
struct TestCheckboxGroupPage {
  @State modifier: TestCheckboxGroupModifier = new TestCheckboxGroupModifier()

  build() {
    Column() {
      CheckboxGroup({ group: 'checkboxGroup' })
        .key('checkboxNO')
        .attributeModifier(this.modifier)
    }
    .width('100%')
      .height('100%')
  }
}
