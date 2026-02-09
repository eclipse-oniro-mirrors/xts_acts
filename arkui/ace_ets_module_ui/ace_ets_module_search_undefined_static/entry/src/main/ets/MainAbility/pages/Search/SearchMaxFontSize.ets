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
  Entry, Component, $r, Text, Row, Column, Color, ClickEvent, TextInput, TextArea, Span, Search, Button,
  TextAlign, Resource, Scroll, AttributeModifier, SearchAttribute
} from '@ohos.arkui.component';
import { State, AppStorage, Observed } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

@Observed
class SearchModifier implements AttributeModifier<SearchAttribute> {
  public index: Int = 0;
  applyNormalAttribute(instance: SearchAttribute): void {
    instance.height(56)
    if (this.index == 0) {
      instance.maxFontSize(undefined)
    } else if(this.index == 1) {
      instance.maxFontSize(10.0)
    } else if (this.index == 2) {
      instance.maxFontSize('20')
    } else if (this.index == 3) {
      instance.maxFontSize($r('app.string.maxFontSize'))
    } else if (this.index == 4) {
      instance.maxFontSize(undefined)
    }
  }
}

@Entry
@Component
struct Index {
  @State searchIndex: Int = 0;
  @State searchArray: (number | string | Resource | undefined)[] = [
    undefined,
    10.0,
    '20',
    $r('app.string.maxFontSize'),
    undefined];
  @State searchArrayStr: string[] = ['undefined', '10.0', '20', '30', 'undefined']
  @State text: string = 'Hello World!!!!!!!!!!!!!!!!!!!!!!!!!'
  @State searchModifier: SearchModifier = new SearchModifier()
  build() {
    Row(undefined) {
      Scroll(undefined){
        Column(undefined) {
          Button('search maxFontSize' + this.searchArrayStr[this.searchIndex])
            .id('change')
            .onClick((e: ClickEvent)=>{
              this.searchIndex = ++this.searchIndex % this.searchArray.length;
              this.searchModifier.index = ++this.searchModifier.index % this.searchArray.length;
            })
          Search({ value: this.text })
            .id('Search')
            .height(56)
            .maxFontSize(this.searchArray[this.searchIndex])
            .minFontSize(10)

          Text('Search Modifier')
          Search({ value: this.text })
            .id('Modifier')
            .attributeModifier(this.searchModifier)
        }
      }.height('100%')
    }.width('100%')
  }
}
