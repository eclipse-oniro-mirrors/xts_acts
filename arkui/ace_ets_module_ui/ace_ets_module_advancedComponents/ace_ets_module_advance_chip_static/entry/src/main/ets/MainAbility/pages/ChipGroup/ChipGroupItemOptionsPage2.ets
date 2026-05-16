'use static';
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

import { Entry, Text, Column, Component, Button, ClickEvent, Color, $r, ColumnOptions, FlexAlign, Direction, Builder, Row } from '@ohos.arkui.component'
import { State, Watch, PropRef } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import { SymbolGlyphModifier } from '@ohos.arkui.modifier';
import { ChipGroup, IconGroupSuffix, IconItemOptions, ChipGroupItemOptions, ChipItemStyle, SuffixImageIconOptions } from '@ohos.arkui.advanced.ChipGroup';
import { ChipSize , ChipSymbolGlyphOptions} from '@ohos.arkui.advanced.Chip';
import inspector from '@ohos.arkui.inspector';

@Entry
@Component
struct ChipGroupItemOptionsPage2 {
  @State selectedIndex: Array<int> = [0];
  @State prefixModifierNormal: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_star'));
  @State tex1: string = 'ww'
  build() {
    Column() {
      ChipGroup({
        items: [
          {
            prefixIcon: { src: $r('app.media.startIcon'), size: {width: 18, height: 18} },
            label: { text: '操作块1' },
            suffixImageIcon: { src: $r('sys.media.ohos_ic_public_cut'),
              action: () => {
                console.log('ww')
              }, accessibilityText: '后缀图标的无障碍文本属性'}  as SuffixImageIconOptions,
            closeOptions: {fontSize: 22 }, //默认删除图标的无障碍朗读功能属性。
            allowClose: false
          },
          {
            prefixSymbol: { normal: this.prefixModifierNormal },
            label: { text: '操作块3' },
            suffixSymbol: { normal: this.prefixModifierNormal },
            suffixSymbolOptions: {
              normalAccessibility: {
                accessibilityText: '保存'
              },
              action: () => {
                this.getUIContext().getPromptAction().showToast({
                  message: '后缀图标被点击！'
                });
              }
            },
            allowClose: true
          },
        ],
        selectedIndexes: this.selectedIndex,
        multiple: false,
      })
    }
    .padding({
      top: '5%',
      bottom: '5%',
      left: '5%',
      right: '5%',
    })
  }
}