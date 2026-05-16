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

import { ChipGroup, 	IconOptions, IconGroupSuffix,ChipGroupItemOptions,ChipItemStyle,IconItemOptions, SymbolItemOptions  } from '@ohos.arkui.advanced.ChipGroup';
import { SymbolGlyphModifier } from '@ohos.arkui.modifier';
import { Entry, Component, Column, Color, $r ,Builder} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { ChipSize } from '@ohos.arkui.advanced.Chip'
import { SymbolGlyphModifier } from '@ohos.arkui.modifier';

@Entry
@Component
struct ChipGroupIconItemOptionsPage {
  @State selectedIndex: Array<Int> = [0, 1, 2, 3, 4, 5, 6];
  @State selectedState: boolean = true;
  @State prefixModifierNormal: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_star'));
  @State prefixModifierActivated: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontColor([Color.Red]);
  @State suffixModifierNormal: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_wifi'));
  @State suffixModifierActivated: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Red]);

  @Builder
  ChipGroupSuffix(): void {
    IconGroupSuffix({
      items: [{
        icon: { src: $r('sys.media.ohos_ic_public_search_filled') } as 	IconOptions,
        accessibilityText: 'IconGroupSuffix_accessibilityText',
        accessibilityDescription: 'IconGroupSuffix_accessibilityDescription',
        accessibilityLevel: 'yes',
        action: () => {
          if (this.selectedState == false) {
            this.selectedIndex = [0, 1, 2, 3, 4, 5, 6]
            this.selectedState = true
          } else {
            this.selectedIndex = []
            this.selectedState = false
          }
        }
      } as IconItemOptions
      ]
    })
  }

  build() {
    Column() {
      ChipGroup({
        items: [
          {
            prefixSymbol: { normal: this.prefixModifierNormal, activated: this.prefixModifierActivated },
            label: { text: '操作块1' },
            suffixSymbol: { normal: this.suffixModifierNormal, activated: this.suffixModifierActivated },
            accessibilityDescription: 'ChipGroupItem_accessibilityDescription',
            accessibilityLevel: 'yes',
            allowClose: false,
          } as ChipGroupItemOptions,
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_clock'), size: { width: 36, height: 36 } },
            label: { text: '操作块2' },
            accessibilityLevel: 'no',
            allowClose: true,
          } as ChipGroupItemOptions,
        ],
        itemStyle: {
          size: ChipSize.SMALL,
          backgroundColor: $r('sys.color.ohos_id_color_button_normal'),
          fontColor: $r('sys.color.ohos_id_color_text_primary'),
          selectedBackgroundColor: $r('sys.color.ohos_id_color_emphasize'),
          selectedFontColor: $r('sys.color.ohos_id_color_text_primary_contrary'),
        } as ChipItemStyle,
        selectedIndexes: this.selectedIndex,
        multiple: true,
        chipGroupSpace: { itemSpace: 8, endSpace: 0 },
        chipGroupPadding: { top: 10, bottom: 10 },
        onChange: (activatedChipsIndex: Array<Int>) => {
          console.log('chips on clicked, activated index ' + activatedChipsIndex)
        },
        suffix: this.ChipGroupSuffix
      })
    }
  }
}