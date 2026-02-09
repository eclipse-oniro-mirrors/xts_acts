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
  Entry, Component, $r, Text, Row, Column, Color, ClickEvent, TextInput, TextArea, Span, Search,
  Button, InsertValue, DeleteValue, TextAlign, Font, AttributeModifier, SearchAttribute
} from '@ohos.arkui.component';
import {
  State,Observed
} from '@ohos.arkui.stateManagement'
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

@Observed
class SearchTextFontModifier implements AttributeModifier<SearchAttribute> {
  public isTextFont: boolean = false;
  public value: string = ''

  applyNormalAttribute(instance: SearchAttribute): void {
    instance.height(30)
    if(this.isTextFont){
      instance.textFont({ size: '10vp', weight: 800 })
    } else {
      instance.textFont(undefined)
    }
  }
}

@Entry
@Component
struct SearchOnDidDelete {
  @State searchTextFontModifier: SearchTextFontModifier = new SearchTextFontModifier();
  build() {
    Column() {

      Search()
        .id('isTextFontModifier')
        .width('95%')
        .height('10%')
        .attributeModifier(this.searchTextFontModifier)
      Button('change isTextFontModifier').id('isTextFontModifierButton')
        .onClick(() => {
          this.searchTextFontModifier.isTextFont = !this.searchTextFontModifier.isTextFont;
        })
        .fontSize(20)
        .height('5%')
    }.height('100%').width('100%');
  }
}