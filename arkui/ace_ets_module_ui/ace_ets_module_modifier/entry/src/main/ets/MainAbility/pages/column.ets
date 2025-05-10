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
import { ColumnModifier } from "@ohos.arkui.modifier";

class CustomModifier extends ColumnModifier {
  applyNormalAttribute(instance: ColumnAttribute): void {
    super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.justifyContent(FlexAlign.Start)
  }
}

@Entry
@Component
struct ColumnExample {
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7]
  @State customModifier: ColumnModifier = new CustomModifier()
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)

  build() {
    Column({ space: 5 }) {
      Button("change value").onClick(() => {
        (this.customModifier as CustomModifier).onChange1();
      }).key("changeButton")

      Column() {
        Column().width('50%').height(30).backgroundColor(0xAFEEEE)
        Column().width('50%').height(30).backgroundColor(0x00FFFF)
      }
      .attributeModifier(this.customModifier as CustomModifier)
      .key('column')
    }
    .margin({ top: 5 })
  }
}