/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static'

import {
  Entry,
  Component,
  Column,
  Scroll,
  Text,
  FontWeight,
  TextDirection,
  Color,
  SelectedDragPreviewStyle,
  FontSettingOptions,
  LineSpacingOptions,
  TextController
} from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import { LengthMetrics } from '@ohos.arkui.node';

@Entry
@Component
struct TextAttributeIndex {
  private textController: TextController = new TextController();

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
      AppStorage.setOrCreate<TextController>('textController', this.textController);
    } catch (error) {
      console.log('TextAttributeIndex error ' + error);
    }
  }

  build() {
    Scroll() {
      Column() {
        // ---------- fontSize ----------
        Text('fontSize double 16').fontSize(16).key('textFontSizeDouble16')
        Text('fontSize string 20vp').fontSize('20vp').key('textFontSizeStr20vp')
        Text('fontSize resource').fontSize('16fp').key('textFontSizeResource')
        Text('fontSize undefined').fontSize(undefined).key('textFontSizeUndefined')

        // ---------- fontWeight (enum values) ----------
        Text('fontWeight Bold').fontWeight(FontWeight.Bold).key('textFontWeightBold')
        Text('fontWeight Normal').fontWeight(FontWeight.Normal).key('textFontWeightNormal')
        Text('fontWeight Medium').fontWeight(FontWeight.Medium).key('textFontWeightMedium')
        Text('fontWeight Lighter').fontWeight(FontWeight.Lighter).key('textFontWeightLighter')
        Text('fontWeight Bolder').fontWeight(FontWeight.Bolder).key('textFontWeightBolder')
        Text('fontWeight int 700').fontWeight(700).key('textFontWeightInt700')
        Text('fontWeight int 400').fontWeight(400).key('textFontWeightInt400')
        Text('fontWeight str bold').fontWeight('bold').key('textFontWeightStrBold')
        Text('fontWeight undefined').fontWeight(undefined).key('textFontWeightUndefined')
        Text('fontWeight with options').fontWeight(FontWeight.Bold,
          { enableVariableFontWeight: false } as FontSettingOptions
        ).key('textFontWeightWithOptions')

        // ---------- textDirection ----------
        Text('textDir LTR').textDirection(TextDirection.LTR).key('textAttrDirLTR')
        Text('textDir RTL').textDirection(TextDirection.RTL).key('textAttrDirRTL')
        Text('textDir DEFAULT').textDirection(TextDirection.DEFAULT).key('textAttrDirDEFAULT')
        Text('textDir AUTO').textDirection(TextDirection.AUTO).key('textAttrDirAUTO')
        Text('textDir undefined').textDirection(undefined).key('textAttrDirUndefined')

        // ---------- lineSpacing ----------
        Text('lineSpacing 10vp')
          .lineSpacing(LengthMetrics.vp(10))
          .key('textLineSpacing10vp')
        Text('lineSpacing 10vp onlyBetween')
          .lineSpacing(LengthMetrics.vp(10), { onlyBetweenLines: true } as LineSpacingOptions)
          .key('textLineSpacingOnlyBetween')
        Text('lineSpacing undefined').lineSpacing(undefined).key('textLineSpacingUndefined')

        // ---------- includeFontPadding ----------
        Text('includeFontPadding true').includeFontPadding(true).key('textIncludeFontPaddingTrue')
        Text('includeFontPadding false').includeFontPadding(false).key('textIncludeFontPaddingFalse')
        Text('includeFontPadding undefined').includeFontPadding(undefined).key('textIncludeFontPaddingUndefined')

        // ---------- fallbackLineSpacing ----------
        Text('fallbackLineSpacing true').fallbackLineSpacing(true).key('textFallbackLineSpacingTrue')
        Text('fallbackLineSpacing false').fallbackLineSpacing(false).key('textFallbackLineSpacingFalse')
        Text('fallbackLineSpacing undefined').fallbackLineSpacing(undefined).key('textFallbackLineSpacingUndefined')

        // ---------- compressLeadingPunctuation ----------
        Text('compressLeading true').compressLeadingPunctuation(true).key('textCompressLeadingPuncTrue')
        Text('compressLeading false').compressLeadingPunctuation(false).key('textCompressLeadingPuncFalse')
        Text('compressLeading undefined').compressLeadingPunctuation(undefined).key('textCompressLeadingPuncUndefined')

        // ---------- selectedDragPreviewStyle ----------
        Text('selectedDragPreview blue')
          .selectedDragPreviewStyle({ color: Color.Blue } as SelectedDragPreviewStyle)
          .key('textSelectedDragPreviewBlue')
        Text('selectedDragPreview undefined')
          .selectedDragPreviewStyle(undefined)
          .key('textSelectedDragPreviewUndefined')

        // ---------- TextController bound Text ----------
        Text('Hello World for selection')
          .key('textWithController')
      }
      .width('100%')
      .padding({ top: '2%', bottom: '2%', left: '2%', right: '2%' })
    }
    .width('100%')
    .height('100%')
  }
}
