/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { LineModifier } from "@ohos.arkui.modifier";

class CustomModifier extends LineModifier {

  applyNormalAttribute(instance: LineAttribute): void {
    super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.startPoint([1, 2])
  }
}

@Entry
@Component
struct LineNe {
  @State customModifier: LineModifier = new CustomModifier()
    .startPoint([0, 1])
    .endPoint([200, 220])

  build() {
    Column() {
      Button("change value").onClick(() => {
        (this.customModifier as CustomModifier).onChange1();
      }).key("changeButton")

      Line()
        .fillOpacity(0)
        .stroke(Color.Red)
        .strokeWidth(3)
        .key("LineKey1")
        .attributeModifier(this.customModifier as CustomModifier)
    }
    .width('100%')
    .height('100%')
  }
}

