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
import { RowModifier } from "@ohos.arkui.modifier";

class CustomModifier extends RowModifier {
  applyNormalAttribute(instance: RowAttribute): void {
    super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.alignItems(VerticalAlign.Top)
  }
}

@Entry
@Component
struct RowExample {
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7]
  @State customModifier: RowModifier = new CustomModifier()
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.Start)

  build() {
    Column({ space: 5 }) {
      Button("change value").onClick(() => {
        (this.customModifier as CustomModifier).onChange1();
      }).key("changeButton")

      Row() {
      }
      .attributeModifier(this.customModifier as CustomModifier)
      .key('row')
    }
    .margin({ top: 5 })
  }
}