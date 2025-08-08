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
import { Chip, ChipSize } from '@ohos.arkui.advanced.Chip';
import { SymbolGlyphModifier } from '@ohos.arkui.modifier';

@Entry
@Component
struct ChipApi1 {
  @State text1: string = ''

  build() {
    Column({ space: 10 }) {
      Chip({
        prefixIcon: {
          src: $r('app.media.icon'),
          size: { width: 16, height: 16 },
          fillColor: Color.Blue,
          activatedFillColor: Color.Blue
        },
        prefixSymbol: {
          normal: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontSize(16),
          activated: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontSize(16),
        },
        suffixSymbol: {
          normal: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontSize(16),
          activated: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontSize(16),
        },
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
      })

      Button('getInspectorTree').onClick(()=>{
        this.text1 = '' + JSON.parse(JSON.stringify(getInspectorTree())).$children[0].$children[0].$attrs.backgroundColor

      }).id('ChipApi1_btn1')

      Text(this.text1).id('ChipApi1_text')


    }
  }
}