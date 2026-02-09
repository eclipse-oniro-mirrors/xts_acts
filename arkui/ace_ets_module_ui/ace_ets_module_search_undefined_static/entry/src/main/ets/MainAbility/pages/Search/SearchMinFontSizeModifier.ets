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


import { Entry, Text, Column, Component, Search, ColumnOptions, ClickEvent, Button,
  AttributeModifier, SearchAttribute, TextAlign } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class SearchModifierUndefined implements AttributeModifier<SearchAttribute> {
  applyNormalAttribute(instance: SearchAttribute): void {
    instance
      .height(15)
      .minFontSize(undefined)
      .maxFontSize(40.0)
  }
}

@Observed
class SearchModifierDynamicSwitch implements AttributeModifier<SearchAttribute> {
  public isMinFontSizeDefined: boolean = true;

  applyNormalAttribute(instance: SearchAttribute): void {
    instance
      .height(15)
      .maxFontSize(40.0)
    if (this.isMinFontSizeDefined) {
      instance.minFontSize(20.0)
    } else {
      instance.minFontSize(undefined)
    }
  }
}

@Entry
@Component
struct SearchMinFontSizeModifier {
  private searchModifierUndefined: SearchModifierUndefined = new SearchModifierUndefined();
  @State private searchModifierDynamicSwitch: SearchModifierDynamicSwitch = new SearchModifierDynamicSwitch();

  build() {
    Column( { space: 10 } as ColumnOptions ) {
      Search({ value: 'Search minFontSize undefined && height 15' })
        .attributeModifier(this.searchModifierUndefined)
        .id('Search_MinFontSize_Modifier_Undefined0')
      Search({value: `Search minFontSize ${this.searchModifierDynamicSwitch.isMinFontSizeDefined ? `20` : `undefined`}`})
        .attributeModifier(this.searchModifierDynamicSwitch)
        .id('Search_MinFontSize_Modifier_Dynamic0')

      Text('isMinFontSizeDefined:' + this.searchModifierDynamicSwitch.isMinFontSizeDefined).height(30)
      Button('change isMinFontSizeDefined').onClick((event: ClickEvent) => {
        this.searchModifierDynamicSwitch.isMinFontSizeDefined = !this.searchModifierDynamicSwitch.isMinFontSizeDefined;
      })
        .margin(5)
        .id('Search_MinFontSize_Modifier_Button0')
    }.width('100%')
  }
}