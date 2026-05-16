'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { SymbolGlyphModifier } from "@ohos.arkui.modifier";
import {
  Entry, Component,
  Column, ColumnOptions, Color, $r, MenuItemGroup,
  Text, Button, ClickEvent, Margin, MenuItemOptions, Menu, MenuItem,
  Flex, FlexDirection, ItemAlign, FlexAlign, DismissDialogAction,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct MenuExample_api {
  @State startIconModifier: SymbolGlyphModifier = new SymbolGlyphModifier($r("sys.symbol.ohos_mic")).fontSize("24vp");
  @State endIconModifier: SymbolGlyphModifier = new SymbolGlyphModifier($r("sys.symbol.ohos_trash")).fontSize("24vp");
  @State selectIconModifier: SymbolGlyphModifier = new SymbolGlyphModifier($r("sys.symbol.ohos_trash")).fontSize("24vp");
  @State select: boolean = true;
  @State MenuItemOption: MenuItemOptions = { symbolStartIcon: this.startIconModifier, content: "菜单选项", symbolEndIcon: this.endIconModifier } as MenuItemOptions
  @State startIconValue: string = ""
  @State endIconValue: string = ""
  build() {
    Column({ space: 12 } as ColumnOptions) {
      Text(this.startIconValue).id("symbolStartIcon")
        .margin({ top: 50 } as Margin)
      Text(this.endIconValue).id("symbolEndIcon")
      Button("click to show")
        .id("btn")
        .onClick((e:ClickEvent) => {
          if (this.MenuItemOption.symbolStartIcon) {
            this.startIconValue = "symbolStartIcon"
          } else {
            this.startIconValue = "NULL"
          }
          if (this.MenuItemOption.symbolEndIcon) {
            this.endIconValue = "symbolEndIcon"
          } else {
            this.endIconValue = "NULL"
          }
        })
      Menu(){
        MenuItem(this.MenuItemOption)
        MenuItem({content: "菜单选项" } as MenuItemOptions)
          .selected(this.select).selectIcon(this.selectIconModifier)
        MenuItemGroup({header: "小标题" }){
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: "菜单选项",
            symbolEndIcon: this.endIconModifier
          } as MenuItemOptions)
        }
      }
    }
    .width("100%")
  }
}