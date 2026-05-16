'use static'
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
  Entry,
  Component,
  Scroll,
  Column,
  SymbolGlyph,
  $r,
  FontWeight,
  FontWeightConfigs
} from '@kit.ArkUI';

@Entry
@Component
struct SymbolGlyphFontWeight26 {
  build() {
    Scroll() {
      Column() {
        SymbolGlyph($r('sys.symbol.ohos_trash'))
          .fontWeight(100)
          .fontSize(48)
          .id('symbolGlyph_26_fontWeight_100')

        SymbolGlyph($r('sys.symbol.ohos_trash'))
          .fontWeight(400)
          .fontSize(48)
          .id('symbolGlyph_26_fontWeight_400')

        SymbolGlyph($r('sys.symbol.ohos_trash'))
          .fontWeight(900)
          .fontSize(48)
          .id('symbolGlyph_26_fontWeight_900')

        SymbolGlyph($r('sys.symbol.ohos_trash'))
          .fontWeight(700)
          .fontSize(48)
          .id('symbolGlyph_26_fontWeight_700')

        SymbolGlyph($r('sys.symbol.ohos_trash'))
          .fontWeight(FontWeight.Lighter)
          .fontSize(48)
          .id('symbolGlyph_26_fontWeight_Lighter')

        SymbolGlyph($r('sys.symbol.ohos_trash'))
          .fontWeight(FontWeight.Normal)
          .fontSize(48)
          .id('symbolGlyph_26_fontWeight_Normal')

        SymbolGlyph($r('sys.symbol.ohos_trash'))
          .fontWeight(FontWeight.Regular)
          .fontSize(48)
          .id('symbolGlyph_26_fontWeight_Regular')

        SymbolGlyph($r('sys.symbol.ohos_trash'))
          .fontWeight(FontWeight.Medium)
          .fontSize(48)
          .id('symbolGlyph_26_fontWeight_Medium')

        SymbolGlyph($r('sys.symbol.ohos_trash'))
          .fontWeight(FontWeight.Bold)
          .fontSize(48)
          .id('symbolGlyph_26_fontWeight_Bold')

        SymbolGlyph($r('sys.symbol.ohos_trash'))
          .fontWeight(FontWeight.Bolder)
          .fontSize(48)
          .id('symbolGlyph_26_fontWeight_Bolder')

        SymbolGlyph($r('sys.symbol.ohos_trash'))
          .fontWeight('400')
          .fontSize(48)
          .id('symbolGlyph_26_fontWeight_string_400')

        SymbolGlyph($r('sys.symbol.ohos_trash'))
          .fontWeight('bold')
          .fontSize(48)
          .id('symbolGlyph_26_fontWeight_string_bold')

        SymbolGlyph($r('sys.symbol.ohos_trash'))
          .fontWeight('bolder')
          .fontSize(48)
          .id('symbolGlyph_26_fontWeight_string_bolder')

        SymbolGlyph($r('sys.symbol.ohos_trash'))
          .fontWeight('lighter')
          .fontSize(48)
          .id('symbolGlyph_26_fontWeight_string_lighter')

        SymbolGlyph($r('sys.symbol.ohos_trash'))
          .fontWeight('regular')
          .fontSize(48)
          .id('symbolGlyph_26_fontWeight_string_regular')

        SymbolGlyph($r('sys.symbol.ohos_trash'))
          .fontWeight('medium')
          .fontSize(48)
          .id('symbolGlyph_26_fontWeight_string_medium')

        SymbolGlyph($r('sys.symbol.ohos_trash'))
          .fontWeight('')
          .fontSize(48)
          .id('symbolGlyph_26_fontWeight_empty_string')

        SymbolGlyph($r('sys.symbol.ohos_trash'))
          .fontSize(48)
          .id('symbolGlyph_26_fontWeight_default')

        SymbolGlyph($r('sys.symbol.ohos_trash'))
          .fontWeight(220, { enableVariableFontWeight: true } as FontWeightConfigs)
          .fontSize(48)
          .id('symbolGlyph_26_fontWeight_variable_220')

        SymbolGlyph($r('sys.symbol.ohos_trash'))
          .fontWeight(660, { enableVariableFontWeight: true } as FontWeightConfigs)
          .fontSize(48)
          .id('symbolGlyph_26_fontWeight_variable_660')

        SymbolGlyph($r('sys.symbol.ohos_trash'))
          .fontWeight(400, { enableVariableFontWeight: false } as FontWeightConfigs)
          .fontSize(48)
          .id('symbolGlyph_26_fontWeight_variable_false')

        SymbolGlyph($r('sys.symbol.ohos_trash'))
          .fontWeight(FontWeight.Normal, { enableDeviceFontWeightCategory: true } as FontWeightConfigs)
          .fontSize(48)
          .id('symbolGlyph_26_fontWeight_device_true')

        SymbolGlyph($r('sys.symbol.ohos_trash'))
          .fontWeight(FontWeight.Normal, { enableDeviceFontWeightCategory: false } as FontWeightConfigs)
          .fontSize(48)
          .id('symbolGlyph_26_fontWeight_device_false')

        SymbolGlyph($r('sys.symbol.ohos_trash'))
          .fontWeight(500, { enableVariableFontWeight: true, enableDeviceFontWeightCategory: true } as FontWeightConfigs)
          .fontSize(48)
          .id('symbolGlyph_26_fontWeight_configs_both')

        SymbolGlyph($r('sys.symbol.ohos_trash'))
          .fontWeight(500)
          .fontSize(48)
          .id('symbolGlyph_26_fontWeight_configs_default')

        SymbolGlyph($r('sys.symbol.ohos_trash'))
          .fontWeight(50)
          .fontSize(48)
          .id('symbolGlyph_26_fontWeight_out_range_low')

        SymbolGlyph($r('sys.symbol.ohos_trash'))
          .fontWeight(1000)
          .fontSize(48)
          .id('symbolGlyph_26_fontWeight_out_range_high')

        SymbolGlyph($r('sys.symbol.ohos_trash'))
          .fontWeight(-100)
          .fontSize(48)
          .id('symbolGlyph_26_fontWeight_negative')
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }
}