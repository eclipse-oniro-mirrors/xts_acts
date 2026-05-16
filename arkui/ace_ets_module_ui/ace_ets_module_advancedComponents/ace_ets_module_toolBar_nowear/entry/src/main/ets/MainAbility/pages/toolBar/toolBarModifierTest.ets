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
  SymbolGlyphModifier,
  DividerModifier,
  ToolBar,
  ToolBarOptions,
  ToolBarModifier,
  ItemState,
  LengthMetrics,
} from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State toolbarList: ToolBarOptions = new ToolBarOptions();
  // 自定义工具栏样式
  private toolBarModifier: ToolBarModifier =
    new ToolBarModifier().height(LengthMetrics.vp(52))
      .backgroundColor(Color.Transparent)
      .stateEffect(false)
      .padding(LengthMetrics.vp(10));
  private toolBarModifierUndefined: ToolBarModifier =
    new ToolBarModifier().height(LengthMetrics.vp(-51))
      .backgroundColor('')
      .stateEffect(true)
      .padding(LengthMetrics.vp(-5));
  @State dividerModifier: DividerModifier = new DividerModifier().height(0);

  aboutToAppear() {
    // 添加工具栏子项
    this.toolbarList.push({
      content: 'text',
      icon: $r('sys.media.ohos_ic_public_share'),
      action: () => {
      },
      state: ItemState.ACTIVATE,
      toolBarSymbolOptions: {
        normal: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontColor([Color.Green]), // 普通态symbol图标
        activated: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontColor([Color.Red]), // 激活态symbol图标
      },
      activatedTextColor: $r('sys.color.font_primary'),
    })
    this.toolbarList.push({
      content: 'Copy',
      icon: $r('sys.media.ohos_ic_public_copy'),
      action: () => {
      },
      state: ItemState.DISABLE,
      iconColor: '#ff18cb53',
      activatedIconColor: '#ffec5d5d', // 激活态icon颜色
      activatedTextColor: '#ffec5d5d', // 激活态文本颜色
    })
    this.toolbarList.push({
      content: 'Paste',
      icon: $r('sys.media.ohos_ic_public_paste'),
      action: () => {
      },
      state: ItemState.ACTIVATE,
      textColor: '#ff18cb53',
    })
    this.toolbarList.push({
      content: 'All',
      icon: $r('sys.media.ohos_ic_public_select_all'),
      action: () => {
      },
      state: ItemState.ACTIVATE,
    })
    this.toolbarList.push({
      content: '分享',
      icon: $r('sys.media.ohos_ic_public_share'),
      action: () => {
      },
    })
    this.toolbarList.push({
      content: '分享',
      icon: $r('sys.media.ohos_ic_public_share'),
      action: () => {
      },
    })
  }

  build() {
    Row() {
      Stack() {
        Column() {
          ToolBar({
            toolBarModifier: this.toolBarModifier,
            dividerModifier: this.dividerModifier,
            activateIndex: 0,
            toolBarList: this.toolbarList,
          })
            .height(52)

          ToolBar({
            toolBarModifier: this.toolBarModifierUndefined,
            dividerModifier: this.dividerModifier,
            activateIndex: 0,
            toolBarList: this.toolbarList,
          })
            .height(52)

        }
      }
      .align(Alignment.Bottom)
      .width('100%')
      .height('100%')
    }
  }
}