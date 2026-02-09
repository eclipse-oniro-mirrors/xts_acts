'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { Entry, Component, AttributeModifier, WaterFlowAttribute, NestedScrollMode, FlexDirection, WaterFlow, ForEach,
  FlowItem, Column, Text, Scroller } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

class WaterFlowModifier1 implements AttributeModifier<WaterFlowAttribute> {
  applyNormalAttribute(instance: WaterFlowAttribute): void {
    instance
      .nestedScroll({ scrollForward: NestedScrollMode.SELF_ONLY, scrollBackward: NestedScrollMode.SELF_FIRST })
      .friction(0.6)
      .enableScrollInteraction(true)
      .columnsTemplate('1fr 1fr 1fr 1fr')
      .itemConstraintSize({ minWidth: 1, maxWidth: 10, minHeight: 1, maxHeight: 10 })
      .columnsGap(1)
      .rowsTemplate('1fr 1fr 1fr 1fr')
      .rowsGap(1)
      .layoutDirection(FlexDirection.Column)
  }
}

@Entry
@Component
export struct WaterFlowView {
  @State waterFlowModifier: WaterFlowModifier1 = new WaterFlowModifier1()
  scroller: Scroller = new Scroller()

  build() {
    WaterFlow() {
      ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (item: int) => {
        FlowItem() {
          Column() {
            Text('N' + item).fontSize(12)
          }
        }
        .width('100%')
        .height('10')
        .backgroundColor('#FF00FF00')
      }, (item: int) => String(item))
    }
    .key('WaterFlowKey1')
    .attributeModifier(this.waterFlowModifier)
  }
}