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
import { Entry, Component, Column, AttributeModifier, ToggleAttribute, Toggle, ToggleType, ColumnOptions } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

class ToggleModifier1 implements AttributeModifier<ToggleAttribute> {
  applyNormalAttribute(instance: ToggleAttribute): void {
    instance.selectedColor("#FF0000FF");
    instance.switchPointColor('#FF008000');
  }
}

@Entry
@Component
struct ToggleTest {
  @State toggleModifier: ToggleModifier1 = new ToggleModifier1()

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Toggle({ type: ToggleType.Switch, isOn: false })
        .key("toggleCheckbox")
        .attributeModifier(this.toggleModifier)
    }
    .width('100%')
    .height('100%')
  }
}