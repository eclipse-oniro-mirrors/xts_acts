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
import { Entry, Component, Column, AttributeModifier, MenuAttribute, Dimension, BorderRadiuses, ResourceColor, Font,
  FontWeight, FontStyle, Menu, MenuItem, MenuItemOptions } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

class TestMenuModifier implements AttributeModifier<MenuAttribute> {
  mRadius: Dimension | BorderRadiuses = '12vp'
  mFontColor: ResourceColor = '#FF123654'
  mFont: Font = { size: 20, weight: FontWeight.Normal, family: 'medium', style: FontStyle.Normal }

  applyNormalAttribute(instance: MenuAttribute): void {
    instance
      .radius(this.mRadius)
      .fontColor(this.mFontColor)
      .font(this.mFont)
  }
}

@Entry
@Component
struct TestMenuPage {
  @State modifier: TestMenuModifier = new TestMenuModifier()

  build() {
    Column() {
      Menu() {
        MenuItem({ content: "复制", labelInfo: "Ctrl+C" } as MenuItemOptions)
        MenuItem({ content: "粘贴", labelInfo: "Ctrl+V" } as MenuItemOptions)
      }
      .key('MenuKey1')
      .attributeModifier(this.modifier)
    }
    .width('100%')
    .height('100%')
  }
}
