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
import { BlankModifier } from "@ohos.arkui.modifier";

class CustomModifier extends BlankModifier {
  applyBlankAttribute(instance: BlankAttribute): void {
    super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.color("#FF654321")
  }
}

@Entry
@Component
struct BlankExample {
  @State customModifier: BlankModifier = new CustomModifier()
    .color("#FF123456")

  build() {
    Column({ space: 5 }) {
      Button("change value").onClick(() => {
        (this.customModifier as CustomModifier).onChange1();
      }).key("changeButton")

      Column() {
        Blank("160")
          .attributeModifier(this.customModifier as CustomModifier)
          .key('blank')
        Toggle({ type: ToggleType.Switch }).margin({ top: 14, bottom: 14, left: 6, right: 6 })
      }.backgroundColor(Color.Gray).padding(20)
    }
    .margin({ top: 5 })
  }
}