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
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  Row,
  BackgroundBrightnessOptions,
  AttributeModifier,
  RowAttribute
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyRowAttributeModifier implements AttributeModifier<RowAttribute> {
  @State public isChange: boolean = true

  applyNormalAttribute(instance: RowAttribute): void {
    if (this.isChange) {
      instance.backgroundBrightness({
        rate: 0.5,
        lightUpDegree: 0.5
      } as BackgroundBrightnessOptions)
    } else {
      instance.backgroundBrightness(undefined)
    }
  }
}

@Entry
@Component
struct BackgroundBrightnessModifierPage {
  @State isChange: boolean = true
  @State modifier: MyRowAttributeModifier = new MyRowAttributeModifier();

  build() {
    Row() {
      Column() {
        Row() {
          Text('BackgroundBrightness')
        }
        .width(200)
        .height(100)
        .id('backgroundBrightnessModifierTest')
        .attributeModifier(this.modifier)

        Button('点击切换Undefined').id('backgroundBrightnessModifier').onClick((event: ClickEvent) => {
          this.modifier.isChange = !this.modifier.isChange
        })
      }
      .width(400)
    }
    .height(400)
  }
}