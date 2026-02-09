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

import {
  Entry,
  Component,
  TextMenuItem,
  ResourceStr,
  RichEditorController,
  RichEditorOptions,
  RichEditor,
  TextRange,
  Column,
  ColumnOptions,
  Row,
  TextMenuItemId,
  $r,
  Button,
  Search,
  TextInput,
  Color,
  Text,
  CopyOptions,
  ClickEvent,
  AttributeModifier,
  SearchAttribute,
  SearchSubmitCallback,
  EnterKeyType,
  SubmitEvent
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
class SearchModifier implements AttributeModifier<SearchAttribute> {
  @State state: boolean = false;
  @State content: boolean = false;
  applyNormalAttribute(instance: SearchAttribute): void {
    if (this.state == false) {
      instance.onSubmit(undefined);
    } else {
      instance.onSubmit((enterKey: string, event?: SubmitEvent) => {
        this.content = true;
      } as SearchSubmitCallback);
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
  @State textAreaModifier: SearchModifier = new SearchModifier();
  build() {
    Row() {
      Column( { space: 10 } as ColumnOptions ) {
        Text(`${this.textAreaModifier.content}`)
          .id('Text')
        Button(`onSubmit: ${this.textAreaModifier.state}`)
          .id('button_onSubmit')
          .width(240)
          .fontSize(16)
          .margin(10)
          .onClick((e: ClickEvent)=>{
            this.textAreaModifier.content = false;
            this.textAreaModifier.state = ! this.textAreaModifier.state;
          })

        Search({value: this.text})
          .attributeModifier(this.textAreaModifier)
          .height(56)
          .id('Search')
          .enterKeyType(EnterKeyType.Go)
        Search({value: ''})
          .id('Search2')

      }.width('100%')
    }
    .height('100%')
  }
}