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
  AttributeModifier,
  ColumnAttribute,
  Row,
  FlexAlign
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyColumnAttributeModifier implements AttributeModifier<ColumnAttribute> {
  @State public isChange: boolean = true

  applyNormalAttribute(instance: ColumnAttribute): void {
    if (this.isChange) {
      instance.useShadowBatching(true)
    } else {
      instance.useShadowBatching(undefined)
    }
  }
}

@Entry
@Component
struct UseShadowBatchingModifier {
  @State modifier: MyColumnAttributeModifier = new MyColumnAttributeModifier();

  build() {
    Row() {
      Column(undefined) {
        Column(undefined) {
        }
        .justifyContent(FlexAlign.Center)
        .width(150)
        .height(150)
        .backgroundColor('#67C23A')
        .borderRadius(10)
        .translate({ y: -50 })
        .id('useShadowBatchingModifierTest')
        .attributeModifier(this.modifier)

        Button('点击切换Undefined').id('useShadowBatchingModifier').onClick((event: ClickEvent) => {
          this.modifier.isChange = !this.modifier.isChange
        })
      }
      .width(400)
    }
    .height(400)
  }
}