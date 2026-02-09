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
import { Entry, Row, Column, Component,Button, ClickEvent,
  Text, TextArea, TextInput, Search, ResourceStr, $r, LineBreakStrategy, CancelButtonOptions, CancelButtonSymbolOptions,
  CancelButtonStyle, IconOptions, SymbolGlyphModifier, Length, AttributeModifier, SearchAttribute, TextInputAttribute,
  IconOptions, Color, CopyOptions, Resource, Font, ResourceColor, TextAreaAttribute, Scroll
} from '@ohos.arkui.component'
import { State, AppStorage, Observed } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

@Observed
class SearchModifier implements AttributeModifier<SearchAttribute> {
  public index: Int = 0;
  applyNormalAttribute(instance: SearchAttribute): void {
    instance.height(56)
    if (this.index == 0) {
      instance.placeholderFont(undefined)
    } else if(this.index == 1) {
      instance.placeholderFont({size:10} as Font)
    } else if (this.index == 2) {
      instance.placeholderFont({size:20} as Font)
    } else if (this.index == 3) {
      instance.placeholderFont({size:40} as Font)
    } else if (this.index == 4) {
      instance.placeholderFont(undefined)
    }
  }
}

@Entry
@Component
struct Index {
  @State searchIndex: Int = 0;
  @State searchArray: (Font | undefined)[] = [
    undefined,
    {size:10} as Font,
    {size:20} as Font,
    {size:40} as Font,
    undefined];

  @State searchArrayStr: string[] = ['undefined', 'size:10', 'size:20', 'size:40', 'undefined']

  @State text: string = ''
  @State searchModifier: SearchModifier = new SearchModifier()

  build() {
    Row(undefined) {
      Scroll(undefined) {
        Column(undefined) {
          Button('search placeholderFont ' + this.searchArrayStr[this.searchIndex])
            .id('change')
            .onClick((e: ClickEvent) => {
              this.searchIndex = ++this.searchIndex % this.searchArray.length;
              this.searchModifier.index = ++this.searchModifier.index % this.searchArray.length;
            })

          Search({ value: this.text, placeholder: '6666666666666666' })
            .id('Search')
            .height(56)
            .placeholderFont(this.searchArray[this.searchIndex])

          Text('Search Modifier')
          Search({ value: this.text, placeholder: '6666666666666666' })
            .id('Modifier')
            .attributeModifier(this.searchModifier)
        }
      }.height('100%')
    }.width('100%')
  }
}