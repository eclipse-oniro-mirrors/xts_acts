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
  TextInput,
  FontWeight,
  TextDirection,
  Color,
  SelectedDragPreviewStyle
} from '@ohos.arkui.component';
import { ComponentContent, wrapBuilder } from '@kit.ArkUI';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Builder
function textInputCustomKeyboardBuilder() {
  Column() {
    TextInput({ placeholder: 'Custom Keyboard Row' })
      .fontSize('12fp')
      .key('textInputCustomKbdBuilderContent')
  }
  .width('100%')
}

@Entry
@Component
struct TextInputAttributeIndex {
  private textInputKeyboard: ComponentContent<undefined> = new ComponentContent(this.getUIContext(),
    wrapBuilder(textInputCustomKeyboardBuilder));

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.log('TextInputAttributeIndex error ' + error);
    }
  }

  build() {
    Scroll() {
      Column() {
        // ---------- TextInputAttribute.fontWeight ----------
        TextInput({ placeholder: 'fw Bold' })
          .fontWeight(FontWeight.Bold)
          .key('textInputFontWeightBold')

        TextInput({ placeholder: 'fw Normal' })
          .fontWeight(FontWeight.Normal)
          .key('textInputFontWeightNormal')

        TextInput({ placeholder: 'fw Medium' })
          .fontWeight(FontWeight.Medium)
          .key('textInputFontWeightMedium')

        TextInput({ placeholder: 'fw Lighter' })
          .fontWeight(FontWeight.Lighter)
          .key('textInputFontWeightLighter')

        TextInput({ placeholder: 'fw Bolder' })
          .fontWeight(FontWeight.Bolder)
          .key('textInputFontWeightBolder')

        TextInput({ placeholder: 'fw 400' })
          .fontWeight(400)
          .key('textInputFontWeight400')

        TextInput({ placeholder: 'fw 700' })
          .fontWeight(700)
          .key('textInputFontWeightInt700')

        TextInput({ placeholder: 'fw bold str' })
          .fontWeight('bold')
          .key('textInputFontWeightStrBold')

        TextInput({ placeholder: 'fw undefined' })
          .fontWeight(undefined)
          .key('textInputFontWeightUndefined')

        // ---------- TextInputAttribute.customKeyboard ----------
        TextInput({ placeholder: 'customKbd undefined' })
          .customKeyboard(undefined)
          .key('textInputCustomKbdUndefined')
        TextInput({ placeholder: 'customKbd builder' })
          .customKeyboard(this.textInputKeyboard)
          .key('textInputCustomKbdBuilder')

        // ---------- TextInputAttribute.includeFontPadding ----------
        TextInput({ placeholder: 'incFontPad true' })
          .includeFontPadding(true)
          .key('textInputIncludeFontPaddingTrue')

        TextInput({ placeholder: 'incFontPad false' })
          .includeFontPadding(false)
          .key('textInputIncludeFontPaddingFalse')

        TextInput({ placeholder: 'incFontPad undef' })
          .includeFontPadding(undefined)
          .key('textInputIncludeFontPaddingUndefined')

        // ---------- TextInputAttribute.fallbackLineSpacing ----------
        TextInput({ placeholder: 'fallbackLS true' })
          .fallbackLineSpacing(true)
          .key('textInputFallbackLineSpacingTrue')

        TextInput({ placeholder: 'fallbackLS false' })
          .fallbackLineSpacing(false)
          .key('textInputFallbackLineSpacingFalse')

        TextInput({ placeholder: 'fallbackLS undef' })
          .fallbackLineSpacing(undefined)
          .key('textInputFallbackLineSpacingUndefined')

        // ---------- TextInputAttribute.compressLeadingPunctuation ----------
        TextInput({ placeholder: 'compressLP true' })
          .compressLeadingPunctuation(true)
          .key('textInputCompressLeadingPuncTrue')

        TextInput({ placeholder: 'compressLP false' })
          .compressLeadingPunctuation(false)
          .key('textInputCompressLeadingPuncFalse')

        TextInput({ placeholder: 'compressLP undef' })
          .compressLeadingPunctuation(undefined)
          .key('textInputCompressLeadingPuncUndefined')

        // ---------- TextInputAttribute.selectedDragPreviewStyle ----------
        TextInput({ placeholder: 'dragPreview blue' })
          .selectedDragPreviewStyle({ color: Color.Blue } as SelectedDragPreviewStyle)
          .key('textInputSelectedDragPreviewBlue')

        TextInput({ placeholder: 'dragPreview undef' })
          .selectedDragPreviewStyle(undefined)
          .key('textInputSelectedDragPreviewUndefined')

        // ---------- TextInputAttribute.textDirection ----------
        TextInput({ placeholder: 'dir LTR' })
          .textDirection(TextDirection.LTR)
          .key('textInputDirLTR')

        TextInput({ placeholder: 'dir RTL' })
          .textDirection(TextDirection.RTL)
          .key('textInputDirRTL')

        TextInput({ placeholder: 'dir DEFAULT' })
          .textDirection(TextDirection.DEFAULT)
          .key('textInputDirDEFAULT')

        TextInput({ placeholder: 'dir AUTO' })
          .textDirection(TextDirection.AUTO)
          .key('textInputDirAUTO')

        TextInput({ placeholder: 'dir undef' })
          .textDirection(undefined)
          .key('textInputDirUndefined')
      }
      .width('100%')
      .padding({ top: '2%', bottom: '2%', left: '2%', right: '2%' })
    }
    .width('100%')
    .height('100%')
  }
}
