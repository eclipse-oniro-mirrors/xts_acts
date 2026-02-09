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
import { ToggleModifier } from "@ohos.arkui.modifier";

class CustomModifier extends ToggleModifier {

  applyNormalAttribute(instance: ToggleAttribute): void {
    super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.selectedColor("#FF0000FF")
  }
}

@Entry
@Component
struct ToggleTest {
  @State customModifier: ToggleModifier = new CustomModifier()
    .selectedColor("#FF0000FF")
    .switchPointColor('#FF008000')

  build() {
    Column() {
      Button("change value").onClick(() => {
        (this.customModifier as CustomModifier).onChange1();
      }).key("changeButton")

      Column({ space: 5 }) {
        Toggle({ type: ToggleType.Switch, isOn: false })
          .key("toggleCheckbox")
          .attributeModifier(this.customModifier as CustomModifier)
      }
      .width('100%')
      .height('100%')
    }
    .width('100%')
  }
}