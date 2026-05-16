'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  Color,
  AttributeModifier,
  RowAttribute,
  BlendMode,
  BlendApplyType,
  Row,
  Position,
  Circle,
  VerticalAlign
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyRowAttributeModifier implements AttributeModifier<RowAttribute> {
  @State public isChange: boolean = true

  applyNormalAttribute(instance: RowAttribute): void {
    if (this.isChange) {
      instance.blendMode(BlendMode.DST_IN, BlendApplyType.OFFSCREEN)
    } else {
      instance.blendMode(undefined, undefined)
    }
  }
}

@Entry
@Component
struct BlendModeModifier {
  @State isChange: boolean = true
  @State modifier: MyRowAttributeModifier = new MyRowAttributeModifier();

  build() {
      Column() {
        Row(undefined) {
          Circle()
            .width(200)
            .height(200)
            .fill(Color.Blue)
            .position({ x: 150, y: 50 } as Position)
        }
        .alignItems(VerticalAlign.Center)
        .height(300)
        .width('100%')
        .id('blendModeModifierTest')
        .attributeModifier(this.modifier)

        Button('点击切换Undefined').id('blendModeModifier').onClick((event: ClickEvent) => {
          this.modifier.isChange = !this.modifier.isChange
        })
      }
      .width(400)
      .height(400)
  }
}