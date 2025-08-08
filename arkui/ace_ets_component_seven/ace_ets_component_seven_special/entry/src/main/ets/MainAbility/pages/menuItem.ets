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

class MenuItemModifier1 implements AttributeModifier<MenuItemAttribute> {
  applyNormalAttribute(instance: MenuItemAttribute): void {
    instance
      .contentFont({ size: 10 })
      .contentFontColor(Color.Blue)
      .labelFont({ size: 15 })
      .labelFontColor(Color.Red)
      .selected(true)
  }
}

@Entry
@Component
struct menuItemPage {
  @State menuItemModifier1: MenuItemModifier1 = new MenuItemModifier1()

  build() {
    Row() {
      Column() {
        Menu() {
          MenuItem({
            content: "content1",
            endIcon: "resource/base/media/icon.png",
            labelInfo: "labelInfo1",
          })
            .key("menuItem_options1")
            .attributeModifier(this.menuItemModifier1)
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}