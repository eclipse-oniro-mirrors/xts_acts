'use static';
/*
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
import { Entry, Column, Component, Flex, FlexDirection, ItemAlign, FlexAlign, Text, Button, FontWeight,VerticalAlign,
  Row, ClickEvent, Margin, Builder, PixelMap, Blank, ImageContent,Resource,
  Image,ButtonType, WrappedBuilder, ContentModifier, MenuItemConfiguration,wrapBuilder,
  Color, Select, Path, $r,CustomBuilderT} from '@ohos.arkui.component'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { State } from '@ohos.arkui.stateManagement'

class MyMenuItemContentModifier implements ContentModifier<MenuItemConfiguration> {
  modifierText: string = ""
  constructor(text: string) {
    this.modifierText = text;
  }
  applyContent(): WrappedBuilder<CustomBuilderT<MenuItemConfiguration>> {
    return wrapBuilder<CustomBuilderT<MenuItemConfiguration>>(MenuItemBuilder)
  }
}

@Builder
function MenuItemBuilder(configuration: MenuItemConfiguration) {
  Row() {
    Text(configuration.value).id("RowValue")
    Blank()
    Image(configuration.icon as PixelMap|ImageContent|String|Resource).size({ width: 40, height: 40 })
    Blank(30)
    Text((configuration.contentModifier as MyMenuItemContentModifier).modifierText)
    Path()
      .width('100px')
      .height('150px')
      .commands('M40 0 L80 100 L0 100 Z')
      .fillOpacity(0)
      .stroke(Color.Black)
      .strokeWidth(3)
  }
  .onClick((e:ClickEvent) => {
    configuration.triggerSelect(configuration.index, configuration.value.toString())
  })
}

@Entry
@Component
struct triggerSelectExample {
  @State text: string = "有modifier"
  @State triggerSelect: string = "triggerSelect"

  build() {
    Column() {
      Row() {
        Text(this.triggerSelect).margin(30).id("triggerSelectValue")
        Select([{ value: 'item1', icon: $r("app.media.icon") },
          { value: 'item2', icon: $r("app.media.icon") }])
          .value(this.text)
          .onSelect((index:int, text?: string)=>{
            this.triggerSelect = 'Select index:' + index + 'Select text:' + text
            console.info('Select index:' + index)
            console.info('Select text:' + text)
          })
          .menuItemContentModifier(new MyMenuItemContentModifier("我来自Modifier"))
          .id("SelectClick")

      }.alignItems(VerticalAlign.Center).height("50%")
    }
  }
}