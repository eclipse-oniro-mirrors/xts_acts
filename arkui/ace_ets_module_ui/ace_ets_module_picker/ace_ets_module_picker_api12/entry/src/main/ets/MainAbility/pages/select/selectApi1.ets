/*
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
import { ColorMetrics } from '@ohos.arkui.node';

class MyMenuItemContentModifier implements ContentModifier<MenuItemConfiguration> {
  modifierText: string = ""
  constructor(text: string) {
    this.modifierText = text;
  }
  applyContent(): WrappedBuilder<[MenuItemConfiguration]> {
    return wrapBuilder(MenuItemBuilder)
  }
}

@Builder
function MenuItemBuilder(configuration: MenuItemConfiguration) {
  Row() {
    Text(configuration.value).id('selectApi1_text')
  }
  .id('selectApi1_row')
  .onClick(() => {
    configuration.triggerSelect(configuration.index, configuration.value.valueOf().toString())
  })
}

@Entry
@Component
struct selectApi1 {
  @State text: string = "有modifier"
  build() {
    Column() {
      Row() {
        Select([
          { value: 'item1' }
        ])
          .value(this.text)
          .onSelect((index:number, text?: string)=>{
          })
          .focusBox({
            strokeColor:ColorMetrics.rgba(255,0,0)
          })
          .menuItemContentModifier(new MyMenuItemContentModifier("我来自Modifier"))
          .id('selectApi1_Select')

      }.alignItems(VerticalAlign.Center).height("50%")
    }
  }
}