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
      .maxFontScale(undefined)
  }
}

@Observed
class SearchModifierDynamicSwitch implements AttributeModifier<SearchAttribute> {
  public isFontScaleDefined: boolean = true;

  applyNormalAttribute(instance: SearchAttribute): void {
    if (this.isFontScaleDefined) {
      instance.maxFontScale(1.1)
    } else {
      instance.maxFontScale(undefined)
    }
  }
}

@Entry
@Component
struct SearchMaxFontScaleModifier {
  private searchModifierUndefined: SearchModifierUndefined = new SearchModifierUndefined();
  @State private searchModifierDynamicSwitch: SearchModifierDynamicSwitch = new SearchModifierDynamicSwitch();

  build() {
    Column( { space: 10 } as ColumnOptions ) {

      Search({value: 'Search fontScale undefined'})
        .attributeModifier(this.searchModifierUndefined)
        .id('Search_MaxFontScale_Modifier_Undefined0')
      Search({ placeholder: `Search lineHeight ${this.searchModifierDynamicSwitch.isFontScaleDefined ? `1.1` : `undefined`}` })
        .attributeModifier(this.searchModifierDynamicSwitch)
        .id('Search_MaxFontScale_Modifier_Dynamic0')

      Text('isFontScaleDefined:' + this.searchModifierDynamicSwitch.isFontScaleDefined).height(30)
      Button('change isFontScaleDefined').onClick((event: ClickEvent) => {
        this.searchModifierDynamicSwitch.isFontScaleDefined = !this.searchModifierDynamicSwitch.isFontScaleDefined;
      })
        .margin(5)
        .id('Search_MaxFontScale_Modifier_Button0')

    }.width('100%')
  }
}