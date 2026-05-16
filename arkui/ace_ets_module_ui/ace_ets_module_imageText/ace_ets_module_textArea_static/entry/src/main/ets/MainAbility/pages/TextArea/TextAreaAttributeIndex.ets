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
  TextArea,
  FontWeight,
  TextDirection,
  Color,
  SelectedDragPreviewStyle,
  LineSpacingOptions,
  MaxLinesMode,
  MaxLinesOptions
} from '@ohos.arkui.component';
import { ComponentContent, wrapBuilder } from '@kit.ArkUI';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import { LengthMetrics } from '@ohos.arkui.node';

@Builder
function textAreaCustomKeyboardBuilder() {
  Column() {
    TextArea({ placeholder: 'Custom Keyboard Row' })
      .fontSize('12fp')
      .key('textAreaCustomKbdBuilderContent')
  }
  .width('100%')
}

@Entry
@Component
struct TextAreaAttributeIndex {
  private textAreaKeyboard: ComponentContent<undefined> = new ComponentContent(this.getUIContext(),
    wrapBuilder(textAreaCustomKeyboardBuilder));

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.log('TextAreaAttributeIndex error ' + error);
    }
  }

  build() {
    Scroll() {
      Column() {
        // ---------- fontWeight (enum values) ----------
        TextArea({ placeholder: 'fw Bold' })
          .fontWeight(FontWeight.Bold)
          .key('textAreaFontWeightBold')
        TextArea({ placeholder: 'fw Normal' })
          .fontWeight(FontWeight.Normal)
          .key('textAreaFontWeightNormal')
        TextArea({ placeholder: 'fw Medium' })
          .fontWeight(FontWeight.Medium)
          .key('textAreaFontWeightMedium')
        TextArea({ placeholder: 'fw Lighter' })
          .fontWeight(FontWeight.Lighter)
          .key('textAreaFontWeightLighter')
        TextArea({ placeholder: 'fw Bolder' })
          .fontWeight(FontWeight.Bolder)
          .key('textAreaFontWeightBolder')
        TextArea({ placeholder: 'fw 700' })
          .fontWeight(700)
          .key('textAreaFontWeightInt700')
        TextArea({ placeholder: 'fw 400' })
          .fontWeight(400)
          .key('textAreaFontWeightInt400')
        TextArea({ placeholder: 'fw bold str' })
          .fontWeight('bold')
          .key('textAreaFontWeightStrBold')
        TextArea({ placeholder: 'fw undefined' })
          .fontWeight(undefined)
          .key('textAreaFontWeightUndefined')

        // ---------- maxLines ----------
        TextArea({ placeholder: 'maxLines 5' })
          .maxLines(5)
          .key('textAreaMaxLines5')
        TextArea({ placeholder: 'maxLines clip' })
          .maxLines(5, { overflowMode: MaxLinesMode.CLIP } as MaxLinesOptions)
          .key('textAreaMaxLinesClip')
        TextArea({ placeholder: 'maxLines scroll' })
          .maxLines(5, { overflowMode: MaxLinesMode.SCROLL } as MaxLinesOptions)
          .key('textAreaMaxLinesScroll')
        TextArea({ placeholder: 'maxLines undefined' })
          .maxLines(undefined)
          .key('textAreaMaxLinesUndefined')

        // ---------- customKeyboard ----------
        TextArea({ placeholder: 'customKbd undefined' })
          .customKeyboard(undefined)
          .key('textAreaCustomKbdUndefined')
        TextArea({ placeholder: 'customKbd builder' })
          .customKeyboard(this.textAreaKeyboard)
          .key('textAreaCustomKbdBuilder')

        // ---------- lineSpacing ----------
        TextArea({ placeholder: 'lineSpacing 8vp' })
          .lineSpacing(LengthMetrics.vp(8))
          .key('textAreaLineSpacing8vp')
        TextArea({ placeholder: 'lineSpacing onlyBetween' })
          .lineSpacing(LengthMetrics.vp(8), { onlyBetweenLines: true } as LineSpacingOptions)
          .key('textAreaLineSpacingOnlyBetween')
        TextArea({ placeholder: 'lineSpacing undefined' })
          .lineSpacing(undefined)
          .key('textAreaLineSpacingUndefined')

        // ---------- includeFontPadding ----------
        TextArea({ placeholder: 'incFontPad true' })
          .includeFontPadding(true)
          .key('textAreaIncludeFontPaddingTrue')
        TextArea({ placeholder: 'incFontPad false' })
          .includeFontPadding(false)
          .key('textAreaIncludeFontPaddingFalse')
        TextArea({ placeholder: 'incFontPad undefined' })
          .includeFontPadding(undefined)
          .key('textAreaIncludeFontPaddingUndefined')

        // ---------- fallbackLineSpacing ----------
        TextArea({ placeholder: 'fallbackLS true' })
          .fallbackLineSpacing(true)
          .key('textAreaFallbackLineSpacingTrue')
        TextArea({ placeholder: 'fallbackLS false' })
          .fallbackLineSpacing(false)
          .key('textAreaFallbackLineSpacingFalse')
        TextArea({ placeholder: 'fallbackLS undefined' })
          .fallbackLineSpacing(undefined)
          .key('textAreaFallbackLineSpacingUndefined')

        // ---------- compressLeadingPunctuation ----------
        TextArea({ placeholder: 'compressLP true' })
          .compressLeadingPunctuation(true)
          .key('textAreaCompressLeadingPuncTrue')
        TextArea({ placeholder: 'compressLP false' })
          .compressLeadingPunctuation(false)
          .key('textAreaCompressLeadingPuncFalse')
        TextArea({ placeholder: 'compressLP undefined' })
          .compressLeadingPunctuation(undefined)
          .key('textAreaCompressLeadingPuncUndefined')

        // ---------- selectedDragPreviewStyle ----------
        TextArea({ placeholder: 'dragPreview blue' })
          .selectedDragPreviewStyle({ color: Color.Blue } as SelectedDragPreviewStyle)
          .key('textAreaSelectedDragPreviewBlue')
        TextArea({ placeholder: 'dragPreview undefined' })
          .selectedDragPreviewStyle(undefined)
          .key('textAreaSelectedDragPreviewUndefined')

        // ---------- textDirection ----------
        TextArea({ placeholder: 'dir LTR' })
          .textDirection(TextDirection.LTR)
          .key('textAreaDirLTR')
        TextArea({ placeholder: 'dir RTL' })
          .textDirection(TextDirection.RTL)
          .key('textAreaDirRTL')
        TextArea({ placeholder: 'dir DEFAULT' })
          .textDirection(TextDirection.DEFAULT)
          .key('textAreaDirDEFAULT')
        TextArea({ placeholder: 'dir AUTO' })
          .textDirection(TextDirection.AUTO)
          .key('textAreaDirAUTO')
        TextArea({ placeholder: 'dir undefined' })
          .textDirection(undefined)
          .key('textAreaDirUndefined')
      }
      .width('100%')
      .padding({ top: '2%', bottom: '2%', left: '2%', right: '2%' })
    }
    .width('100%')
    .height('100%')
  }
}
