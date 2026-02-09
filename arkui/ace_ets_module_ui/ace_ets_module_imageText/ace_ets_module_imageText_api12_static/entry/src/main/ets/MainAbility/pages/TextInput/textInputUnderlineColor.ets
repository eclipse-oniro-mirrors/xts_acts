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
import events_emitter from '@ohos.events.emitter';
import {
  Entry, Component,
  Column, Color, TextAlign, FontWeight, FontStyle, TextInput, Font, UnderlineColor
} from '@ohos.arkui.component'
@Entry
@Component
  struct TextInputUnderlineColor {

  build() {
    Column() {
      TextInput({ placeholder: 'input your word' })
        .key('key_TextInput_UnderlineColor_001')
        .placeholderColor("rgb(0,0,225)")
        .placeholderFont({ size: 30, weight: 100, family: 'cursive', style: FontStyle.Italic } as Font)
        .textAlign(TextAlign.Start)
        .caretColor(Color.Blue)
        .height(50)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontFamily("sans-serif")
        .fontStyle(FontStyle.Normal)
        .fontColor(Color.Black)
        .underlineColor('#FF0000FF')
        .maxLength(10)

      TextInput({ placeholder: 'input your word' })
        .key('key_TextInput_UnderlineColor_002')
        .placeholderColor("rgb(0,0,225)")
        .placeholderFont({ size: 30, weight: 100, family: 'cursive', style: FontStyle.Italic } as Font)
        .textAlign(TextAlign.Start)
        .caretColor(Color.Blue)
        .height(50)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontFamily("sans-serif")
        .fontStyle(FontStyle.Normal)
        .fontColor(Color.Black)
        .underlineColor({ disable: Color.Red } as UnderlineColor)
        .maxLength(10)

      TextInput({ placeholder: 'input your word' })
        .key('key_TextInput_UnderlineColor_003')
        .placeholderColor("rgb(0,0,225)")
        .placeholderFont({ size: 30, weight: 100, family: 'cursive', style: FontStyle.Italic } as Font)
        .textAlign(TextAlign.Start)
        .caretColor(Color.Blue)
        .height(50)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontFamily("sans-serif")
        .fontStyle(FontStyle.Normal)
        .fontColor(Color.Black)
        .underlineColor({ typing: Color.Red } as UnderlineColor)
        .maxLength(10)

      TextInput({ placeholder: 'input your word' })
        .key('key_TextInput_UnderlineColor_004')
        .placeholderColor("rgb(0,0,225)")
        .placeholderFont({ size: 30, weight: 100, family: 'cursive', style: FontStyle.Italic } as Font)
        .textAlign(TextAlign.Start)
        .caretColor(Color.Blue)
        .height(50)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontFamily("sans-serif")
        .fontStyle(FontStyle.Normal)
        .fontColor(Color.Black)
        .underlineColor({ error: Color.Red } as UnderlineColor)
        .maxLength(10)
    }
  }
}

