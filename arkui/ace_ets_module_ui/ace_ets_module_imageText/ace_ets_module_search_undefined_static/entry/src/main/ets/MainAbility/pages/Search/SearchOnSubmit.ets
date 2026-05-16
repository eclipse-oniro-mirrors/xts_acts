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

import { Entry, Text, Column, Component, TextInput, Search, ColumnOptions, Row, ClickEvent, Button,
  FontStyle, FontWeight, CopyOptions, TextAlign, Color, CaretStyle, EnterKeyType, SearchSubmitCallback, SubmitEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct SearchExample {
  @State state: boolean = false;
  @State content: boolean = false;
  @State text: string = 'As the sun begins to set, casting a warm golden hue across the sky,' +
    'the world seems to slow down and breathe a sigh of relief. The sky is painted with hues of orange, ' +
    ' pink, and lavender, creating a breathtaking tapestry that stretches as far as the eye can see.' +
    'The air is filled with the sweet scent of blooming flowers, mingling with the earthy aroma of freshly turned soil.' +
    'it casts a warm,' +
    'golden hue that spreads like liquid amber across the vast expanse of the sky.' +
    'The once-blue heavens gradually transform, ';
  build() {
    Row(undefined) {
      Column( { space: 10 } as ColumnOptions ) {
        Text(`${this.content}`)
          .id('Text_SearchOnSubmit')
        Button(`onSubmit: ${this.state}`)
          .id('Button_SearchOnSubmit')
          .width(240)
          .fontSize(16)
          .margin(10)
          .onClick((e: ClickEvent)=>{
            this.content = false;
            this.state = ! this.state;
          })

        Search({value: this.text})
          .height(56)
          .id('Search_SearchOnSubmit')
          .enterKeyType(EnterKeyType.Go)
          .onSubmit(this.state ? (enterKey: string, event?: SubmitEvent) => {
            this.content = true;
         } as SearchSubmitCallback : undefined)
        Search({value: ''})
          .id('Search_SearchOnSubmit2')

      }.width('100%')
    }
    .height('100%')
  }
}