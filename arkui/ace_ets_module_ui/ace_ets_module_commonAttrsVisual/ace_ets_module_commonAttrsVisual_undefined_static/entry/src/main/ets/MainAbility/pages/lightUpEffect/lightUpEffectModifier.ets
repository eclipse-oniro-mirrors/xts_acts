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
  AttributeModifier,
  TextAttribute,
  Row
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyLightUpEffectModifier implements AttributeModifier<TextAttribute> {
  public isChange: boolean = true;

  applyNormalAttribute(instance: TextAttribute): void {
    if (this.isChange) {
      instance.lightUpEffect(0.6)
    } else {
      instance.lightUpEffect(undefined)
    }
  }
}

@Entry
@Component
struct LightUpEffectModifier {
  @State isChange: boolean = true
  @State modifier: MyLightUpEffectModifier = new MyLightUpEffectModifier();

  build() {
    Row() {
      Column() {
        Text('This is the text content with letterSpacing 0.')
          .letterSpacing(0)
          .fontSize(12)
          .border({ width: 1 })
          .padding(10)
          .width('50%')
          .id('lightUpEffectModifierTest')
          .attributeModifier(this.modifier)
          .height('100%')
          .width('100%')
        Button('点击切换Undefined').id('lightUpEffectModifier').onClick((event: ClickEvent) => {
          this.modifier.isChange = !this.modifier.isChange
        })
      }
      .width(400)
    }
    .height(400)
  }
}