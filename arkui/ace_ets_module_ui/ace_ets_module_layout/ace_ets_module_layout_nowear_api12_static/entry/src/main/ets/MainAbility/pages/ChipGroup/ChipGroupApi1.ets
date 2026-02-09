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
import {
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  SymbolGlyphModifier,
  Builder,
  $r
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import inspector from '@ohos.arkui.inspector';
import {ChipGroup, IconGroupSuffix } from '@ohos.arkui.advanced.ChipGroup';
import { ChipSize } from '@ohos.arkui.advanced.Chip';
@Entry
  // @Preview
@Component
struct ChipGroupApi1 {
  @State selected_index: Array<int> = [0, 1, 2, 3, 4, 5, 6] as Array<int>;
  @State selected_state: boolean = true;
  // @State prefixModifierNormal: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_star')); 1.1 注释
  // @State prefixModifierActivated: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontColor([Color.Red]); 1.1 注释
  // @State suffixModifierNormal: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')); 1.1 注释
  // @State suffixModifierActivated: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Red]); 1.1 注释
  @State text1: string = ''

  @Builder
  ChipGroupSuffix(): void {
    IconGroupSuffix({
      items: [
        new SymbolGlyphModifier($r('sys.symbol.magnifyingglass'))
          .onClick(() => {
            if (this.selected_state == false) {
              this.selected_index = [0, 1, 2, 3, 4, 5, 6];
              this.selected_state = true;
            } else {
              this.selected_index = [];
              this.selected_state = false;
            }
          })
      ]
    })
  }

  build() {
    Column() {
      ChipGroup({
        items: [
          {
            // prefixSymbol: { normal: this.prefixModifierNormal, activated: this.prefixModifierActivated }, 1.1 注释
            label: { text: "操作块1" },
            // suffixSymbol: { normal: this.suffixModifierNormal, activated: this.suffixModifierActivated },1.1 注释
            allowClose: false,
          }
        ],
        itemStyle: {
          size: ChipSize.NORMAL,
          backgroundColor: $r('sys.color.ohos_id_color_button_normal'),
          fontColor: $r('sys.color.ohos_id_color_text_primary'),
          selectedBackgroundColor: $r('sys.color.ohos_id_color_emphasize'),
          selectedFontColor: $r('sys.color.ohos_id_color_text_primary_contrary'),
        },
        selectedIndexes: this.selected_index,
        multiple: true,
        chipGroupSpace: { itemSpace: 8, endSpace: 0 },
        onChange: (activatedChipsIndex: Array<int>) => {
          console.log('chips on clicked, activated index ' + activatedChipsIndex)
        },
        // suffix: this.ChipGroupSuffix.bind(this)
        suffix: this.ChipGroupSuffix
      })

      Button('getInspectorTree').onClick((e: ClickEvent) => {
        // this.text1 = '' + JSON.parse(JSON.stringify(getInspectorTree())).$children[0].$children[0].$children[0].$children[0].$children[0].$children[0].$children[0].$children[0].$children[0].$children[0].$children[0].$type 1.1 注释
        this.text1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getElement("$attrs")
          .getString("padding")

      }).id('ChipGroupApi1_btn1')

      Text(this.text1).id('ChipGroupApi1_text1')

    }
  }
}