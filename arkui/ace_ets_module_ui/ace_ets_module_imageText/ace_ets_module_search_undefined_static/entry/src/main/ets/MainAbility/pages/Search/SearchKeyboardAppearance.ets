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

import { Entry, Row, Column, Component,ClickEvent, Button, Search, KeyboardAppearance } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct Index {
  @State text: string = 'As the sun begins to set, casting a warm golden hue across the sky,' +
    'the world seems to slow down and breathe a sigh of relief. The sky is painted with hues of orange, ' +
    ' pink, and lavender, creating a breathtaking tapestry that stretches as far as the eye can see.' +
    'The air is filled with the sweet scent of blooming flowers, mingling with the earthy aroma of freshly turned soil.' +
    'it casts a warm,' +
    'golden hue that spreads like liquid amber across the vast expanse of the sky.' +
    'The once-blue heavens gradually transform, ';

  @State searchIndex: Int = 0;
  @State searchArray: (KeyboardAppearance | undefined)[] = [
    KeyboardAppearance.IMMERSIVE, KeyboardAppearance.NONE_IMMERSIVE,
    KeyboardAppearance.DARK_IMMERSIVE, undefined, KeyboardAppearance.LIGHT_IMMERSIVE];
  @State searchArrayStr: string[] = ['IMMERSIVE', 'NONE_IMMERSIVE', 'DARK_IMMERSIVE', 'undefined', 'LIGHT_IMMERSIVE'];

  build() {
    Row(undefined) {
      Column(undefined) {
        Button('search KeyboardAppearance: ' + this.searchArrayStr[this.searchIndex])
          .onClick((e: ClickEvent)=>{
            this.searchIndex = ++this.searchIndex % this.searchArray.length;
          })
          .id('button_keyboardAppearance')
        Search({ value: this.text })
          .id('SearchTest')
          .height(56)
          .keyboardAppearance(this.searchArray[this.searchIndex])
      }.width('100%')
    }.height('100%')
  }
}