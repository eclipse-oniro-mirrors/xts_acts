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
  Entry, Component, $r, Text, Row, Column, Color, ClickEvent, TextInput, TextArea, Span, Search, Button, InsertValue,
  TextAlign, AttributeModifier, SearchAttribute
} from '@ohos.arkui.component';
import { State, AppStorage, Observed } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

@Observed
class SearchModifier implements AttributeModifier<SearchAttribute> {
  public count : Int = 0;
  public isCallback: Boolean = true;
  applyNormalAttribute(instance: SearchAttribute): void {
    instance.height(56)
    instance.onEditChange(this.isCallback ? undefined :
        (status: boolean) => {
          this.count++;
        })
  }
}

@Entry
@Component
struct Index {
  @State count : Int = 0;
  @State isCallback: Boolean = true;
  @State text: string = 'Hello World!!!!!!!!!!!!'
  @State searchModifier: SearchModifier = new SearchModifier()
  build() {
    Row(undefined) {
      Column(undefined) {
        Text('' + this.count + this.searchModifier.count)
          .id('SearchText').fontSize(10).width('100%').textAlign(TextAlign.Center).height('5%')

        Button('callback ' + this.isCallback ? 'false' : 'true')
          .id('change')
          .onClick((e: ClickEvent)=>{
            this.isCallback = !this.isCallback;
            this.searchModifier.isCallback = !this.searchModifier.isCallback;
          })

        Search({ value: this.text })
          .id('Search')
          .height(56)
          .onEditChange(this.isCallback ? undefined :
            (status: boolean) => {
              this.count++;
            })

        Text('Search Modifier')
        Search({ value: this.text })
          .id('Modifier')
          .attributeModifier(this.searchModifier)
      }.height('100%')
    }.width('100%')
  }
}