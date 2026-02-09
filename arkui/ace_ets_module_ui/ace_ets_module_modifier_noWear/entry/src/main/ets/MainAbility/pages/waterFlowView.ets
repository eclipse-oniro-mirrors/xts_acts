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
import { WaterFlowModifier } from "@ohos.arkui.modifier";

class CustomModifier extends WaterFlowModifier {
  applyNormalAttribute(instance: WaterFlowAttribute): void {
    super.applyNormalAttribute?.(instance);
  }
  onChange1() {
    this.columnsGap(2)
  }
}

@Entry
@Component
export struct WaterFlowView {

  @State customModifier: WaterFlowModifier = new CustomModifier()
    .nestedScroll({ scrollForward: NestedScrollMode.SELF_ONLY, scrollBackward: NestedScrollMode.SELF_FIRST })
    .friction(1)
    .enableScrollInteraction(true)
    .columnsTemplate('1fr 1fr 1fr 1fr')
    .itemConstraintSize({ minWidth: 1, maxWidth: 10, minHeight: 1, maxHeight: 10 })
    .columnsGap(1)
    .rowsTemplate('1fr 1fr 1fr 1fr')
    .rowsGap(1)
    .layoutDirection(FlexDirection.Column)

  scroller: Scroller = new Scroller()

  build() {
    Column() {
      Button("change value").onClick(() => {
        (this.customModifier as CustomModifier).onChange1();
      }).key("changeButton")

      WaterFlow() {
        ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (item: number) => {
          FlowItem() {
            Column() {
              Text('N' + item).fontSize(12)
            }
          }
            .width('100%')
            .height('10')
            .backgroundColor('#FF00FF00')
        }, (item: string) => item)
      }
      .key('WaterFlowKey1')
      .attributeModifier(this.customModifier  as CustomModifier)
    }
  }
}