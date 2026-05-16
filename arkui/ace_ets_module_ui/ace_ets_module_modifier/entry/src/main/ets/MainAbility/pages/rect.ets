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
import { RectModifier } from "@ohos.arkui.modifier";

class CustomModifier extends RectModifier {
  applyNormalAttribute(instance: RectAttribute): void {
    super.applyNormalAttribute?.(instance);
  }
  onChange() {
    this.radiusHeight(9)
  }
}

class CustomModifier1 extends RectModifier {
  applyNormalAttribute(instance: RectAttribute): void {
    super.applyNormalAttribute?.(instance);
  }
  onChange() {
  }
}

class CustomModifier2 extends RectModifier {
  applyNormalAttribute(instance: RectAttribute): void {
    super.applyNormalAttribute?.(instance);
  }
  onChange() {
  }
}

@Entry
@Component
struct RectTest {
  @State customModifier1: RectModifier = new CustomModifier().radiusHeight(8);
  @State customModifier2: RectModifier = new CustomModifier1().radius(6);
  @State customModifier3: RectModifier = new CustomModifier2().radiusWidth(12);
  @State value: number = 0

  build() {
      Column() {
        Button("change value").onClick(() => {
          (this.customModifier1 as CustomModifier).onChange();
        }).key("changeButton")

          Rect({ width: '80%', height: '20%' })
          .key("Rect1")
            .attributeModifier(this.customModifier1 as CustomModifier)

          Rect({ width: '60%', height: '30%' })
          .key("Rect2")
            .attributeModifier(this.customModifier2 as CustomModifier)

          Rect({ width: '40%', height: '40%' })
          .key("Rect3")
            .attributeModifier(this.customModifier3 as CustomModifier)

          Rect({ width: '80%', height: '20%' })
          .key("Rect11")
          .radiusHeight(8);

          Rect({ width: '60%', height: '30%' })
          .key("Rect22")
          .radius(6);

          Rect({ width: '40%', height: '40%' })
          .key("Rect33")
          .radiusWidth(12);

        Rect({ width: '40%', height: '40%' })
          .key("Rect44")
          .radiusHeight(9);
      }
  }
}
