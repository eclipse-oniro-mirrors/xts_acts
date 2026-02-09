'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { Entry, Component, Column, AttributeModifier, ButtonAttribute, Button, ButtonType } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

class ButtonModifier3 implements AttributeModifier<ButtonAttribute> {
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.id('testid');

  }
}

class ButtonModifier4 implements AttributeModifier<ButtonAttribute> {
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.key('testkey');
  }
}

@Entry
@Component
struct IdKeyTest7Example {
  @State buttonTypeValue: ButtonType = ButtonType.Normal;
  @State buttonModifier3: ButtonModifier3 = new ButtonModifier3();
  @State buttonModifier4: ButtonModifier4 = new ButtonModifier4();

  build() {
    Column(){

      Button('Ok3', { type: this.buttonTypeValue, stateEffect: true })
        .borderRadius(8)
        .backgroundColor(0x317aff)
        .width(90)
        .attributeModifier(this.buttonModifier3)

      Button('Ok4', { type: this.buttonTypeValue, stateEffect: true })
        .borderRadius(8)
        .backgroundColor(0x317aff)
        .width(90)
        .attributeModifier(this.buttonModifier4)
    }
  }
}
