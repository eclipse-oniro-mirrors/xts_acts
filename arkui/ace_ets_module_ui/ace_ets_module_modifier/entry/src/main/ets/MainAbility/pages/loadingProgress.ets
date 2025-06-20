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
import { LoadingProgressModifier } from "@ohos.arkui.modifier";

class CustomModifier extends LoadingProgressModifier {
  applyNormalAttribute(instance: LoadingProgressAttribute): void {
    super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.enableLoading(true)
  }
}

@Entry
@Component
struct LoadingProgressExampleAdd {
  @State customModifier: LoadingProgressModifier = new CustomModifier()
    .color(Color.Blue)
    .enableLoading(true)

  build() {
    Column({ space: 5 }) {
    Button("change value").onClick(() => {
      (this.customModifier as CustomModifier).onChange1();
    }).key("changeButton")
    Column({ space: 5 }) {
      Text('Orbital LoadingProgress ').fontSize(9).fontColor(0xCCCCCC).width('90%')
      LoadingProgress()
        .key('ArkUX_Stage_loadingProgress_attrs_0100')
        .attributeModifier(this.customModifier as CustomModifier)
    }
    .width('100%')
    .margin({ top: 5 })
    }
    .margin({ top: 5 })
  }
}