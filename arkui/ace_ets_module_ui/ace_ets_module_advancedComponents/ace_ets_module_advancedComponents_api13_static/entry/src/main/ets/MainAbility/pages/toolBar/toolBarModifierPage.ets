'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { ItemState, ToolBar, ToolBarModifier, ToolBarOption, ToolBarOptions,ToolBarSymbolGlyphOptions } from '@ohos.arkui.advanced.ToolBar';
import { DividerModifier, SymbolGlyphModifier } from '@ohos.arkui.modifier';
import { LengthMetrics } from '@ohos.arkui.node';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import { Alignment, Color, Column, Component, Entry, Row, Stack,$r } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct ToolBarModifierPage {
  @State toolbarList: ToolBarOptions = new ToolBarOptions();
  @State toolBarModifier: ToolBarModifier =
    new ToolBarModifier()
      .height(LengthMetrics.vp(52))
      .backgroundColor(Color.Transparent)
      .stateEffect(false)
      .padding(LengthMetrics.vp(16));
  @State dividerModifier: DividerModifier = new DividerModifier().height(0);

  aboutToAppear():void {
    this.toolbarList.push({
      content: 'Long long long long long long long long text',
      icon: $r('sys.media.ohos_ic_public_share'),
      action: () => {
      },
      state: ItemState.ACTIVATE,
      toolBarSymbolOptions: {
        normal: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontColor([Color.Green]),
        activated: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontColor([Color.Red]),
      } as ToolBarSymbolGlyphOptions,
      activatedTextColor: $r('sys.color.font_primary'),
    } as ToolBarOption)
    this.toolbarList.push({
      content: 'Copy',
      icon: $r('sys.media.ohos_ic_public_copy'),
      action: () => {
      },
      state: ItemState.DISABLE,
      iconColor: '#ff18cb53',
      activatedIconColor: '#ffec5d5d',
      activatedTextColor: '#ffec5d5d',
    } as ToolBarOption)
    this.toolbarList.push({
      content: 'Paste',
      icon: $r('sys.media.ohos_ic_public_paste'),
      action: () => {
      },
      state: ItemState.ACTIVATE,
      textColor: '#ff18cb53',
    } as ToolBarOption)
    this.toolbarList.push({
      content: 'All',
      icon: $r('sys.media.ohos_ic_public_select_all'),
      action: () => {
      },
      state: ItemState.ACTIVATE,
    } as ToolBarOption)
    try {
      this.getUIContext()?.isFollowingSystemFontScale();
      this.getUIContext()?.getMaxFontScale();
    } catch (err) {
      err = err as BusinessError;
      let code: undefined | Int = (err as BusinessError)?.code as Int;
      let message: undefined | String = (err as BusinessError)?.message as String;
      hilog.error(0x3900, 'Ace', `Faild to toolBar getMaxFontScale, code: ${code}, message: ${message}`);
    }
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
          // .height(52)
        }
      }.align(Alignment.Bottom)
      .width('100%').height('100%')
    }
  }
}