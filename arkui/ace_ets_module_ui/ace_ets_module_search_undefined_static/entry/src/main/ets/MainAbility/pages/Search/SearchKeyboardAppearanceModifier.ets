'use static'

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

import { Entry, Text, Column, Component, TextInput, Search, ColumnOptions, Row, ClickEvent, Button,AttributeModifier,
  TextInputAttribute, SearchAttribute, SearchAttribute,
  TextDecorationOptions, TextDecorationType, TextDecorationStyle,
  KeyboardAppearance, TextOverflow, $r,Color } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
class SearchModifier implements AttributeModifier<SearchAttribute> {
  public state: boolean = false;
  applyNormalAttribute(instance: SearchAttribute): void {
    if (this.state == false) {
      instance.keyboardAppearance(undefined);
    } else {
      instance.keyboardAppearance(KeyboardAppearance.DARK_IMMERSIVE);
    }
  }
}

@Entry
@Component
struct TextInputExample {
  @State text: string = 'As the sun begins to set, casting a warm golden hue across the sky,' +
    'the world seems to slow down and breathe a sigh of relief. The sky is painted with hues of orange, ' +
    ' pink, and lavender, creating a breathtaking tapestry that stretches as far as the eye can see.' +
    'The air is filled with the sweet scent of blooming flowers, mingling with the earthy aroma of freshly turned soil.' +
    'it casts a warm,' +
    'golden hue that spreads like liquid amber across the vast expanse of the sky.' +
    'The once-blue heavens gradually transform, ';
  @State searchModifier: SearchModifier = new SearchModifier();
  build() {
    Row() {
      Column( { space: 10 } as ColumnOptions ) {
        Button(`keyboardAppearance: ${this.searchModifier.state}`)
          .id('button_keyboardAppearance')
          .width(240)
          .fontSize(16)
          .margin(10)
          .onClick((e: ClickEvent)=>{
            this.searchModifier.state = !this.searchModifier.state;
          })
        Search({value:''})
          .id('Search2')
        Search({value: this.text})
          .attributeModifier(this.searchModifier)
          .height(56)
          .id('Search')
      }.width('100%')
    }
    .height('100%')
  }
}