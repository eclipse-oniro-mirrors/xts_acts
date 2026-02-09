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

import { SymbolGlyphModifier } from '@ohos.arkui.modifier'


@Entry
@Component
struct NavigationSymbolIcon {
  @State str:string = ''

  @Builder NavigationTitle() {
    Column() {
      Text('Title')
        .fontColor('#182431')
        .fontSize(30)
        .lineHeight(41)
        .fontWeight(700)
      Text('subtitle')
        .fontColor('#182431')
        .fontSize(14)
        .lineHeight(19)
        .opacity(0.4)
        .margin({ top: 2, bottom: 20 })
    }.alignItems(HorizontalAlign.Start)
  }

  build() {
    Navigation() {
      Text('Navigation')
    }
    .title(this.NavigationTitle)
    .menus([
      {
        value: 'menus1',
        symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_star')),
        isEnabled: true
      }
    ])
    .titleMode(NavigationTitleMode.Full)
    .toolbarConfiguration([
      {
        value: 'item1',
        symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_star')),
      },
      {
        value: 'item2',
        status: ToolbarItemStatus.ACTIVE,
        symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_star')),
        activeSymbolIcon: new SymbolGlyphModifier($r('sys.symbol.face'))
      }
    ])
    .hideTitleBar(false)
    .hideToolBar(false)
    .mode(NavigationMode.Stack)
  }
}