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

import { Entry, Row, Column, Component, Button, ClickEvent,
  Search, $r, Resource } from '@ohos.arkui.component'
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
  @State searchArray: (double |string | Resource | undefined)[] = [
    '2', undefined, 1.0, 0.0,$r('app.float.maxFontScale')];
  @State searchArrayStr: string[] = [ '2', 'undefined', '1.0', '0.0', '3.5'];

  build() {
    Row(undefined) {
      Column(undefined) {
        Button('search letterSpacing: ' + this.searchArrayStr[this.searchIndex])
          .onClick((e: ClickEvent)=>{
            this.searchIndex = ++this.searchIndex % this.searchArray.length;
          })
          .id('button_letterSpacing')
        Search({ value: this.text })
          .height(56)
          .letterSpacing(this.searchArray[this.searchIndex])
          .id('SearchTest')
      }.height('100%')
    }.width('100%')
  }
}