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
import { PathModifier } from "@ohos.arkui.modifier";

class CustomModifier extends PathModifier {

  applyNormalAttribute(instance: PathAttribute): void {
    super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.commands("M100 0 L0 100 L50 200 L150 200 L200 200 Z")
  }

}

@Entry
@Component
struct PathNew {
  @State customModifier: PathModifier = new CustomModifier()
    .commands("M100 0 L0 100 L50 200 L150 200 L200 100 Z")

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Button("change value").onClick(() => {
        (this.customModifier as CustomModifier).onChange1();
      }).key("changeButton")

      Text("path-New")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("neText")

      Path().width("100px").height("100px")
        .key("PathKey1")
        .attributeModifier(this.customModifier as CustomModifier)

    }
    .width("100%")
    .height("100%")
  }
}

