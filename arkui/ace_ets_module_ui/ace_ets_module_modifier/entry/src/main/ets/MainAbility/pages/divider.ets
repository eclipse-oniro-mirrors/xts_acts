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
import { DividerModifier } from "@ohos.arkui.modifier";

class CustomModifier extends DividerModifier {
  applyDividerAttribute(instance: DividerAttribute): void {
    super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.color("#FF654321")
  }
}

@Entry
@Component
struct BlankExample {
  @State customModifier: DividerModifier = new CustomModifier()
    .lineCap(LineCapStyle.Round)
    .strokeWidth(10)
    .color("#FF123456")
    .vertical(false)

  build() {
    Column({ space: 5 }) {
      Button("change value").onClick(() => {
        (this.customModifier as CustomModifier).onChange1();
      }).key("changeButton")

      Column() {
        Text('Horizontal divider111').fontSize(9).backgroundColor(Color.Gray)
        Divider()
          .attributeModifier(this.customModifier as CustomModifier)
          .key('divider')
        Text('Horizontal divider222').fontSize(9).backgroundColor(Color.Gray)
      }.backgroundColor(Color.Gray).padding(20)
    }
    .margin({ top: 5 })
  }
}