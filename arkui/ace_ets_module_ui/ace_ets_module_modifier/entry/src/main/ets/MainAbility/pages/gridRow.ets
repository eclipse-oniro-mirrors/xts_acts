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
import { GridRowModifier } from "@ohos.arkui.modifier";

class CustomModifier extends GridRowModifier {
  applyGridRowAttribute(instance: GridRowAttribute): void {
    super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.alignItems(ItemAlign.End)
  }
}

@Entry
@Component
struct GridRowExample {
  @State bgColors: Color[] = [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown]
  @State customModifier: GridRowModifier = new CustomModifier()
    .alignItems(ItemAlign.Stretch)

  build() {
    Column({ space: 5 }) {
      Button("change value").onClick(() => {
        (this.customModifier as CustomModifier).onChange1();
      }).key("changeButton")

      GridRow({
        columns: 3,
        gutter: { x: 5, y: 10 },
        breakpoints: { value: ["400vp", "600vp", "800vp"],
          reference: BreakpointsReference.WindowSize },
        direction: GridRowDirection.Row
      }){
        GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 }, offset: 0, order: 0 }) {
          Row(){Text("t")}.width("100%").height("20vp")
        }.borderColor(Color.Brown).borderWidth(2).backgroundColor(Color.Brown).key("gridRow")

        ForEach(this.bgColors, (color: Color) => {
          GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 }, offset: 0, order: 0 }) {
            Row(){Text("t")}.width("100%").height("20vp")
          }.borderColor(color).borderWidth(2).backgroundColor(color)
        })
      }.width("100%").height("100%")
      .attributeModifier(this.customModifier as CustomModifier)
      // .key('gridRow')
      }
      .margin({ top: 5 })
    }
}