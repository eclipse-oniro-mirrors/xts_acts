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
  TextInputAttribute,
  TextInput,
  EnterKeyType
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyTextInputAttributeModifier implements AttributeModifier<TextInputAttribute> {
  @State public isChange: boolean = true

  applyNormalAttribute(instance: TextInputAttribute): void {
    if (this.isChange) {
      instance.sphericalEffect(0.5)
    } else {
      instance.sphericalEffect(undefined)
    }
  }
}

@Entry
@Component
struct SphericalEffectModifier {
  @State isChange: boolean = true
  @State modifier: MyTextInputAttributeModifier = new MyTextInputAttributeModifier();

  build() {
    Column() {
      TextInput({ placeholder: '请输入变化范围百分比（[0%,100%]）' })
        .width('50%')
        .height(35)
        .enterKeyType(EnterKeyType.Done)
        .caretColor(Color.Red)
        .placeholderColor(Color.Blue)
        .id('sphericalEffectModifierTest')
        .attributeModifier(this.modifier)

      Button('点击切换Undefined').id('sphericalEffectModifier').onClick((event: ClickEvent) => {
        this.modifier.isChange = !this.modifier.isChange
      })
    }
    .width(400)
    .height(400)
  }
}