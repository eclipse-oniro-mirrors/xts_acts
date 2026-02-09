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
  ColumnOptions,
  $r
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import inspector from '@ohos.arkui.inspector';
import { Chip, ChipOptions, ChipSize, LabelOptions, PrefixIconOptions, ChipSymbolGlyphOptions} from '@ohos.arkui.advanced.Chip';

@Entry
@Component
struct ChipApi1 {
  @State text1: string = ''

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Chip({
        prefixIcon: {
          src: $r('app.media.icon'),
          size: { width: 16, height: 16 },
          fillColor: Color.Blue,
          activatedFillColor: Color.Blue
        }  as PrefixIconOptions,
        // prefixSymbol: {
        //   normal: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontSize(16),
        //   activated: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontSize(16),
        // } as ChipSymbolGlyphOptions,
        // suffixSymbol: {
        //   normal: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontSize(16),
        //   activated: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontSize(16),
        // } as ChipSymbolGlyphOptions,
        label: {
          text: "操作块",
          fontSize: 12,
          fontColor: Color.Blue,
          activatedFontColor: Color.White,
          fontFamily: "HarmonyOS Sans",
          labelMargin: { left: 20, right: 30 },
        },
        size: ChipSize.NORMAL,
        allowClose: true,
        enabled: true,
        activated: true,
        backgroundColor: $r('sys.color.ohos_id_color_button_normal'),
        activatedBackgroundColor: "#FFFF0000",
        borderRadius: $r('sys.float.ohos_id_corner_radius_button'),
        onClose:()=>{
          console.log("chip on close")
        },
        onClicked:()=>{
          console.log("chip on clicked")
        },
      } as ChipOptions)

      Button('getInspectorTree').onClick((e: ClickEvent) => {
        this.text1 = '' + JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getElement("$attrs")
          .getString("backgroundColor")

      }).id('ChipApi1_btn1')

      Text(this.text1).id('ChipApi1_text')

    }
  }
}