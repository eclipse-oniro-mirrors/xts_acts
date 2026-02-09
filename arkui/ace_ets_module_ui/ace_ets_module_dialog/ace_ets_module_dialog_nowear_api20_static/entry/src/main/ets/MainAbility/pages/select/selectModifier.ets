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

import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  Select,
  $r
} from '@ohos.arkui.component'
import { TextModifier, SymbolGlyphModifier } from '@ohos.arkui.modifier'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
@Entry
@Component
struct SelectModifierExample {
  @State textModifier: TextModifier =
    new TextModifier()
      .fontSize('50vp')
      .fontColor('#FFFF1235')
      .maxLines(2);
  @State selectedOptionTextModifier: TextModifier =
    new TextModifier()
      .fontSize('51vp')
      .fontColor('#FFFF1236')
      .maxLines(3);
  @State optionTextModifier: TextModifier =
    new TextModifier()
      .fontSize('52vp')
      .fontColor('#FFFF1237')
      .maxLines(4);
  @State arrowModifier: SymbolGlyphModifier =
    new SymbolGlyphModifier($r('sys.symbol.ohos_folder_badge_plus'))
      .fontSize('53vp')
      .fontColor(['#FFFF1238', '#FFFF1238', '#FFFF1238']);

  build() {
    Column() {
      Select([{ value: 'bbb' }, { value: 'ccc' }])
        .id('Select')
        .selected(1)
        .value('TTTTT')
        .textModifier(this.textModifier)
        .selectedOptionTextModifier(this.selectedOptionTextModifier)
        .optionTextModifier(this.optionTextModifier)
        .arrowModifier(this.arrowModifier)

      Select([{ value: 'bbb' }, { value: 'ccc' }])
        .id('Select2')
        .selected(1)
        .value('TTTTT')
        .font({ size: '40vp' })
        .selectedOptionFont({ size: '41vp' })
        .optionFont({ size: '42vp' })
        .textModifier(undefined)
        .selectedOptionTextModifier(undefined)
        .optionTextModifier(undefined)
        .arrowModifier(undefined)
    }
  }
}