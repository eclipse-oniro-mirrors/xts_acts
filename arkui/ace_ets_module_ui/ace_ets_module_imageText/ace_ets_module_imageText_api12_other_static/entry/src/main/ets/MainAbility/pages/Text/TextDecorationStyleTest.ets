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
  Column,
  Row,
  Text,
  Component,
  Search,
  SymbolGlyph,
  Margin,
  $r,
  BounceSymbolEffect,
  EffectScope,
  EffectDirection,
  TextDecorationType,
  TextDecorationStyle,
  TextAlign,
  TextArea,
  TextInput
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct TextDecorationStyleTest {
  @State testText: string = '测试文本'

  build() {
    Column() {
      Text(this.testText)
        .decoration({
          type: TextDecorationType.Underline,
          style: TextDecorationStyle.DOTTED
        })
        .id('TextDecorationStyleTextDOTTED')
        .textAlign(TextAlign.Center)
        .height('5%')
      Text(this.testText)
        .decoration({
          type: TextDecorationType.Underline,
          style: TextDecorationStyle.DASHED
        })
        .height('5%')
        .id('TextDecorationStyleTextDASHED')
        .textAlign(TextAlign.Center)
      Search({ value: this.testText })
        .decoration({
          type: TextDecorationType.Underline,
          style: TextDecorationStyle.DOTTED
        })
        .height('5%')
        .id('TextDecorationStyleSearchDOTTED')
        .textAlign(TextAlign.Center)
      Search({ value: this.testText })
        .decoration({
          type: TextDecorationType.Underline,
          style: TextDecorationStyle.DASHED
        })
        .height('5%')
        .id('TextDecorationStyleSearchDASHED')
        .textAlign(TextAlign.Center)
      TextArea({ text: this.testText })
        .decoration({
          type: TextDecorationType.Underline,
          style: TextDecorationStyle.DOTTED
        })
        .height('5%')
        .id('TextDecorationStyleTextAreaDOTTED')
        .textAlign(TextAlign.Center)
      TextArea({ text: this.testText })
        .decoration({
          type: TextDecorationType.Underline,
          style: TextDecorationStyle.DASHED
        })
        .height('5%')
        .id('TextDecorationStyleTextAreaDASHED')
        .textAlign(TextAlign.Center)
      TextInput({ text: this.testText })
        .decoration({
          type: TextDecorationType.Underline,
          style: TextDecorationStyle.DOTTED
        })
        .height('5%')
        .id('TextDecorationStyleTextInputDOTTED')
        .textAlign(TextAlign.Center)
      TextInput({ text: this.testText })
        .decoration({
          type: TextDecorationType.Underline,
          style: TextDecorationStyle.DASHED
        })
        .height('5%')
        .id('TextDecorationStyleTextInputDASHED')
        .textAlign(TextAlign.Center)
    }.width('100%')
  }
}