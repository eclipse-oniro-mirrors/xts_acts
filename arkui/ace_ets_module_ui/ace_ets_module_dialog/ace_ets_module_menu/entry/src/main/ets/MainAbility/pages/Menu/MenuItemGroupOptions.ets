/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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


@Entry
@Component
struct MenuItemGroupOptionsIndex {

  @Builder
  SubMenu() {
    Menu() {
      MenuItem({ content: "复制", labelInfo: "Ctrl+C" })
      MenuItem({ content: "粘贴", labelInfo: "Ctrl+V" })
    }
  }

  @Builder
  MyMenu(){
    Menu() {
      MenuItem({
        content: "content1",
        endIcon: "resource/base/media/icon.png",
        labelInfo: "labelInfo1",
      }).id("menuItem_options1")
        .contentFont({ size: 10 })
        .contentFontColor(Color.Blue)
        .labelFont({ size: 15 })
        .labelFontColor(Color.Red)

      MenuItem({
        content: "content2",
        endIcon: $r("app.media.icon"),
        labelInfo: $r("app.string.MenuItem2_labelInfo"),
      }).id("menuItem_options2")

      MenuItemGroup({
        footer: "footer1"
      }).id("MenuItemGroup_options1")

      MenuItemGroup({
        footer: $r("app.string.MenuItemGroup2_footer"),
      }).id("MenuItemGroup_options2")

      MenuItemGroup({
        footer: this.SubMenu.bind(this)
      }).id("MenuItemGroup_options3")
    }
  }

  build() {
    Row() {
      Column() {
        Button('click to show menu')
          .id("button_menu")
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
      }
      .bindMenu(this.MyMenu)
      .width('100%')
    }
    .height('100%')
  }
}