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

class CheckboxModifier1 implements AttributeModifier<CheckboxAttribute>{
  applyNormalAttribute(instance: CheckboxAttribute): void {

    instance.select(false)

      .selectedColor(0xed6f21)

      .unselectedColor(0x00ff00)

      .mark({
        strokeColor: Color.Black,
        size: 50,
        strokeWidth: 5
      })
  }
}

@Entry
@Component
struct checkBoxTest {
  @State checkboxModifier1: CheckboxModifier1 = new CheckboxModifier1()

  build() {
    Row() {
      Column() {
        Checkbox({ name: 'checkbox1', group: 'checkboxGroup1' })
          .key("Checkbox_0100")
          .attributeModifier(this.checkboxModifier1)
          .onChange((value: boolean) => {
            console.info('Checkbox1 change is' + value)
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
